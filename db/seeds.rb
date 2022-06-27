# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Exchange.destroy_all
Bio.destroy_all
Position.destroy_all
Subscription.destroy_all
Trade.destroy_all
User.destroy_all

foto_joel = URI.open('https://img.blogs.es/anexom/wp-content/uploads/2021/12/perfil-1024x754.jpg')
foto_jaime = URI.open('https://previews.123rf.com/images/yupiramos/yupiramos1705/yupiramos170514531/77987158-dise%C3%B1o-gr%C3%A1fico-del-ejemplo-del-vector-del-icono-del-perfil-del-hombre-joven.jpg')
foto_maxi = URI.open('https://academy.doctoralia.com/hs-fs/hubfs/11-doctoralia-movil-foto-borrosa-250x300.jpg?width=250&name=11-doctoralia-movil-foto-borrosa-250x300.jpg')
foto_luca = URI.open('https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg')

puts 'Creating users'

joel = User.create(email: 'joel@gmail.com', password: 'joelsito')
maxi = User.create(email: 'maxi@gmail.com', password: 'maxito')
jaime = User.create(email: 'jaime@gmail.com', password: 'jaimesito')
luca = User.create(email: 'luca@gmail.com', password: 'luquita')

puts 'Failed creating user' if jaime.id.nil?
puts 'Adding bios'

bio_joel = Bio.create(username: 'Joel', description: 'Me llamo joel y no hago trading', user: joel)
bio_maxi = Bio.create(username: 'Maxi', description: 'Me llamo maxi y no hago trading', user: maxi)
bio_jaime = Bio.create(username: 'Jaime', description: 'Me llamo jaime y no hago trading', user: jaime)
bio_luca = Bio.create(username: 'Luca', description: 'Me llamo luca y hago trading', user: luca)

bio_joel.photo.attach(io: foto_joel, filename: 'bio_joel.jpg', content_type: 'image/jpg')
bio_luca.photo.attach(io: foto_luca, filename: 'bio_luca.jpg', content_type: 'image/jpg')
bio_maxi.photo.attach(io: foto_maxi, filename: 'bio_maxi.jpg', content_type: 'image/jpg')
bio_jaime.photo.attach(io: foto_jaime, filename: 'bio_jaime.jpg', content_type: 'image/jpg')

puts 'Adding exchanges'

Exchange.create(name: 'ripio', user: joel)
Exchange.create(name: 'binance', user: maxi)
Exchange.create(name: 'huobi', user: jaime)
Exchange.create(name: 'bingx', user: luca)

puts 'Subscribing users'

subsc_maxi = Subscription.new(trader: luca, subscriber: maxi, amount_per_trade: 100, max_amount: 500)
subsc_joel = Subscription.new(trader: luca, subscriber: joel, amount_per_trade: 50, max_amount: 200)
subsc_jaime = Subscription.new(trader: luca, subscriber: jaime, amount_per_trade: 150, max_amount: 1000)


puts 'Adding trades to luca'

trade1 = Trade.create!(trader: luca, symbol: 'btc', side: 'buy', entry_price: 20_000, take_profit: 22_000, stop_loss: 19_000)
trade2 = Trade.create!(trader: luca, symbol: 'btc', side: 'buy', entry_price: 21_500, take_profit: 22_300, stop_loss: 19_200)
trade3 = Trade.create!(trader: luca, symbol: 'eth', side: 'sell', entry_price: 1100, take_profit: 950, stop_loss: 1150)
trade4 = Trade.create!(trader: luca, symbol: 'ltc', side: 'buy', entry_price: 38, take_profit: 45, stop_loss: 36.5)

puts 'Implementing positions'

Position.create(trade: trade1, subscription: subsc_jaime)
Position.create(trade: trade1, subscription: subsc_maxi)

puts 'position2'
Position.create(trade: trade2, subscription: subsc_jaime)

puts 'position3'
Position.create(trade: trade3, subscription: subsc_jaime)
Position.create(trade: trade3, subscription: subsc_maxi)
Position.create(trade: trade3, subscription: subsc_joel)

puts 'position4'
Position.create(trade: trade4, subscription: subsc_maxi)
Position.create(trade: trade4, subscription: subsc_jaime)
Position.create(trade: trade4, subscription: subsc_joel)

puts 'All set'
