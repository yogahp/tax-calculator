require 'rails_helper'

RSpec.describe "Taxes", type: :request do
  describe "GET /taxes" do
    it "works! (now write some real specs)" do
      get api_v1_taxes_path
      expect(response).to have_http_status(200)
    end
  end
end