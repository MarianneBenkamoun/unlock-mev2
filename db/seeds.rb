# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?Profile.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?Course.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
#1#SERVICE 1

Ouverture_porte = Service.create(
  name: "Ouverture de porte",
  description: "",
  picture: Rails.root.join("app/javascript/images/ouverture.png").open,
  price: 200,
)

#2#SUBSERVICE 1
Porte_claqueee = Service.create(name:"Porte claquée",
  parent_id: 1, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
  price:1000,
  picture: Rails.root.join("app/javascript/images/porte_simple.png").open,
)


#3#SUBSUBSERVICES
Porte_blindee_porte_claquee= Service.create(name:"Porte blindée",parent_id: 2, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: Rails.root.join("app/javascript/images/strong_door.jpg").open)

#4

Porte_simple_porte_claquee= Service.create(name:"Porte simple",parent_id: 2, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: Rails.root.join("app/javascript/images/porte_simple.jpg").open


 )


#5#SUBSERVICE 2
Porte_fermee= Service.create(name:"Porte fermée à clef",parent_id: 1, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: Rails.root.join("app/javascript/images/locked_door.png").open)

#SUBSUBSERVICES
#6
Porte_blindee_porte_fermee= Service.create(name:"Porte blindée",parent_id: 5, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: Rails.root.join("app/javascript/images/strong_door.jpg").open)
#7
Porte_simple_porte_fermee= Service.create(name:"Porte simple",parent_id: 5, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: Rails.root.join("app/javascript/images/porte_simple.jpg").open
 )


# SERVICE 2
#8
Travaux_serrure = Service.create(
  name: "Travaux sur serrure",
  description: "",
  picture: Rails.root.join("app/javascript/images/pose_serrure.png").open
)

#SUBSERVICE 3
#9
Serrure_securite= Service.create(name:"Serrure de securité",parent_id: 8, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
  price:900,
   picture: Rails.root.join("app/javascript/images/strong_lock.png").open)
#10
#SUBSERVICE 4
Serrure_connectee= Service.create(name:"Serrure connectée",parent_id: 8, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:400,
 picture: Rails.root.join("app/javascript/images/connected_key.png").open)
#11
#SERVICE 3
Travaux_porte = Service.create(
  name: "Travaux porte",
  description: "",
  picture: Rails.root.join("app/javascript/images/travaux_porte.png").open)
#SUBSUBSERVICES


#12
#SUBSERVICE 6
Pose_Corniere = Service.create(name:"Pose de cornière anti-effraction", description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:400,
 parent_id: 11,
 picture: Rails.root.join("app/javascript/images/cornieres.png").open)


#13
#Subservice 7
Pose_porte_blindee= Service.create(name:"Installation de porte blindée", description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 parent_id: 11,
 picture: Rails.root.join("app/javascript/images/travaux_strong_door.png").open)


#14
#Subservice 8

Installation_judas= Service.create(name:"Installation de judas", description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 parent_id: 11,
 picture: Rails.root.join("app/javascript/images/judas.jpg").open
)



#SERVICE 4
#15
Coffre_fort = Service.create(
   name: "Coffre fort",
  description: "",
  picture: Rails.root.join("app/javascript/images/coffre_moyen.png").open
  )
#16
Coffre_fort_petit = Service.create(
   name: "Petit coffre fort",
   parent_id:15,
  description: "",
    picture: Rails.root.join("app/javascript/images/coffre_petit.jpg").open
  )
#17
Coffre_fort_moyen = Service.create(
   name: "Moyen coffre fort",
  description: "",
  parent_id:15,
  picture: Rails.root.join("app/javascript/images/coffre_moyen.png").open
  )
#18
Coffre_fort_grand = Service.create(
  name: "Grand coffre fort",
  description: "",
  parent_id:15,
  picture: Rails.root.join("app/javascript/images/coffre_gros.jpg").open
  )

#SERVICE 5
#19
Double_clefs = Service.create(
  name: "Double de clefs",
  description: "",
  picture: Rails.root.join("app/javascript/images/double_clef.png").open
  )
#SUBSERVICE
#20
Clef_simple = Service.create(
  name: "Clef simple",
  description: "",
  parent_id:19,
  picture: Rails.root.join("app/javascript/images/simple_key.png").open
  )
#21
Clef_compliquee = Service.create(
  name: "Clef compliquée",
  description: "",
  parent_id:19,
  picture: Rails.root.join("app/javascript/images/complicated_key.png").open
  )
