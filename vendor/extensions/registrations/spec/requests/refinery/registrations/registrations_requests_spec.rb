require "spec_helper"

module Refinery
  module Registrations

    describe "Registrations request specs", type: :request do

      before(:each) do
        Refinery::Registrations::Engine.load_seed
      end

      it "successfully gets the index path as redirection" do
        get("/registrations")
        expect(response).to be_redirect
        expect(response).to redirect_to("/registrations/new")
      end

      it "successfully gets the new path" do
        get("/registrations/new")
        expect(response).to be_success
        expect(response).to render_template(:new)
      end

      it "successfully gets the thank_you path" do
        get("/registrations/thank_you")
        expect(response).to be_success
        expect(response).to render_template(:thank_you)
      end

    end
  end
end
