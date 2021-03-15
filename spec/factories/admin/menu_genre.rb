FactoryBot.define do
  factory :menu_genre do
    name { "肉類" }
  end

  factory :menu_genre_vegetable, class: MenuGenre do
    name {"野菜類"}
  end
end