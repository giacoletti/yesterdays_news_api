FactoryBot.define do
  factory :article do
    title { 'This is a wonderful header' }
    body { 'This is my article body' }
    category
    user
  end
end
