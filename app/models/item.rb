class Item < ApplicationRecord
  has_many :messages
  has_one_attached :image
       
  validates :title, presence: true
  validates :text,  presence: true
  validates :image, presence: true
end