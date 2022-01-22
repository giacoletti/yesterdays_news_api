# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.delete_all
Category.delete_all

news_category = Category.create(name: 'news')
politics_category = Category.create(name: 'politics')
sports_category = Category.create(name: 'sports')
economy_category = Category.create(name: 'economy')

# articles = [{ title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'news' },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'news'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'news'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'news'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'news'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'politics'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'politics'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'politics'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'politics'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'sports'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'sports'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'sports'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'sports'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'economy'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'economy'  },
#             { title: Faker::Book.title, body: Faker::Quote.matz, category_id: 'economy'  }]

articles.each do |article|
  Article.create(title: article[:title], body: article[:body], category: article[:category])
end
