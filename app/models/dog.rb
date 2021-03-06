class Dog < ApplicationRecord
  has_many_attached :images

  #association to the Users table.
  # belongs to adds validation
  belongs_to :owner,
    foreign_key: :owner_id,
    class_name: "User"

  has_many :likes,
    foreign_key: :dog_id,
    class_name: "Like"

  def self.dogs_pages(current_page = 1, dogs_per_page)
    # will return the limit of dogs per page and will only return entries starting form the current page minus 1 times the dogs per page. 
    return self.limit(dogs_per_page).offset((current_page - 1) * dogs_per_page)
  end
end
