# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create{[{ name: "Star Wars" }, { name: "Lord of the Rings" }]}
#   Character.create(name: "Luke", movie: movies.first)
  puts "Deleting activities..."
  Activity.destroy_all
  puts "Creating activity #1..."
  activity1 = Activity.create!(
    average_rating: 4.6,
    name: "Plaza Mayor",
    address: "Pl. Mayor, 28012 Madrid, Espagne",
    description: "La Plaza Mayor (en français, équivalent de «grand-place») est une place de la ville de Madrid, en Espagne.",
    city: "Madrid",
    country: "Espagne",
  )
  activity1.category_list.add("Sites historiques", "Monuments et points d'intérêt")
  activity1.save

  puts "Creating activity #2"
  activity2 = Activity.create!(
    average_rating: 4.8,
    name: "Parc du Retiro",
    address: "28009 Madrid, Espagne",
    description: "Le parc du Retiro est un grand parc de 125 hectares et plus de 15 000 arbres situé à Madrid. Il fut créé entre 1630 et 1640.",
    city: "Madrid",
    country: "Espagne",
  )
  activity2.category_list.add("Parcs et jardins")
  activity2.save

  puts "Creating activity #3"
  activity3 = Activity.create!(
    average_rating: 4.7,
    price_per_visitor: 15,
    name: "Musée du Prado",
    address: "C. de Ruiz de Alarcón, 23, 28014 Madrid, Espagne",
    description: "Le Musée du Prado est le musée le plus célèbre de Madrid et un des musées d'art les plus importants du monde. Il a été construit par Juan de Villanueva et a été inauguré en 1819.",
    phone_number: "+34 913 30 28 00",
    website: "https://www.museodelprado.es/",
    city: "Madrid",
    country: "Espagne",
  )
  activity3.category_list.add("Musées")
  activity3.save

  puts "Creating activity #4"
  activity4 = Activity.create!(
    average_rating: 4.6,
    price_per_visitor: 12,
    name: "Palais Royal de Madrid",
    address: "C. de Bailén, s/n, 28071 Madrid, Espagne",
    description: "Le palais royal de Madrid (Palacio Real de Madrid) est la résidence officielle du roi d'Espagne. Les rois actuels ne résident pas en son sein, mais plutôt au palais de la Zarzuela. Le palais royal est utilisé pour des fonctions protocolaires.»",
    phone_number: "+34 914 54 87 00",
    website: "https://www.patrimonionacional.es/visita/palacio-real-de-madrid",
    city: "Madrid",
    country: "Espagne",
  )
  activity4.category_list.add("Sites historiques", "Monuments et points d'intérêt")
  activity4.save

  puts "Creating activity #5"
  activity5 = Activity.create!(
    average_rating: 4.4,
    name: "Marché de San Miguel",
    address: "Pl. de San Miguel, s/n, 28005 Madrid, Espagne",
    description: "Situé sur la Place de San Miguel, juste à côté la Place Mayor, le Marché de San Miguel est un agréable marché gastronomique qui conserve sa structure originale en fer, datant du début du XXe siècle.",
    phone_number: "34 915 42 49 36",
    website: "https://www.madrid.fr/marche-san-miguel",
    city: "Madrid",
    country: "Espagne",
  )
  activity5.category_list.add("Marchés", "Monuments et points d'intérêt")
  activity5.save

  puts "Creating activity #6"
  activity6 = Activity.create!(
    average_rating: 4.5,
    price_per_visitor: 12,
    closed_day: 2,
    name: "Musée Reina Sofia",
    address: "C. de Sta. Isabel, 52, 28012 Madrid, Espagne",
    description: "Le Musée National Centre d’Art Reina Sofía est l’un des musées les plus importants de Madrid et offre aux visiteurs une vaste collection d’œuvres d’art contemporain espagnol, comme le Guernica.",
    phone_number: "+34 917 74 10 00",
    website: "https://www.museoreinasofia.es/",
    city: "Madrid",
    country: "Espagne",
  )
  activity6.category_list.add("Musées")
  activity6.save

  puts "Creating activity #7"
  activity7 = Activity.create!(
    average_rating: 4.7,
    price_per_visitor: 3,
    closed_day: 1,
    name: "Musée Sorolla",
    address: "P.º del Gral. Martínez Campos, 37, 28010 Madrid, Espagne",
    description: "Situé dans un agréable Hotêl Particulier entouré d'un jardin particulier buccolique, le Musée de Sorolla est une maison musée qui conserve encore une grande partie de sa décoration. C'est un véritable plaisir de parcourir les séjours du musée tout en admirant les pièces maîtresses de l'artiste.",
    phone_number: "+34 913 10 15 84",
    website: "https://www.culturaydeporte.gob.es/msorolla/inicio.html",
    city: "Madrid",
    country: "Espagne",
  )
  activity7.category_list.add("Musées")
  activity7.save

  puts "Creating activity #8"
  activity8 = Activity.create!(
    average_rating: 4.6,
    name: "Puerta del Sol",
    address: "PlazaPuerta del Sol, 28013",
    description: "La Puerta del Sol est l'une des places les plus connues et les plus animées de Madrid, en Espagne.",
    city: "Madrid",
    country: "Espagne",
  )
  activity8.category_list.add("Monuments et points d'intérêt", "Sites historiques")
  activity8.save

  puts "Creating activity #9"
  activity9 = Activity.create!(
    average_rating: 4.6,
    price_per_visitor: 1,
    name: "Cathédrale de la Almudena",
    address: "C. de Bailén, 10, 28013 Madrid, Espagne",
    description: "La cathédrale Santa María la Real de la Almudena est la toute récente cathédrale de Madrid, capitale du royaume d'Espagne, construite face au palais royal au cours du XXᵉ siècle. Elle est le siège épiscopal du diocèse de la capitale.",
    phone_number: "+34 915 42 22 00",
    website: "https://catedraldelaalmudena.es/",
    city: "Madrid",
    country: "Espagne",
  )
  activity9.category_list.add("Monuments et points d'intérêt", "Sites historiques")
  activity9.save

  puts "Creating activity #10"
  activity10 = Activity.create!(
    average_rating: 4.3,
    price_per_visitor: 6,
    name: "Jardin botanique royal de Madrid",
    address: "Pl. Murillo, 2, 28014 Madrid, Espagne",
    description: "Avec plus de 5 000 différentes espèces de plantes réparties sur une terrasse de 4 niveaux, le Jardin Royal Botanique de Madrid est un agréable poumon vert, situé juste à côté du Musée du Prado.",
    phone_number: "+34 914 20 30 17",
    website: "https://rjb.csic.es/",
    city: "Madrid",
    country: "Espagne",
  )
  activity10.category_list.add("Monuments et points d'intérêt", "Sites historiques", "Parcs et jardins")
  activity10.save
