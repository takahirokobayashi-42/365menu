FactoryBot.define do
  factory :genre do
    name { "肉類" }
  end

  factory :genre_vegetable, class: Genre do
    name {"野菜類"}
  end
end