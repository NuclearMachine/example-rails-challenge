FactoryBot.define do
  factory :credit_card_charge do
    paid { true }
    amount { rand(69..6969) }
    currency { 'usd' }
    refunded { false }
    customer { create(:customer) }

    trait :successful do
      paid { true }
      refunded { false }
    end

    trait :failed do
      paid { false }
      refunded { false }
    end

    trait :disputed do
      paid { true }
      refunded { true }
    end
  end
end
