require "rails_helper"

RSpec.describe Admins::CategoriesController, type: :request do
  let(:admin) { create(:admin) }
  let!(:category) { create(:category) }


  describe "Get #index" do
    context "ログイン済みの場合" do
      before do
        sign_in admin
        get admins_categories_url
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
        get admins_categories_url
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
        get edit_admins_category_url category.id
      end

      it "リクエストは200 OK" do
        expect(response.status).to eq 200
      end
      it "学習記録のタイトルと詳細が表示されること" do
        expect(response.body).to include "肉類"
      end
    end

    context "ログインしていない場合" do
      before do
        get edit_admins_category_url category.id
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

      it "リクエストは302 リダイレクト" do
        patch admins_learning_url learning_english, params: { learning: attributes_for(:learning_math) }
        expect(response.status).to eq 302
      end
      it "学習記録のタイトルが更新されること" do
        expect do
          patch admins_learning_url learning_english, params: { learning: attributes_for(:learning_math) }
        end.to change { Learning.find(learning_english.id).title }.from("英語").to("数学")
      end
      it "更新した学習記録詳細ページにリダイレクトされること" do
        patch admins_learning_url learning_english, params: { learning: attributes_for(:learning_math) }
        expect(response).to redirect_to(admins_learning_url(learning_english))
      end
    end

    context "パラメータが不正な場合" do
      before do
        sign_in admin
      end

      it "リクエストは200 OK" do
        patch admins_learning_url learning_english, params: { learning: attributes_for(:learning, title: nil) }
        expect(response.status).to eq 200
      end
      it "学習記録のタイトルが更新されないこと" do
        expect do
          patch admins_learning_url learning_english, params: { learning: attributes_for(:learning, title: nil) }
        end.not_to change(Learning.find(learning_english.id), :title)
      end
      it "エラーが表示されること" do
        patch admins_learning_url learning_english, params: { learning: attributes_for(:learning, title: nil) }
        expect(response.body).to include "タイトルを入力してください"
      end
    end
  end

#   describe "DELETE #destroy" do
#     let!(:learning) { create(:learning) }

#     before do
#       sign_in admin
#     end

#     it "リクエストは302 リダイレクト" do
#       delete admins_learning_url learning
#       expect(response.status).to eq 302
#     end
#     it "学習記録が削除されること" do
#       expect do
#         delete admins_learning_url learning
#       end.to change(Learning, :count).by(-1)
#     end
#     it "学習記録一覧ページにリダイレクトされること" do
#       delete admins_learning_url learning
#       expect(response).to redirect_to admins_learnings_url
#     end
end