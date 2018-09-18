require "rails_helper"

RSpec.describe Api::V1::TaxesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/taxes").to route_to("api/v1/taxes#index")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/taxes").to route_to("api/v1/taxes#create")
    end
  end
end
