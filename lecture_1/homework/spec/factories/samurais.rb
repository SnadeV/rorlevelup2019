FactoryBot.define do
  factory :samurai do
    name { Faker::Games::Witcher.witcher }
    armor_quality { Faker::Number.within(0..1000) }
    battle_count { Faker::Number.within(0..100) }
    joined_at { Faker::Date.between(30.days.ago, Date.today) }
    died_at nil
    clan_id nil
  end
end