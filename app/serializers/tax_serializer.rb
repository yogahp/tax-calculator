# Serializer for tax
class TaxSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :tax_code, :type, :amount, :tax_amount, :total_amount
end
