RSpec.describe 'GET /api/articles', type: :request do
  subject { response }
  let(:journalist) { create(:user, role: 'journalist') }
  let!(:category) { create(:category, name: 'politics') }
  let!(:article) { 30.times { create(:article, category: category, user: journalist) } }

  describe 'successfully' do
    describe 'without params' do
      before do
        get '/api/articles'
      end

      it { is_expected.to have_http_status :ok }

      it 'is expected to return 20 articles' do
        expect(response_json['articles'].count).to eq 20
      end

      it 'is expected to respond with an article with title "This is a wonderful header"' do
        expect(response_json['articles'].first['title']).to eq 'This is a wonderful header'
      end
    end

    describe 'with a category param' do
      before do
        get '/api/articles', params: { category: 'politics' }
      end

      it { is_expected.to have_http_status :ok }

      it 'is expected to respond with a collection of 20 articles' do
        expect(response_json['articles'].count).to eq 20
      end

      it 'is expected to respond with a collection of articles with "Politics" category' do
        expect(response_json['articles'].all? { |article| article['category'] == 'Politics' })
          .to eq true
      end
    end

    describe 'belongs to a journalist' do
      describe 'without params' do
        before do
          get '/api/articles'
        end

        it { is_expected.to have_http_status :ok }

        it 'is expected to respond with a collection of articles a users articles' do
          expect(response_json['articles'].all? { |article| article['user'] == journalist.email })
            .to eq true
        end
      end
    end
  end
end
