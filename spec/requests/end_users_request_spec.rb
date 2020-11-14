require 'rails_helper'

RSpec.describe 'EndUsers', type: :request do
  describe 'マイページ' do
    context 'マイページが正しく表示される' do
      before do
        get end_user_path(1)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include('ノート')
      end
    end
  end
end
