# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
#...
Product.create(title: 'Sample Product',
  description:
    %{<p>
      <em>Sample Description</em>
      Here you will see details about the product on offer.
    </p>},
  image_url: 'sample_photo.jpg',
  price: 18.50)
#...
