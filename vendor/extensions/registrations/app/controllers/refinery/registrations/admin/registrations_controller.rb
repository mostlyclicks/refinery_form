module Refinery
  module Registrations
    module Admin
      class RegistrationsController < Refinery::AdminController

        crudify :'refinery/registrations/registration', 
                :title_attribute => "full_name", 
                :order => "created_at DESC"

        def index
          if searching?
            search_all_registrations
          else
            find_all_registrations
          end

          @grouped_registrations = group_by_date(@registrations)
        end


        private

        # Only allow a trusted parameter "white list" through.
        def registration_params
          params.require(:registration).permit(:full_name, :email_address, :phone_number, :ussa_number, :fis_number, :street_address, :city, :state, :zip, :athlete_previous_sponsorship_level, :athlete_previous_sponsorship_brand, :athlete_previous_sponsorship_brand_other, :athlete_team_club_name, :athlete_age_group, :athlete_coach_name, :athlete_preferred_race_center, :coach_team_club_name, :coach_position, :coach_preferred_race_center)
        end
      end
    end
  end
end
