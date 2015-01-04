require 'rails_helper'

RSpec.describe "Products", :type => :request do

  let!(:products) { create_list(:product, 3) }

  describe "GET /products" do

    it "lists all products" do
      visit products_path
      verify_product_list
    end

  end

  describe "POST /products" do

    it "adds a product to the list", js: true do
      visit products_path
      click_link 'new_product_link'
      within('form#new_product') do
        fill_in('product_name', with: Faker::Commerce.product_name)
        fill_in('product_price', with: Faker::Commerce.price)
      end
      click_button 'Create Product'
      expect(page).to have_selector("#product_#{Product.last.id}")
    end

  end

  def verify_product_list
    expect(page).to have_selector('#products')
    products.each do |product|
      expect(page).to have_selector("#product_#{product.id}")
    end
  end

end
