class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :entities

  validates :name, :icon, presence: true

  def self.total_amount(user)
    total_amount = 0
    @categories = Category.where(author_id: user) || []
    @categories.each do |category|
      amount = category.entities.sum(:amount)
      total_amount += amount
    end
    total_amount
  end
end
