class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  attachment :image

  def self.search(search, word)
    @customer = Customer.where("name LIKE?","%#{word}%") if name.present?
  end
end
