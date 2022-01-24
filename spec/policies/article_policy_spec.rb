RSpec.describe ArticlePolicy do
  subject { described_class.new(user, article) }
  let(:article) { create(:article) }

  describe 'as a visitor' do
    let(:user) { nil }

    it { is_expected.to forbid_action(:create) }
    it { is_expected.to permit_actions(%i[index show]) }
  end

  describe 'as regular user' do
    let(:user) { create(:user, role: nil) }

    it { is_expected.to forbid_action(:create) }
    it { is_expected.to permit_actions(%i[index show]) }
  end

  describe 'as member of staff' do
    let(:user) { create(:user, role: 'journalist') }

    it { is_expected.to permit_actions(%i[create index show]) }
  end
end
