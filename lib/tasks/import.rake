namespace :import do
  desc "Import author data from https://github.com/nschaetti/SFGram-dataset"
  task authors: :environment do
    url = "https://raw.githubusercontent.com/nschaetti/SFGram-dataset/master/authors.json"
    response = Faraday.get url
    response_json = JSON.parse response.body
    authors = response_json['authors']
    bulk_data = []

    bar = ProgressBar.new
    authors.each do |author|
      record = Author.new(
        id: author['id'],
        name: author['name'],
        bio: author['bio'],
        gender: author['gender'] == 'm' ? :male : :female,
        summary: author['summary'],
        born: author['born']&.to_date,
        died: author['died']&.to_date,
      )

      bulk_data << record
      bar.increment!
    end

    Author.bulk_import!(bulk_data, on_duplicate_key_update: [:id])
  end

  desc "Import books data from https://github.com/nschaetti/SFGram-dataset"
  task books: :environment do
    url = "https://raw.githubusercontent.com/nschaetti/SFGram-dataset/master/books.json"
    puts 'No author found, please run `rake import:authors`' if Author.blank?

    response = Faraday.get url
    response_json = JSON.parse response.body
    books = response_json['books']
    book_data = []
    book_authors_data = []
    bar = ProgressBar.new

    books.each do |book|
      record = Book.new(
        id: book['id'],
        author_ids: book['author'],
        content_name: book['content_name'],
        isbn: book['isbn'],
        original_title: book['original_title'],
        year: book['year'],
        language_code: book['language_code'],
        category: book['category'],
        plot: book['plot'],
        copyright: book['copyright'],
        title: book['title'],
        average_rating: book['average_rating'],
        rating_count: book['rating_count'],
        description: book['description'],
        loc_class: book['loc_class'],
        language: book['language'],
        pages: book['pages'],
        isbn13: book['isbn13'],
        release_date: book['release_date'],
        cover: book['cover'],
        summary: book['summary'],
        content_cleaned: book['content_cleaned'],
        content_available: book['content_available']
      )
      book['authors'].each do |author|
        book_author = BookAuthor.new(author_id: author, book_id: book['id'])
        book_authors_data << book_author
      end

      book_data << record
      bar.increment!
    end

    Book.bulk_import!(book_data, on_duplicate_key_update: [:id])

    BookAuthor.bulk_import!(book_authors_data, on_duplicate_key_update: [:id])

    # reset counter cache
    Author.select(:id).map(&:id).each do |author_id|
      Author.reset_counters(author_id, :books)
    end
  end
end
