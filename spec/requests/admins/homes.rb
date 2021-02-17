require "rails_helper"

RSpec.describe Admins::HomesController, type: :request do
  let(:admin) { create(:admin) }

  describe "Get top" do
    context "ログイン済みの場合" do
      before do
        sign_in admin
        get admins_home_url
      end

      it "リクエストは200 OK" do
        expect(response.status).to eq 200
      end
      it "項目が表示されること" do
        expect(response.body).to include "ジャンル"
        expect(response.body).to include "カテゴリー"
        expect(response.body).to include "メニュージャンル"
        expect(response.body).to include "食材"
        expect(response.body).to include "ユーザー"
        expect(response.body).to include "レシピ"
        expect(response.body).to include "メニュー"
      end
    end

    context "ログインしていない場合" do
      before do
        get admins_home_url
      end

      it "リクエストは302 リダイレクト" do
        expect(response.status).to eq 302
      end
      it "管理者ログインページにリダイレクトされること" do
        expect(response).to redirect_to new_admin_session_url
      end
    end
  end
end