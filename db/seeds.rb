# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Exchange.destroy_all
Bio.destroy_all
Position.destroy_all
Subscription.destroy_all
Trade.destroy_all
User.destroy_all

foto_jaime = URI.open('https://previews.123rf.com/images/yupiramos/yupiramos1705/yupiramos170514531/77987158-dise%C3%B1o-gr%C3%A1fico-del-ejemplo-del-vector-del-icono-del-perfil-del-hombre-joven.jpg')

puts 'Creating users'

joel = User.create!(email: 'joel@gmail.com', password: 'joelsito')
maxi = User.create!(email: 'maxi@gmail.com', password: 'maxito')
jaime = User.create!(email: 'jaime@gmail.com', password: 'jaimesito')
luca = User.create!(email: 'luca@gmail.com', password: 'luquita')

puts 'Failed creating user' if jaime.id.nil?
puts 'Adding bios'

bio_joel = Bio.create!(username: 'Joel Jaldin', description: 'Me llamo joel y no hago trading', user: joel)
bio_maxi = Bio.create!(username: 'Maxi Zatta', description: 'Me llamo maxi y no hago trading', user: maxi)
bio_jaime = Bio.create!(username: 'Jaime Zuber', description: 'Me llamo jaime y no hago trading', user: jaime)
bio_luca = Bio.create!(username: 'Luca Pagano', description: 'Me llamo luca y hago trading', user: luca)

bio_joel.photo.attach(io: URI.open(Faker::Avatar.image(format: "jpg")), filename: 'bio_joel.jpg', content_type: 'image/jpg')
bio_luca.photo.attach(io: URI.open(Faker::Avatar.image(format: "jpg")), filename: 'bio_luca.jpg', content_type: 'image/jpg')
bio_maxi.photo.attach(io: URI.open(Faker::Avatar.image(format: "jpg")), filename: 'bio_maxi.jpg', content_type: 'image/jpg')
bio_jaime.photo.attach(io: foto_jaime, filename: 'bio_jaime.jpg', content_type: 'image/jpg')

# puts 'Adding exchanges'

# Exchange.create!(name: 'ripio', user: joel, read_key:	'U2FsdGVkX1+haSn1gwG3NynyIau92i3woZNF524K8yH17wujjGCqYriiEmyMPT9s' , write_key: 'U2FsdGVkX1+haSn1awG3NynyIau92i3woZNF524KhyH17wujjGCqYoiiEmyMPT9s')
# Exchange.create!(name: 'binance', user: maxi, read_key: 'U2FsdGVkX1+haSn1awG3NynyIau92s3woZNF524K8yH17wujjGCwYoiiEmyMPT9s' , write_key: 'U2FsdGVkX1+haSn1awG3NynyIau92i3woZNF52hK8yH17wujjGCqYoiiEmyMPT9s')
# Exchange.create!(name: 'huobi', user: jaime, read_key: 'U2FsdGVkX1+hadn1awG3NynyIau92i3woZNF524K8yH17wujjGCqqoiiEmyMPT9s' , write_key: 'U2FsdGVkX1+haSn1awG3NynyIau92h3woZNF524h8yH17wujjGCqYoiiEmyMPT9s')
# Exchange.create!(name: 'bingx', user: luca, read_key: 'U2FsdGVkX1+haSn1awf3NynyIau92i3woZNF524K8yH17wujjGCqYriiEmyMPT9s' , write_key: 'U2FsdGVkX1+haSn1awG3NynyIau92ihwoZNF524K8yH17wujjGCqYoiiEmyMPT9s')

puts 'Subscribing users'

subsc_maxi = Subscription.create!(trader: luca, subscriber: maxi, amount_per_trade: 100, max_amount: 500)
subsc_joel = Subscription.create!(trader: luca, subscriber: joel, amount_per_trade: 50, max_amount: 200)
subsc_jaime = Subscription.create!(trader: luca, subscriber: jaime, amount_per_trade: 150, max_amount: 1000)
subsc_luca = Subscription.create!(trader: jaime, subscriber: luca, amount_per_trade: 150, max_amount: 1000)


puts 'Adding trades to luca'

trade1 = Trade.create!(trader: luca, symbol: 'btc', side: 'buy', entry_price: 20_000, take_profit: 22_000, stop_loss: 19_000)
trade2 = Trade.create!(trader: luca, symbol: 'btc', side: 'buy', entry_price: 21_500, exit_price: 23_000,take_profit: 22_300, stop_loss: 19_200)
trade3 = Trade.create!(trader: luca, symbol: 'eth', side: 'sell', entry_price: 1100, exit_price: 1250, take_profit: 950, stop_loss: 1150)
trade4 = Trade.create!(trader: luca, symbol: 'ltc', side: 'buy', entry_price: 38, exit_price: 40, take_profit: 45, stop_loss: 36.5)
trade5 = Trade.create!(trader: luca, symbol: 'ltc', side: 'buy', entry_price: 36, exit_price: 34.5, take_profit: 45, stop_loss: 34.5)
trade6 = Trade.create!(trader: luca, symbol: 'btc', side: 'buy', entry_price: 20_000, exit_price: 21_500, take_profit: 22_000, stop_loss: 19_000)

trade7 = Trade.create!(trader: jaime, symbol: 'btc', side: 'buy', entry_price: 20_000, take_profit: 22_000, stop_loss: 19_000)
trade8 = Trade.create!(trader: jaime, symbol: 'ltc', side: 'buy', entry_price: 30, exit_price: 29, take_profit: 32, stop_loss: 29)
trade9 = Trade.create!(trader: jaime, symbol: 'eth', side: 'sell', entry_price: 1100, exit_price: 1050, take_profit: 950, stop_loss: 1150)

puts 'generating random traders'

15.times do
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
  bio = Bio.create!(username: Faker::Name.name, description: Faker::Hacker.say_something_smart, user: user)
  bio.photo.attach(io: URI.open(Faker::Avatar.image(format: "jpg")), filename: Faker::Name.unique.name, content_type: 'image/jpg')
  Faker::Number.within(range: 0..10).times do
    Trade.create!(trader: user, symbol: 'btc', side: 'buy', entry_price: Faker::Number.within(range: 19500.0..21000.0), take_profit: Faker::Number.within(range: 21000.0..25000.0), stop_loss: Faker::Number.within(range: 10000.0..19500.0))
  end
end

puts 'first 15 done'

15.times do
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
  bio = Bio.create!(username: Faker::Name.name, description: Faker::Hacker.say_something_smart, user: user)
  bio.photo.attach(io: URI.open(Faker::Avatar.image(format: "jpg")), filename: Faker::Name.unique.name, content_type: 'image/jpg')
  Faker::Number.within(range: 0..10).times do
    Trade.create!(trader: user, symbol: 'eth', side: 'sell', exit_price: Faker::Number.within(range: 800.0..1230.0), entry_price: Faker::Number.within(range: 900.0..1050.0), take_profit: Faker::Number.within(range: 500.0..900.0), stop_loss: Faker::Number.within(range: 1050.0..1230.0))
  end
end

puts 'second 15 done, 30 on the go'

15.times do
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
  bio = Bio.create!(username: Faker::Name.name, description: Faker::Hacker.say_something_smart, user: user)
  bio.photo.attach(io: URI.open(Faker::Avatar.image(format: "jpg")), filename: Faker::Name.unique.name, content_type: 'image/jpg')
  Faker::Number.within(range: 0..10).times do
    Trade.create!(trader: user, symbol: 'zec', side: 'buy', exit_price: Faker::Number.within(range: 58.0..65.0), entry_price: Faker::Number.within(range: 60.0..64.0), take_profit: Faker::Number.within(range: 64.0..70.0), stop_loss: Faker::Number.within(range: 56.0..60.0))
  end
end

puts '45 traders generated. Now their profits and loss'
Trade.all.each do |trade|
  if trade.side == 'BUY'
    trade.pnl = (((trade.exit_price / trade.entry_price) - 1) * 100) unless trade.exit_price.nil?
  else
    trade.pnl = ((1 - (trade.exit_price / trade.entry_price)) * 100) unless trade.exit_price.nil?
  end
  trade.save!
end

puts 'Implementing positions'

trade1.reload
Position.create!(trade: trade1, subscription: subsc_jaime, open_price: trade1.entry_price, close_price: trade1.exit_price, pnl: trade1.pnl )
Position.create!(trade: trade1, subscription: subsc_maxi, open_price: trade1.entry_price , close_price: trade1.exit_price, pnl: trade1.pnl)

trade2.reload
puts 'position2'
Position.create!(trade: trade2, subscription: subsc_jaime, open_price: trade2.entry_price , close_price: trade2.exit_price , pnl: trade2.pnl)

trade3.reload
puts 'position3'
Position.create!(trade: trade3, subscription: subsc_jaime, open_price:trade3.entry_price , close_price: trade3.exit_price, pnl: trade3.pnl)
Position.create!(trade: trade3, subscription: subsc_maxi, open_price:trade3.entry_price , close_price: trade3.exit_price, pnl: trade3.pnl)
Position.create!(trade: trade3, subscription: subsc_joel, open_price:trade3.entry_price , close_price: trade3.exit_price, pnl: trade3.pnl)

trade4.reload
puts 'position4'
Position.create!(trade: trade4, subscription: subsc_maxi, open_price: trade4.entry_price, close_price: trade4.exit_price, pnl: trade4.pnl)
Position.create!(trade: trade4, subscription: subsc_jaime, open_price: trade4.entry_price, close_price: trade4.exit_price, pnl: trade4.pnl)
Position.create!(trade: trade4, subscription: subsc_joel, open_price: trade4.entry_price, close_price: trade4.exit_price, pnl: trade4.pnl)

trade5.reload
puts 'position5'
Position.create!(trade: trade5, subscription: subsc_maxi, open_price: trade5.entry_price, close_price: trade5.exit_price, pnl: trade5.pnl)
Position.create!(trade: trade5, subscription: subsc_jaime, open_price: trade5.entry_price, close_price: trade5.exit_price, pnl: trade5.pnl)
Position.create!(trade: trade5, subscription: subsc_joel, open_price: trade5.entry_price, close_price: trade5.exit_price, pnl: trade5.pnl)

trade6.reload
puts 'position6'
Position.create!(trade: trade6, subscription: subsc_maxi, open_price: trade6.entry_price, close_price: trade6.exit_price, pnl: trade6.pnl)
Position.create!(trade: trade6, subscription: subsc_jaime, open_price: trade6.entry_price, close_price: trade6.exit_price, pnl: trade6.pnl)
Position.create!(trade: trade6, subscription: subsc_joel, open_price: trade6.entry_price, close_price: trade6.exit_price, pnl: trade6.pnl)

trade7.reload
puts 'position6'
Position.create!(trade: trade7, subscription: subsc_maxi, open_price: trade7.entry_price, close_price: trade7.exit_price, pnl: trade7.pnl)

trade8.reload
puts 'position6'
Position.create!(trade: trade8, subscription: subsc_maxi, open_price: trade8.entry_price, close_price: trade8.exit_price, pnl: trade8.pnl)

trade9.reload
puts 'position6'
Position.create!(trade: trade9, subscription: subsc_maxi, open_price: trade9.entry_price, close_price: trade9.exit_price, pnl: trade9.pnl)


Bio.all.each do |bio|
  bio.rendimiento = 0.0
  bio.volatilidad = 0.0
  pnl_array = []
  bio.user.trades.each do |trade|
    bio.rendimiento += trade.pnl unless trade.pnl.nil?
    pnl_array.push(trade.pnl) unless trade.pnl.nil?
    pnl_mean = pnl_array.mean
    varianza = pnl_array.inject(0) { |varianza, x| varianza += (x - pnl_mean) ** 2 }
    desvio = Math.sqrt(varianza / (pnl_array.size - 1))
    bio.volatilidad = desvio * Math.sqrt(30)
  end
  bio.save!
end

puts 'All set'
