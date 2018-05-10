
module Refinery
  module Registrations
    class Registration < Refinery::Core::BaseModel
      self.table_name = 'refinery_registrations'



      # def message was created automatically because you didn't specify a text field
      # when you ran the refinery:form generator. <3 <3 Refinery CMS.
      def message
        "Override def message in vendor/extensions/registrations/app/models/refinery/registrations/registration.rb"
      end

      alias_attribute :name, :full_name

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :full_name, :presence => true

      ATHLETE_PREVIOUS_SPONSORSHIP_LEVELS = []

      ATHLETE_PREVIOUS_SPONSORSHIP_BRANDS = []
    end
  end
end
