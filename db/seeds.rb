# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Deleting all instances..."
Activity.destroy_all
User.destroy_all

puts "Creating user..."
User.create(
  first_name: "Amélie",
  last_name: "Poulain",
  email: "amelie.poulain@test.com",
  password: "1234567"
)

puts "Creating trip #1..."
trip1 = Trip.create!(
  user: User.first,
  trip_name: "Madrid",
  starting_date: '2023-01-05',
  ending_date: '2023-01-06',
  budget: 200
)

puts "Creating trip #2..."
trip2 = Trip.create!(
  user: User.first,
  trip_name: "Paris",
  starting_date: '2023-03-02',
  ending_date: '2023-03-07',
  budget: 500
)

puts "Creating trip #3..."
trip3 = Trip.create!(
  user: User.first,
  trip_name: "Londres",
  starting_date: '2022-12-16',
  ending_date: '2022-12-18',
  budget: 2000
)

puts "Creating trip #4..."
trip4 = Trip.create!(
  user: User.first,
  trip_name: "Venise",
  starting_date: '2023-01-10',
  ending_date: '2023-01-15',
  budget: 1000
)


puts "Creating activity #1..."
activity1 = Activity.create!(
  average_rating: 4.6,
  opening_hour: DateTime.now.beginning_of_day,
  closing_hour: DateTime.now.end_of_day,
  name: "Plaza Mayor",
  address: "Pl. Mayor, 28012 Madrid, Espagne",
  description: "La Plaza Mayor (en français, équivalent de «grand-place») est une place de la ville de Madrid, en Espagne.",
  city: "Madrid",
  country: "Espagne",
  duration: 1.5
)

["https://photo620x400.mnstatic.com/37b45dfad008ade38c1986be2e30a158/plaza-mayor.jpg",
  "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/03/1024px-plaza_mayor_de_madrid_06.jpg",
  "https://traveldigg.com/wp-content/uploads/2016/09/Plaza-Mayor-Cafe.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity1.photos.attach(io: file, filename: "#{activity1.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

# file1 = URI.open("https://photo620x400.mnstatic.com/37b45dfad008ade38c1986be2e30a158/plaza-mayor.jpg")
# file2 = URI.open("https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2017/03/1024px-plaza_mayor_de_madrid_06.jpg")
# file3 = URI.open("https://traveldigg.com/wp-content/uploads/2016/09/Plaza-Mayor-Cafe.jpg")

# activity1.photo.attach(io: file1, filename: "PlazaMayor.jpg", content_type: "image/jpeg")
# activity1.photo.attach(io: file2, filename: "PlazaMayor2.jpg", content_type: "image/jpeg")
# activity1.photo.attach(io: file3, filename: "PlazaMayor3.jpg", content_type: "image/jpeg")


puts "Creating activity #2..."
activity2 = Activity.create!(
  average_rating: 4.8,
  opening_hour: DateTime.now.beginning_of_day + 5.hour,
  closing_hour: DateTime.now.beginning_of_day + 21.hour,
  name: "Parc du Retiro",
  address: "28009 Madrid, Espagne",
  description: "Le parc du Retiro est un grand parc de 125 hectares et plus de 15 000 arbres situé à Madrid. Il fut créé entre 1630 et 1640.",
  city: "Madrid",
  country: "Espagne",
  duration: 4
)
["https://photo620x400.mnstatic.com/63b94c01337b9c7cad49217264b406d2/parc-du-retiro.jpg",
  "http://www.joliscircuits.com/wp-content/uploads/2016/11/DSC09744-1024x680.jpg",
  "https://audrey-laure.com/wp-content/uploads/2017/06/parc-du-retiro-madrid.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity2.photos.attach(io: file, filename: "#{activity2.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

# activity2.photos.attach(io: file1, filename: "ParcDuRetiro.jpg", content_type: "image/jpeg")
# activity2.photos.attach(io: file2, filename: "ParcDuRetiro2.jpg", content_type: "image/jpeg")
# activity2.photos.attach(io: file3, filename: "ParcDuRetiro3.jpg", content_type: "image/jpeg")



puts "Creating activity #3..."
activity3 = Activity.create!(
  average_rating: 4.7,
  price_per_visitor: 15,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 19.hour,
  name: "Musée du Prado",
  address: "C. de Ruiz de Alarcón, 23, 28014 Madrid, Espagne",
  description: "Le Musée du Prado est le musée le plus célèbre de Madrid et un des musées d'art les plus importants du monde. Il a été construit par Juan de Villanueva et a été inauguré en 1819.",
  phone_number: "+34 913 30 28 00",
  website: "https://www.museodelprado.es/",
  city: "Madrid",
  country: "Espagne",
  duration: 3.5
)

["https://cdn.generationvoyage.fr/2017/03/interieur-musee-prado-madrid.jpg",
  "https://www.spain.info/export/sites/segtur/.content/images/cabeceras-grandes/madrid/Museo-Prado-2-c-Jose-Barea-Turismo-Madrid.jpg",
  "https://madrid-discovery.com/wp-content/uploads/2020/05/museo-del-prado.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity3.photos.attach(io: file, filename: "#{activity3.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #4..."
activity4 = Activity.create!(
  average_rating: 4.6,
  price_per_visitor: 12,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 17.hour,
  name: "Palais Royal de Madrid",
  address: "C. de Bailén, s/n, 28071 Madrid, Espagne",
  description: "Le palais royal de Madrid (Palacio Real de Madrid) est la résidence officielle du roi d'Espagne. Les rois actuels ne résident pas en son sein, mais plutôt au palais de la Zarzuela. Le palais royal est utilisé pour des fonctions protocolaires.»",
  phone_number: "+34 914 54 87 00",
  website: "https://www.patrimonionacional.es/visita/palacio-real-de-madrid",
  city: "Madrid",
  country: "Espagne",
  duration: 1.5
)

["https://www.antoon.fr/wp-content/uploads/2022/04/palais-royal-madrid.jpg",
  "https://traveldigg.com/wp-content/uploads/2016/09/Royal-Palace-of-Madrid-Pictures.jpg",
  "https://traveldigg.com/wp-content/uploads/2016/09/Royal-Palace-of-Madrid-Inside-Photo.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity4.photos.attach(io: file, filename: "#{activity4.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #5..."
activity5 = Activity.create!(
  average_rating: 4.4,
  opening_hour: DateTime.now.beginning_of_day,
  closing_hour: DateTime.now.end_of_day,
  name: "Marché de San Miguel",
  address: "Pl. de San Miguel, s/n, 28005 Madrid, Espagne",
  description: "Situé sur la Place de San Miguel, juste à côté la Place Mayor, le Marché de San Miguel est un agréable marché gastronomique qui conserve sa structure originale en fer, datant du début du XXe siècle.",
  phone_number: "34 915 42 49 36",
  website: "https://www.madrid.fr/marche-san-miguel",
  city: "Madrid",
  country: "Espagne",
  duration: 1.5
)
["https://guias-viajar.com/madrid/wp-content/uploads/sites/7/2018/04/madrid-mercado-san-miguel-17.jpg",
  "https://mercadodesanmiguel.es/wp-content/uploads/2018/08/El-Se%C3%B1or-Mart%C3%ADn.jpg",
  "https://t9n5u6t8.rocketcdn.me/wp-content/uploads/2020/04/Mercado-de-San-Miguel-Madrid.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity5.photos.attach(io: file, filename: "#{activity5.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #6..."
activity6 = Activity.create!(
  average_rating: 4.5,
  price_per_visitor: 12,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 20.hour,
  closed_day: 2,
  name: "Musée Reina Sofia",
  address: "C. de Sta. Isabel, 52, 28012 Madrid, Espagne",
  description: "Le Musée National Centre d’Art Reina Sofía est l’un des musées les plus importants de Madrid et offre aux visiteurs une vaste collection d’œuvres d’art contemporain espagnol, comme le Guernica.",
  phone_number: "+34 917 74 10 00",
  website: "https://www.museoreinasofia.es/",
  city: "Madrid",
  country: "Espagne",
  duration: 2.5
)
["https://cdn-imgix.headout.com/tour/29151/TOUR-IMAGE/d074498b-a347-4558-bf6b-ea991d7f8034-15563-madrid-reina-sofi-a-museum-guided-tour-with-proffesional-guide-01.jpg",
  "https://tourscanner.com/blog/wp-content/uploads/2019/05/Reina-Sofia-Museum-tickets-price.png",
  "https://tourscanner.com/blog/wp-content/uploads/2019/05/Reina-Sofia-Museum-tickets-price.png"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity6.photos.attach(io: file, filename: "#{activity6.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #7..."
activity7 = Activity.create!(
  average_rating: 4.7,
  price_per_visitor: 3,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 19.hour,
  closed_day: 1,
  name: "Musée Sorolla",
  address: "P.º del Gral. Martínez Campos, 37, 28010 Madrid, Espagne",
  description: "Situé dans un agréable Hotêl Particulier entouré d'un jardin particulier buccolique, le Musée de Sorolla est une maison musée qui conserve encore une grande partie de sa décoration. C'est un véritable plaisir de parcourir les séjours du musée tout en admirant les pièces maîtresses de l'artiste.",
  phone_number: "+34 913 10 15 84",
  website: "https://www.culturaydeporte.gob.es/msorolla/inicio.html",
  city: "Madrid",
  country: "Espagne",
  duration: 1.5
)
["https://espagnefascinante.fr/wp-content/uploads/shutterstock_1223904955-1.jpg",
  "https://media.cntraveler.com/photos/580fd2e06b5a595447204a55/16:9/w_2240,c_limit/MuseoSorolla-Getty460862363.jpg",
  "https://www.shmadrid.com/blog/en/wp-content/uploads/2015/08/garden.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity7.photos.attach(io: file, filename: "#{activity7.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #8..."
activity8 = Activity.create!(
  average_rating: 4.6,
  opening_hour: DateTime.now.beginning_of_day,
  closing_hour: DateTime.now.end_of_day,
  name: "Puerta del Sol",
  address: "PlazaPuerta del Sol, 28013",
  description: "La Puerta del Sol est l'une des places les plus connues et les plus animées de Madrid, en Espagne.",
  city: "Madrid",
  country: "Espagne",
  duration: 2
)
["https://fotografias.lasexta.com/clipping/cmsimages01/2021/11/22/80443BD5-CFE6-4395-8585-D36F147B3053/98.jpg",
  "https://sites.google.com/site/visiteguideedemadrid/_/rsrc/1418993523684/puerta-del-sol/2013-April-17-Puerta-del-Sol-Madrid-2104.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/1/12/Madrid-_Puerta_del_Sol_-_51454839271.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity8.photos.attach(io: file, filename: "#{activity8.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end



puts "Creating activity #9..."
activity9 = Activity.create!(
  average_rating: 4.6,
  price_per_visitor: 1,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 19.hour,
  name: "Cathédrale de la Almudena",
  address: "C. de Bailén, 10, 28013 Madrid, Espagne",
  description: "La cathédrale Santa María la Real de la Almudena est la toute récente cathédrale de Madrid, capitale du royaume d'Espagne, construite face au palais royal au cours du XXᵉ siècle. Elle est le siège épiscopal du diocèse de la capitale.",
  phone_number: "+34 915 42 22 00",
  website: "https://catedraldelaalmudena.es/",
  city: "Madrid",
  country: "Espagne",
  duration: 1
)
["https://a.travel-assets.com/findyours-php/viewfinder/images/res70/348000/348735-Almudena-Cathedral.jpg",
  "https://www.tapasinthesun.com/wp-content/uploads/RHG5522.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Catedral_de_la_Almudena_2008.jpg/1200px-Catedral_de_la_Almudena_2008.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity9.photos.attach(io: file, filename: "#{activity9.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #10..."
activity10 = Activity.create!(
  average_rating: 4.3,
  price_per_visitor: 6,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 17.hour,
  name: "Jardin botanique royal de Madrid",
  address: "Pl. Murillo, 2, 28014 Madrid, Espagne",
  description: "Avec plus de 5 000 différentes espèces de plantes réparties sur une terrasse de 4 niveaux, le Jardin Royal Botanique de Madrid est un agréable poumon vert, situé juste à côté du Musée du Prado.",
  phone_number: "+34 914 20 30 17",
  website: "https://rjb.csic.es/",
  city: "Madrid",
  country: "Espagne",
  duration: 2.5
)

["https://www.spain.info/export/sites/segtur/.content/imagenes/cabeceras-grandes/madrid/general-jardin-botanico-10-c-foto-rjb.jpg",
  "https://mywowo.net/media/images/cache/madrid_giardino_botanico_01_introduzione_jpg_1200_630_cover_85.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/b/b6/Rosaleda_HRM1.JPG"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity10.photos.attach(io: file, filename: "#{activity10.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #11..."
activity11 = Activity.create!(
  average_rating: 4.5,
  price_per_visitor: 30,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 16.hour,
  name: "Palais de Buckingham",
  address: "London SW1A 1AA, Royaume-Uni",
  description: "Le Palais de Buckingham (Buckingham Palace) est la résidence officielle de la Famille Royale Britannique à Londres depuis 1837.  Actuellement, le roi Charles III y réside.",
  phone_number: "+44 303 123 7300",
  website: "https://www.rct.uk/visit/buckingham-palace",
  city: "Londres",
  country: "Royaume-Uni",
  duration: 2.5
)
["https://cdn.mos.cms.futurecdn.net/pGNC93VDpzqKQHPgRkDXnB-1920-80.jpg",
  "https://cdn-lnp.dataweavers.io/-/media/images/london/visit/whats-on/event-pages/buckinghampalace1920x1080.jpg",
  "https://www.washingtonpost.com/resizer/HHgfORzma4uEcFYa0ZuZJgNBhNM=/arc-anglerfish-washpost-prod-washpost/public/SO5V6KXABEI6XIT7RMUUSMHJLM.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity11.photos.attach(io: file, filename: "#{activity11.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end


puts "Creating activity #12..."
activity12 = Activity.create!(
  average_rating: 4.5,
  opening_hour: DateTime.now.beginning_of_day,
  closing_hour: DateTime.now.end_of_day,
  name: "Covent Garden",
  address: "Covent Garden, Londres, Royaume-Uni",
  description: "Situé dans le West End, Covent Garden est le principal quartier londonien des théâtres et des loisirs. Les touristes sont nombreux sur l'élégante Piazza, une place piétonne avec des boutiques de mode, le marché artisanal Apple Market et le Royal Opera House.",
  phone_number: "+44 (0)20 7420 5856",
  website: "https://www.coventgarden.london/",
  city: "Londres",
  country: "Royaume-Uni",
  duration: 2.0
)

["https://a.cdn-hotels.com/gdcs/production107/d879/5fbac677-8a47-456a-9549-c4386914cd27.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/4/42/Covent_Garden_Interior_May_2006_crop.jpg",
  "https://image.arrivalguides.com/1230x800/00/8c1c6572149c02c751d2beefb33e9d6b.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity12.photos.attach(io: file, filename: "#{activity12.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

puts "Creating activity #13..."
activity13 = Activity.create!(
  average_rating: 4.7,
  opening_hour: DateTime.now.beginning_of_day + 4.hour,
  closing_hour: DateTime.now.end_of_day,
  name: "Hyde Park",
  address: "Hyde Park, Londres, Royaume-Uni",
  description: "Avec une superficie de 140 hectares, Hyde Park est le plus grand parc du centre de Londres. Cet immense poumon situé au cœur de la ville sert de lieu de détente pour les Londoniens et touristes.",
  website: "https://www.royalparks.org.uk/parks/hyde-park",
  city: "Londres",
  country: "Royaume-Uni",
  duration: 2.5
)
["https://cdn.jumeirah.com/-/mediadh/dh/hospitality/jumeirah/article/stories/london/a-guide-to-hyde-park/herooo.jpg?h=1080&w=1620",
  "https://a.cdn-hotels.com/gdcs/production97/d1326/d94b74a4-8fc1-4b00-99b8-e6db53199ac8.jpg",
  "https://d1e00ek4ebabms.cloudfront.net/production/7787c61a-0de8-4295-b9bc-b1e308bf05b1.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity13.photos.attach(io: file, filename: "#{activity13.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

puts "Creating activity #14..."
activity14 = Activity.create!(
  average_rating: 4.4,
  price_per_visitor: 36,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 14.hour,
  name: "Madame Tussauds",
  address: "Marylebone Rd, London NW1 5LR, Royaume-Uni",
  description: "Découvrez des visages célèbres au musée Madame Tussauds London, un musée interactif qui expose plus de 190 figures de cire plus vraies que nature.",
  phone_number: "+44 20 7487 0351",
  website: "https://www.madametussauds.com/london/",
  city: "Londres",
  country: "Royaume-Uni",
  duration: 2.0
)

["https://www.montcalm.co.uk/blog/wp-content/uploads/2018/01/Madame-Tussauds-Museum-London.jpg",
  "https://www.london-forever.com/wp-content/uploads/2020/09/madame-tussauds-5.jpg",
  "https://media.timeout.com/images/102899900/image.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity14.photos.attach(io: file, filename: "#{activity14.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

puts "Creating activity #15..."
activity15 = Activity.create!(
  average_rating: 4.7,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 16.hour,
  name: "British Museum",
  address: "Great Russell St, Londres, Royaume-Uni",
  description: "Le British Museum est un musée de l'histoire et de la culture humaine, situé dans le quartier de Bloomsbury à Londres, au Royaume-Uni. Ses collections, constituées de plus de sept millions d'objets, sont parmi les plus importantes du monde et proviennent de tous les continents. Elles illustrent l'histoire humaine de ses débuts à aujourd'hui.",
  website: "https://www.britishmuseum.org/",
  city: "Londres",
  country: "Royaume-Uni",
  duration: 3.5
)

["https://www.themontcalm.com/blog/wp-content/uploads/2015/04/Your-Guide-To-The-British-Museum-London.jpg",
  "https://static01.nyt.com/images/2017/02/01/arts/british-museum-finals-slide-FUP5/british-museum-finals-slide-FUP5-jumbo.jpg",
  "https://assets.gocity.com/files/groot_london/files/styles/crop_freeform/public/blog/British-Museum.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity15.photos.attach(io: file, filename: "#{activity15.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

puts "Creating activity #16..."
activity16 = Activity.create!(
  average_rating: 4.4,
  opening_hour: DateTime.now.beginning_of_day + 9.hour,
  closing_hour: DateTime.now.beginning_of_day + 20.hour,
  name: "Harrods",
  address: "87-135 Brompton Rd, Londres, Royaume-Uni",
  description: "Harrods est un grand magasin de luxe, situé sur Brompton Road dans le quartier de Knightsbridge, à Londres. Harrods est une marque véhiculant une image de luxe que la reine d'Angleterre utilise, apposée sur des produits, et servant d'enseigne à des entreprises et des sites internet.",
  website: "https://www.harrods.com",
  city: "Londres",
  country: "Royaume-Uni",
  duration: 2.5
)
["https://www.theindustry.fashion/wp-content/uploads/2023/01/Harrods-Louis-Vuitton.jpg",
  "https://robbreport.com/wp-content/uploads/2021/05/Harrods_Chocolate_Hall_Wide.jpg",
  "https://www.harrods.com/BWStaticContent/50000/50000/9b86bd1a-72cf-423a-a4a1-62ae51378b50_d-food-halls-in-store-experience-13-vegetable-counter.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity16.photos.attach(io: file, filename: "#{activity16.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

puts "Creating activity #17..."
activity17 = Activity.create!(
  average_rating: 4.9,
  price_per_visitor: 25,
  opening_hour: DateTime.now.beginning_of_day + 19.hour,
  closing_hour: DateTime.now.beginning_of_day + 21.hour,
  closed_day: [1, 2, 3, 4, 7],
  name: "Flamenco Torres Bermejas",
  address: "Mesonero Romanos,11, 28013, Madrid, Espagne",
  description: "Spectacle de flamenco à Madrid: découvrez une activité incontournable de tout voyage en Espagne et profitez du spectacle donné par des musiciens et danseurs passionnés.",
  website: "https://www.flamencotorresbermejas.com",
  city: "Madrid",
  country: "Espagne",
  duration: 1.0
)
["https://monbarcelone.com/wp-content/uploads/2022/07/Flamenco_03.jpeg",
  "https://madridpourvous.com/wp-content/uploads/2018/09/tablao-flamenco-915x515.jpg",
  "https://a.cdn-hotels.com/gdcs/production98/d1518/fd8a39ca-fde9-4a2b-9050-c91bee268de2.jpg"].each_with_index do |image_url, index|
  file = URI.open(image_url)
  activity17.photos.attach(io: file, filename: "#{activity17.name.downcase.gsub(' ', '_')}_#{index + 1}.jpg", content_type: "image/jpeg")
end

  activity1.category_list.add("Sites historiques", "Monuments et points d'intérêt")
  activity1.save
  activity2.category_list.add("Parcs et jardins")
  activity2.save
  activity3.category_list.add("Musées")
  activity3.save
  activity4.category_list.add("Sites historiques", "Monuments et points d'intérêt")
  activity4.save
  activity5.category_list.add("Marchés", "Monuments et points d'intérêt")
  activity5.save
  activity6.category_list.add("Musées")
  activity6.save
  activity7.category_list.add("Musées")
  activity7.save
  activity8.category_list.add("Monuments et points d'intérêt", "Sites historiques")
  activity8.save
  activity9.category_list.add("Monuments et points d'intérêt", "Sites historiques")
  activity9.save
  activity10.category_list.add("Monuments et points d'intérêt", "Sites historiques", "Parcs et jardins")
  activity10.save
  activity11.category_list.add("Monuments et points d'intérêt", "Sites historiques")
  activity11.save
  activity12.category_list.add("Monuments et points d'intérêt", "Sites historiques")
  activity12.save
  activity13.category_list.add("Monuments et points d'intérêt", "Parcs et jardins")
  activity13.save
  activity14.category_list.add("Musées")
  activity14.save
  activity15.category_list.add("Musées")
  activity15.save
  activity16.category_list.add("Monuments et points d'intérêt")
  activity16.save
  activity17.category_list.add("Monuments et points d'intérêt", "Théâtres")
  activity17.save

puts "#{Activity.all.count} activities created"

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity1
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity3
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity2
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity17
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity4
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity5
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity9
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity10
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip1,
  activity: activity7
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip3,
  activity: activity11,
  start_at: DateTime.new(2022, 12, 16, 10, 00),
  end_at: DateTime.new(2022, 12, 16, 12, 30)
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip3,
  activity: activity12,
  start_at: DateTime.new(2022, 12, 16, 13, 30),
  end_at: DateTime.new(2022, 12, 16, 15, 30)
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip3,
  activity: activity15,
  start_at: DateTime.new(2022, 12, 16, 15, 30),
  end_at: DateTime.new(2022, 12, 16, 19, 00)
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip3,
  activity: activity13,
  start_at: DateTime.new(2022, 12, 17, 10, 00),
  end_at: DateTime.new(2022, 12, 17, 12, 30)
)


puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip3,
  activity: activity16,
  start_at: DateTime.new(2022, 12, 17, 13, 30),
  end_at: DateTime.new(2022, 12, 17, 16, 00)
)

puts "Creating activity of the trip..."
TripActivity.create!(
  trip: trip3,
  activity: activity14,
  start_at: DateTime.new(2022, 12, 17, 16, 30),
  end_at: DateTime.new(2022, 12, 17, 18, 30)
)

puts "#{Trip.first.activities.count} activities created for #{Trip.first.trip_name}"
# puts "#{Trip.third.activities.count} activities created for #{Trip.third.trip_name}"
