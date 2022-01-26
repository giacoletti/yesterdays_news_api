# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.delete_all
Category.delete_all

category_sports = Category.create(name: 'sports')
category_politics = Category.create(name: 'politics')
category_economy = Category.create(name: 'economy')
category_news = Category.create(name: 'news')

journalist_1 = User.create(name: Faker::Name.name, email: Faker::Internet.unique.email, password: '1234567890', role: 'journalist')
journalist_2 = User.create(name: Faker::Name.name, email: Faker::Internet.unique.email, password: '1234567890', role: 'journalist')
journalist_3 = User.create(name: Faker::Name.name, email: Faker::Internet.unique.email, password: '1234567890', role: 'journalist')

articles = [{ title: Faker::Book.title, body: Faker::Quote.matz, category: category_sports, user: journalist_1 },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_sports, user: journalist_1  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_sports, user: journalist_2  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_sports, user: journalist_3  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_politics, user: journalist_1  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_politics, user: journalist_3  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_politics, user: journalist_2  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_politics, user: journalist_3  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_economy, user: journalist_2 },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_economy, user: journalist_1  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_economy, user: journalist_1  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_economy, user: journalist_2  },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_news, user: journalist_1 },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_news, user: journalist_3 },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_news, user: journalist_2 },
            { title: Faker::Book.title, body: Faker::Quote.matz, category: category_news, user: journalist_1 }]

articles.each do |article|
  Article.create(title: article[:title], body: article[:body], category: article[:category], user: article[:user])
end
