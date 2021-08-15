class Like < ApplicationRecord
  validates :author_id, :dog_id, presence:true
  validates :dog_id, uniqueness: { scope: :author_id }

  belongs_to :author,
    foreign_key: :author_id,
    class_name: "User"

  belongs_to :dog,
    foreign_key: :dog_id,
    class_name: "Dog"
  
end
