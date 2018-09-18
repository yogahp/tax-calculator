FactoryBot.define do
  factory :tax do
    name { "MyString" }
    tax_code { 1 }
    amount { 1.5 }
    tax_amount { 1.5 }
    total_amount { 1.5 }
  end
end
