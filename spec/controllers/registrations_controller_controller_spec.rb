require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe "GET new" do
    it "redirects to root page" do
      @request.env['devise.mapping'] = Devise.mappings[:admin]

      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST create" do
    it "redirects to root page" do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      admin = build(:admin)

      post :create, session: { email: admin.email, password: admin.password }
      expect(response).to redirect_to(root_path)
      expect(Admin.count).to eq 0
    end
  end
end
