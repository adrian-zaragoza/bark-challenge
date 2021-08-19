# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_or_initialize_by(email: "adrian@gmail.com")
user.password = '123456'
user.save!

dogs = [
  {
    name: 'Bowie',
    description: 'Bowie dances when he walks',
    owner_id: user.id
  },
  {
    name: 'Brownie',
    description: 'Brownie only sits pretty',
    owner_id: user.id
  },
  {
    name: 'Jax',
    description: '',
    owner_id: user.id
  },
  {
    name: 'Jiro',
    description: 'Jiro takes a long time to destroy his toys',
    owner_id: user.id
  },
  {
    name: 'Pete',
    description: 'Pete has a best friend named Lua',
    owner_id: user.id
  },
  {
    name: 'Bijou',
    description: 'Bijou is the fluffiest of them all',
    owner_id: user.id
  },
    {
    name: 'Britta',
    description: 'Britta has two different colored eyes',
    owner_id: user.id
  },
  {
    name: 'Noodle',
    description: 'Noodle is an Instagram celebrity',
    owner_id: user.id
  },
  {
    name: 'Stella',
    description: 'Stella loves to dig',
    owner_id: user.id
  },
  {
    name: 'Tonks',
    description: 'Tonks loves to run',
    owner_id: user.id
  },
]


dogs.each do |dog|
  dog = Dog.find_or_create_by(name: dog[:name], description: dog[:description], owner_id: dog[:owner_id])
  directory_name = File.join(Rails.root, 'db', 'seed', "#{dog[:name].downcase}", "*")

  Dir.glob(directory_name).each do |filename|
    if !dog.images.any?{|i| i.filename == filename}
      dog.images.attach(io: File.open(filename), filename: filename.split("/").pop)
      sleep 1
    end
  end
end
