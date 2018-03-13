# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?Profile.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?Course.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Ouverture_porte = Service.create(
  name: "Ouverture de porte",
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1517872064/148049_t0qeen.svg",

)

Rideau_metallique = Service.create(
  name: "Rideau metallique",
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1517871150/222411_hopl3b.png",
)


Travaux_porte_ou_serrure = Service.create(
  name: "Travaux porte ou serrure",
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1517871773/675558_p7j6ju.png",
)

Porte_fracturee = Service.create(
   name: "Porte fracturee",
  description: "",
  picture: "https://res.cloudinary.com/dult7c9dw/image/upload/v1517434819/jalrddvu4fujmoj2fy1a.png",
  )
