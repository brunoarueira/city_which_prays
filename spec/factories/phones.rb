FactoryGirl.define do
  factory :phone do
    ddd 22
    number "999999999"
    kind { Phone.kinds[:cell] }
    whatsapp true

    trait :residential do
      kind { Phone.kinds[:residential] }
      whatsapp nil
    end
  end
end
