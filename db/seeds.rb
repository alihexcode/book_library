puts '======= Started Seeding Authors'
50.times do
  Author.find_or_create_by!(name: Faker::Book.author) do |a|
    a.bio = Faker::Quote.famous_last_words
    a.gender = [:male, :female].sample
    a.summary = Faker::Lorem.words.join(" ")
    a.born = rand(120.years).seconds.ago
    a.died = rand(10.years).seconds.ago
  end
end
puts '======= Finish Seeding Authors'

puts '======= Started Seeding Books'
100.times do
  Book.find_or_create_by!(title: Faker::Book.title) do |b|
    b.authors << Author.all.to_a.sample(rand(1..2))
    b.content_name = Faker::Lorem.words.join(" ")
    b.isbn = rand(10000..999999)
    b.original_title = Faker::Book.title
    b.year = rand(1888..2022)
    b.language_code = 'eng'
    b.category = 'Text'
    b.plot = Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)
    b.copyright = Faker::Book.publisher
    b.average_rating = [3.0, 3.5, 4.5, 5.0].sample
    b.rating_count = rand(1..1000)
    b.description = Faker::Lorem.words.join(" ")
    b.loc_class = Faker::Books::Dune.saying(source: "fremen")
    b.language = 'English'
    b.pages = rand(100..1000)
    b.isbn13 = rand(10000..999999)
    b.release_date = rand(10.years).seconds.ago
    b.summary = Faker::Books::Dune.quote
    b.content_cleaned = true
    b.content_available = true
  end
end
puts '======= Finish Seeding Books'