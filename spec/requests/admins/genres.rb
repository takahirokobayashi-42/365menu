require "rails_helper"

RSpec.describe Admins::GenresController, type: :request do
  let(:admin) { create(:admin) }
  let!(:genre) { create(:genre) }
  let(:genre_vegetable) { create(:genre_vegetable) }

  describe "Get #index" do
    context "ログイン済みの場合" do
      before do
        sign_in admin
        get admins_genres_url
      end

      it "リクエストは200 OK" do
        expect(response.status).to eq 200
      end
      it "項目が表示されること" do

        expect(response.body).to include "肉類"
      end
    end

    context "ログインしていない場合" do
      before do
        get admins_genres_url
      end

      it "リクエストは302 リダイレクト" do
        expect(response.status).to eq 302
      end
      it "管理者ログインページにリダイレクトされること" do
        expect(response).to redirect_to new_admin_session_url
      end
    end
  end

  describe "GET #edit" do

    context "ログイン済みの場合" do
      before do
        sign_in admin
        get edit_admins_genre_url genre.id
      end

      it "リクエストは200 OK" do
        expect(response.status).to eq 200
      end
      it "ジャンル表示されている" do
        expect(response.body).to include "肉類"
      end
    end

    context "ログインしていない場合" do
      before do
        get edit_admins_genre_url genre.id
      end

      it "リクエストは302 リダイレクト" do
        expect(response.status).to eq 302
      end
      it "管理者ログインページにリダイレクトされること" do
        expect(response).to redirect_to new_admin_session_url
      end
    end
  end

  describe "PATCH #update" do

    context "パラメータが妥当な場合" do

      before do
        sign_in admin
      end

      it "editページに飛んでいるか" do
        visit admins_genres_path
        click_link "編集する"
        expect(page).to have_content("ジャンル編集")
        expect(page).to have_current_path "/admins/genres/1/edit"
      end

      it "リクエストは302 リダイレクト" do
        patch admins_genre_url genre, params: { genre: attributes_for(:genre_vegetable) }
        expect(response.status).to eq 302
      end
      it "ジャンルが更新されていること" do
        expect do
        patch admins_genre_url genre, params: { genre: attributes_for(:genre_vegetable) }
        end.to change { Genre.find(genre.id).name }.from("肉類").to("野菜類")
      end

      it "更新した後ジャンル一覧ページにリダイレクトされること" do
        patch admins_genre_url genre, params: { genre: attributes_for(:genre_vegetable) }
        expect(response).to redirect_to(admins_genres_path)
      end
    end

    context "パラメータが不正な場合" do
      before do
        sign_in admin
      end

      it "リクエストは200 OK" do
        patch admins_genre_url genre, params: { genre: attributes_for(:genre, name:nil) }
        expect(response.status).to eq 200
      end
      it "ジャンルの名前が更新されないこと" do
        expect do
          patch admins_genre_url genre, params: { genre: attributes_for(:genre, name:nil) }
        end.not_to change(Genre.find(genre.id), :name)
      end
      it "エラーが表示されること" do
        patch admins_genre_url genre, params: { genre: attributes_for(:genre, name:nil) }
        expect(response.body).to include "Nameを入力してください"
      end
    end
  end

  describe "DELETE #destroy" do

    before do
      sign_in admin
    end

    it "リクエストは302 リダイレクト" do
      delete admins_genre_url genre
      expect(response.status).to eq 302
    end
    it "学習記録が削除されること" do
      expect do
        delete admins_genre_url genre
      end.to change(Genre, :count).by(-1)
    end
    it "学習記録一覧ページにリダイレクトされること" do
      delete admins_genre_url genre
      expect(response).to redirect_to admins_genres_url
    end
  end
end