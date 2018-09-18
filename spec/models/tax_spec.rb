require 'rails_helper'

RSpec.describe Tax, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)  }
    it { is_expected.to validate_presence_of(:tax_code)  }
    it { is_expected.to validate_presence_of(:amount)  }

    it { is_expected.to validate_numericality_of(:amount) }
    it { is_expected.to validate_numericality_of(:tax_amount) }
    it { is_expected.to validate_numericality_of(:total_amount) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:tax_code).of_type(:integer) }
    it { is_expected.to have_db_column(:amount).of_type(:float) }
    it { is_expected.to have_db_column(:tax_amount).of_type(:float) }
    it { is_expected.to have_db_column(:total_amount).of_type(:float) }
  end

  describe 'food calculator' do
    let(:tax) { create :tax, name: "Big Mac", tax_code: 1, amount: 1000 }

    it { expect(tax.tax_amount).to eql 100.0 }
    it { expect(tax.total_amount).to eql 1100.0 }
  end

  describe 'tobacco calculator' do
    let(:tax) { create :tax, name: "Lucky Strike", tax_code: 2, amount: 1000  }

    it { expect(tax.tax_amount).to eql 30.0 }
    it { expect(tax.total_amount).to eql 1030.0 }
  end

  describe 'entertaintment calculator' do
    context 'tax free' do
      let(:tax) { create :tax, name: "Movie", tax_code: 3, amount: 50 }

      it { expect(tax.tax_amount).to eql 0.0 }
      it { expect(tax.total_amount).to eql 50.0 }
    end

    context 'taxable' do
      let(:tax) { create :tax, name: "Movie", tax_code: 3, amount: 1000 }

      it { expect(tax.tax_amount).to eql 9.0 }
      it { expect(tax.total_amount).to eql 1009.0 }
    end
  end
end
