# encoding: utf-8
require "spec_helper"

module Refinery
  module Registrations
    describe "registrations", type: :feature do

      before(:each) do
        Refinery::Registrations::Engine::load_seed
      end

      describe "Create registration" do

        before do
          visit refinery.new_registrations_registration_path
        end

        it "should create a new item" do
          fill_in "registration_full_name", :with => "Test"
          fill_in "registration_email_address", :with => "Test"
          fill_in "registration_phone_number", :with => "Test"
          fill_in "registration_ussa_number", :with => "Test"
          fill_in "registration_fis_number", :with => "Test"
          fill_in "registration_street_address", :with => "Test"
          fill_in "registration_city", :with => "Test"
          fill_in "registration_state", :with => "Test"
          fill_in "registration_zip", :with => "Test"
          fill_in "registration_athlete_previous_sponsorship_level", :with => "Test"
          fill_in "registration_athlete_previous_sponsorship_brand", :with => "Test"
          fill_in "registration_athlete_previous_sponsorship_brand_other", :with => "Test"
          fill_in "registration_athlete_team_club_name", :with => "Test"
          fill_in "registration_athlete_age_group", :with => "Test"
          fill_in "registration_athlete_coach_name", :with => "Test"
          fill_in "registration_athlete_preferred_race_center", :with => "Test"
          fill_in "registration_coach_team_club_name", :with => "Test"
          fill_in "registration_coach_position", :with => "Test"
          fill_in "registration_coach_preferred_race_center", :with => "Test"

          click_button ::I18n.t('.refinery.registrations.registrations.new.send')

          expect(page).to have_content("Thank You")
          expect(Refinery::Registrations::Registration.count).to eq(1)
        end
      end
    end
  end
end

