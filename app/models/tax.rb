# Handling tax communication with database
class Tax < ApplicationRecord
  include RescueUniqueConstraint
  rescue_unique_constraint index: 'index_taxes_on_name_and_tax_code', field: 'name'

  CODES = {
    1 => :food,
    2 => :tobacco,
    3 => :entertainment
  }.freeze

  validates :name, :tax_code, :amount, presence: true
  validates :amount, :tax_amount, :total_amount, numericality: { only_float: true }
  validates :tax_code, inclusion: { in: CODES.keys }

  before_validation :calculate_tax_amount, if: -> { amount }
  before_validation :calculate_total_amount, if: -> { amount && tax_amount }

  def type
    CODES[tax_code]
  end

  private

  def calculate_tax_amount
    case type
    when :food
      self.tax_amount = amount * 10 / 100
    when :tobacco
      self.tax_amount = (amount * 2 / 100) + 10
    when :entertainment
      self.tax_amount = entertainment_tax
    end
  end

  def calculate_total_amount
    self.total_amount = tax_amount + amount
  end

  def entertainment_tax
    if amount >= 100
      (amount - 100) * 1 / 100
    else
      0
    end
  end
end
