require "spec_helper"

module Refinery
  module Registrations
    describe RegistrationsController, type: :controller do

      before do
        @route = Refinery::Registrations::Engine.routes
        Refinery::Registrations::Engine::load_seed

        @new_page = Refinery::Page.new
        allow(Refinery::Page).to receive_messages(:where => [ @new_page ])
      end

      describe "GET new" do
        it "before_filter assigns a new registration" do
          get :new
          expect(assigns(:registration)).to be_a_new(Registration)
        end
        it "before_filter assigns page to registrations/new" do
          get :new
          expect(assigns(:page)).to eq @new_page
        end
      end

      describe "POST create" do

        before{
          allow_any_instance_of(Registration).to receive(:save).and_return( true )
        }


        it "before_filter assigns page to registrations/new" do
          post :create, registration: {full_name: "foo", email_address: "foo", phone_number: "foo", ussa_number: "foo", fis_number: "foo", street_address: "foo", city: "foo", state: "foo", zip: "foo", athlete_previous_sponsorship_level: "foo", athlete_previous_sponsorship_brand: "foo", athlete_previous_sponsorship_brand_other: "foo", athlete_team_club_name: "foo", athlete_age_group: "foo", athlete_coach_name: "foo", athlete_preferred_race_center: "foo", coach_team_club_name: "foo", coach_position: "foo", coach_preferred_race_center: "foo"}
          expect(assigns(:page)).to eq @new_page
        end

        it "before_filter assigns a new registration" do
          post :create, registration: {full_name: "foo", email_address: "foo", phone_number: "foo", ussa_number: "foo", fis_number: "foo", street_address: "foo", city: "foo", state: "foo", zip: "foo", athlete_previous_sponsorship_level: "foo", athlete_previous_sponsorship_brand: "foo", athlete_previous_sponsorship_brand_other: "foo", athlete_team_club_name: "foo", athlete_age_group: "foo", athlete_coach_name: "foo", athlete_preferred_race_center: "foo", coach_team_club_name: "foo", coach_position: "foo", coach_preferred_race_center: "foo"}
          expect(assigns(:registration)).to be_a_new(Registration)
        end

        it "redirects to thank_you" do
          post :create, registration: {full_name: "foo", email_address: "foo", phone_number: "foo", ussa_number: "foo", fis_number: "foo", street_address: "foo", city: "foo", state: "foo", zip: "foo", athlete_previous_sponsorship_level: "foo", athlete_previous_sponsorship_brand: "foo", athlete_previous_sponsorship_brand_other: "foo", athlete_team_club_name: "foo", athlete_age_group: "foo", athlete_coach_name: "foo", athlete_preferred_race_center: "foo", coach_team_club_name: "foo", coach_position: "foo", coach_preferred_race_center: "foo"}
          expect(response).to redirect_to "/registrations/thank_you"
        end

        describe "when it can't save the registration" do

          before {
          allow_any_instance_of(Registration).to receive(:save).and_return( false )
          }

          it "redirects to new if it can't save" do
            post :create, registration: {full_name: "foo", email_address: "foo", phone_number: "foo", ussa_number: "foo", fis_number: "foo", street_address: "foo", city: "foo", state: "foo", zip: "foo", athlete_previous_sponsorship_level: "foo", athlete_previous_sponsorship_brand: "foo", athlete_previous_sponsorship_brand_other: "foo", athlete_team_club_name: "foo", athlete_age_group: "foo", athlete_coach_name: "foo", athlete_preferred_race_center: "foo", coach_team_club_name: "foo", coach_position: "foo", coach_preferred_race_center: "foo"}

            expect(response).to render_template(:new)
          end
        end

      end
    end
  end
end
