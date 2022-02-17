class List < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :bookmarks, through: :movies

  validates :name, presence: true
  validates :name, uniqueness: true
end
