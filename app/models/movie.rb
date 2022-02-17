class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :list
  validates :title, uniqueness: true
  before_destroy :prevent_destroy

  private

  def prevent_destroy
    if bookmarks.count > 0
      errors.add_to_base("cannot delete movie while bookmarks exist")
      return false
    end
  end
end
