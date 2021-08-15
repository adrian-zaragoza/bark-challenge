class Like < ApplicationRecord
  # validates that each like record has an author id and a dog id
  validates :author_id, :dog_id, presence:true
  # validates the like record that each dog that only have one like from the current_user
  validates :dog_id, uniqueness: { scope: :author_id }

  belongs_to :author,
    foreign_key: :author_id,
    class_name: "User"

  belongs_to :dog,
    foreign_key: :dog_id,
    class_name: "Dog"
  
end
