class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #association to the Dogs table
  has_many :dogs,
    foreign_key: :owner_id,
    class_name: "Dog"

  has_many :liked_dogs,
    foreign_key: :author_id,
    class_name: "Like"

  
end
