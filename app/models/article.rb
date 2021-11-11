class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def telling
    puts "are we entering into this"
  end
end
