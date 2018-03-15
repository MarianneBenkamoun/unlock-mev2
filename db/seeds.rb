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
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521125465/Copie_de_ouverture_de_portes_simples_ywtliw.jpg",
  price: 200,
)

#2#SUBSERVICE 1
Porte_claqueee = Service.create(name:"Porte claquee",
  parent_id: 1, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
  price:1000,
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129153/porte_claqu%C3%A9e_ns5ssh.jpg",
)


#3#SUBSUBSERVICES
Porte_blindee_porte_claquee= Service.create(name:"Porte blindee",parent_id: 2, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129221/Copie_de_porte_blind%C3%A9e_gzokhx.jpg")

#4
Porte_simple_porte_claquee= Service.create(name:"Porte simple",parent_id: 2, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129153/porte_claqu%C3%A9e_ns5ssh.jpg")


#5#SUBSERVICE 2
Porte_fermee= Service.create(name:"Porte fermee a clef",parent_id: 1, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129316/porte_claqu%C3%A9e_ferm%C3%A9e_%C3%A0_clef_ytbbos.jpg")

#SUBSUBSERVICES
#6
Porte_blindee_porte_fermee= Service.create(name:"Porte blindee",parent_id: 5, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129221/Copie_de_porte_blind%C3%A9e_gzokhx.jpg")
#7
Porte_simple_porte_fermee= Service.create(name:"Porte simple",parent_id: 5, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129153/porte_claqu%C3%A9e_ns5ssh.jpg")


# SERVICE 2
#8
Travaux_serrure = Service.create(
  name: "Travaux sur serrure",
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521125567/Copie_de_installation_de_serrure_ysh2tw.jpg",
)

#SUBSERVICE 3
#9
Serrure_securite= Service.create(name:"Serrure de securité",parent_id: 8, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
  price:900, picture:"http://res.cloudinary.com/dult7c9dw/image/upload/v1521129557/serrure_s%C3%A9curis%C3%A9e_jitdyh.jpg")
#10
#SUBSERVICE 4
Serrure_connectee= Service.create(name:"Serrure connectée",parent_id: 8, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:400,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129606/serrure_connect%C3%A9e_2_ventoe.jpg")

#11
#SERVICE 3
Travaux_porte = Service.create(
  name: "Travaux porte",
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521125622/Copie_de_r%C3%A9paration_de_portes_akjkqs.jpg")
#SUBSUBSERVICES


#12
#SUBSERVICE 6
Pose_Corniere = Service.create(name:"Pose de cornière anti-effraction",parent_id: 12, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:400, picture:"http://res.cloudinary.com/dult7c9dw/image/upload/c_scale,w_1659/v1521129889/pause_de_corni%C3%A8res_q09y3l.jpg")


#13
#Subservice 7
Pose_porte_blindee= Service.create(name:"Installation de porte blindée",parent_id:13, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521129982/r%C3%A9paration_de_porte_blind%C3%A9e_mhhec9.jpg")

#14
#Subservice 8

Installation_judas= Service.create(name:"Installation de judas",parent_id:13, description:"Une fois votre commande validee, un serrurier vous contactera par sms. Verifiez que vos informations sont correctes.",
 price:500,
 picture: "http://res.cloudinary.com/dult7c9dw/image/upload/b_rgb:000000/v1521130265/JUDAS_2_1_r2auio.jpg")



#SERVICE 4
#15
Coffre_fort = Service.create(
   name: "Coffre fort",
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521125661/Copie_de_moyen_Coffre_fort_emp0gt.jpg",
  )
#16
Coffre_fort_petit = Service.create(
   name: "Petit coffre fort",
   parent_id:15,
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521131339/petit_Coffre_fort_ye2gp3.jpg",
  )
#17
Coffre_fort_moyen = Service.create(
   name: "Petit coffre fort",
  description: "",
  parent_id:15,
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521125661/Copie_de_moyen_Coffre_fort_emp0gt.jpg",
  )
#18
Coffre_fort_grand = Service.create(
  name: "Petit coffre fort",
  description: "",
  parent_id:15,
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521131389/Coffre_fort_ymyrbu.jpg",
  )

#SERVICE 5
#19
Double_clefs = Service.create(
  name: "Double de clefs",
  description: "",
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521125697/Copie_de_double_de_clef_zfnyru.jpg",
  )
#SUBSERVICE
#20
Clef_simple = Service.create(
  name: "Clef simple",
  description: "",
  parent_id:19,
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521131986/clef_simple_yay01m.jpg",
  )
#21
Clef_compliquee = Service.create(
  name: "Clef compliquée",
  description: "",
  parent_id:19,
  picture: "http://res.cloudinary.com/dult7c9dw/image/upload/v1521131986/clef_compliqu%C3%A9e_mrnd1o.jpg",
  )

