RSpec.describe Article::IndexSerializer, type: :serializer do
  let(:articles) { build_list(:article, 10) }
  let(:serialization) do
    ActiveModelSerializers::SerializableResource.new(
      articles,
      each_serializer: described_class
    )
  end
  subject { JSON.parse(serialization.to_json) }

  it 'is expected to wrap data in a key reflecting the resource name' do
    expect(subject.keys).to match ['articles']
  end
end
