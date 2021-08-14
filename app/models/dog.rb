class Dog < ApplicationRecord
  has_many_attached :images

  def self.dogs_pages(current_page = 1, dogs_per_page)
    return self.limit(dogs_per_page).offset((current_page - 1) * dogs_per_page)
  end
end
