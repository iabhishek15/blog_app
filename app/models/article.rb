class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  def telling
    puts "are we entering into this"
  end
end
