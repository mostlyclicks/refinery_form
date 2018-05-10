module Refinery
  module Registrations
    class RegistrationsController < ::ApplicationController

      before_action :find_page, :only => [:create, :new]

      def index
        redirect_to refinery.new_registrations_registration_path
      end

      def thank_you
        @page = Refinery::Page.where(link_url: "/registrations/thank_you").first
      end

      def new
        @registration = Registration.new
      end

      def create
        @registration = Registration.new(registration_params)

        if @registration.save
          begin
            Mailer.notification(@registration, request).deliver_now
          rescue => e
            logger.warn "There was an error delivering the registration notification.\n#{e.message}\n"
          end

          if Registration.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@registration, request).deliver_now
            rescue => e
              logger.warn "There was an error delivering the registration confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to Registration if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_registrations_registrations_path
        else
          render :action => 'new'
        end
      end

      protected

      def find_page
        @page = Refinery::Page.where(link_url: "/registrations/new").first
      end

      private

    # Only allow a trusted parameter "white list" through.
      def registration_params
        params.require(:registration).permit(:full_name, :email_address, :phone_number, :ussa_number, :fis_number, :street_address, :city, :state, :zip, :athlete_previous_sponsorship_level, :athlete_previous_sponsorship_brand, :athlete_previous_sponsorship_brand_other, :athlete_team_club_name, :athlete_age_group, :athlete_coach_name, :athlete_preferred_race_center, :coach_team_club_name, :coach_position, :coach_preferred_race_center)
      end
    end
  end
end
