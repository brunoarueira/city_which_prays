FactoryGirl.define do
  factory :phone do
    ddd 22
    number "999999999"
    kind { Phone.kinds[:cell] }
    whatsapp true

    trait :residential do
      number "99999999"
      kind { Phone.kinds[:residential] }
      whatsapp nil
    end
  end
end
