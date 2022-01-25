RSpec.describe 'GET /api/articles', type: :request do
  subject { response }
  let(:journalist) do
    create(:user, name: 'Leif GW Persson', email: 'leifgwpersson@expressen.se', password: 'password', role: 2)
  end
  let(:journalist2) do
    create(:user, name: 'Jan Guillou', email: 'jan.guillou@aftonbladet.se', password: 'ondskan', role: 2)
  end
  let!(:category) { create(:category, name: 'politics') }
  let!(:article) { 11.times { create(:article, category: category, user: journalist) } }
  let!(:article2) { 11.times { create(:article, category: category, user: journalist2) } }

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

        it 'is expected to respond with a colletion of first journalist articles' do
          expect(response_json['articles'].last['user']).to eq 'Leif GW Persson'
        end

        it 'is expected to respond with a colletion of second journalists articles' do
          expect(response_json['articles'].first['user']).to eq 'Jan Guillou'
        end
      end
    end
  end
end
