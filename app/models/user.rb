class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, foreign_key: 'author_id'
  has_many :entities, foreign_key: 'author_id'
  attribute :photo, :string
  validates :name, presence: true, length: { maximum: 50 }
end
