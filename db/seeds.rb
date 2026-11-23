puts "Cleaning the DB..."
Restaurant.destroy_all
User.destroy_all

CHEFS = %w[Maria Yoshi Gonzalo Nepo Charles Lucas Lance Jonny Annie Paul]
GITHUBS = %w[arguferi yowshi12 GonBDev nlucas47 Nainoaclls lucaskusamoto LZCR-JP Jon-Cactus annieha1010 eequu1]
CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end

puts "Creating #{CHEFS.count * 2} Restaurants..."
CHEFS.shuffle.each do |name|
  index = CHEFS.index(name)
  user = User.create!(email: "#{name.downcase}@lewagon.com", password: '123123', username: GITHUBS[index])
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    rating: rand(3..5),
    address: "日本, 〒153-0063 東京都目黒区 目黒#{rand(1..3)}丁目#{rand(1..10)}番#{rand(1..3)}号",
    category: get_category(restaurant_name),
    user: user
  )
end
puts "... created #{Restaurant.count} restaurants"
