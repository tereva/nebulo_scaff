require 'rails_helper'

RSpec.describe "Appreciations", type: :request do
  describe "GET /appreciations" do
    it "works! (now write some real specs)" do
      get appreciations_path
      expect(response).to have_http_status(200)
    end
  end
end
