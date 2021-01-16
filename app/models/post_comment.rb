class PostComment < ApplicationRecord
  belongs_to :master_dish
  belongs_to :customer
end
