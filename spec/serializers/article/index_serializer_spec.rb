RSpec.describe Article::IndexSerializer, type: :serializer do
  let(:articles) { create_list(:article, 10) }

  let!(:serialization) do
    ActiveModelSerializers::SerializableResource.new(
      articles,
      each_serializer: described_class
    )
  end

  subject { JSON.parse(serialization.to_json) }

  it 'is expected to wrap content in key reflecting modal name' do
    expect(subject.keys).to match ['articles']
  end

  it 'is expected to include relevant keys' do
    expected_keys = %w[id title teaser published category user author image]
    expect(subject['articles'].first.keys).to match expected_keys
  end

  it 'is expected to contain keys with values of specific data types' do
    expect(subject['articles'].first).to match(
      {
        'id' => an_instance_of(Integer),
        'title' => an_instance_of(String),
        'teaser' => an_instance_of(String),
        'category' => an_instance_of(String),
        'user' => an_instance_of(String),
        'published' => an_instance_of(String),
        'author' => an_instance_of(String),
        'image' => {
          'id' => an_instance_of(Integer),
          'image' => an_instance_of(String),
          'title' => an_instance_of(String)
        }
      }
    )
  end
end
