class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comment, dependent: :destroy

  def telling
    puts "are we entering into this"
  end
end
