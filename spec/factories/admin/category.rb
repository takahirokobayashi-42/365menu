FactoryBot.define do
  factory :category do
    name { "肉類" }
  end

  factory :category_vegetable, class: Category do
    name {"野菜類"}
  end
end