require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  describe 'GET #index' do

    before(:each) { get :index }
    let!(:products) { create_list(:product, 4) }

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "loads all of the products into @products" do
      expect(assigns(:products).count).to eq(products.count)
    end
  end

end
