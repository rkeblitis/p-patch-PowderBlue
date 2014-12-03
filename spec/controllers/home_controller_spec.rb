require "rails_helper"

describe HomeController do
  describe "GET index" do
    it "returns http success 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
