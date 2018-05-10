module Refinery
  module Registrations
    class Setting
      class << self
        def confirmation_message
          Refinery::Setting.find_or_set(:registration_confirmation_message,
            "Thank you for your registration %name%,\n\nThis email is a receipt to confirm we have received your registration and we'll be in touch shortly.\n\nThanks."
          )
        end

        def confirmation_subject
          Refinery::Setting.find_or_set(:registration_confirmation_subject,
                                        "Thank you for your registration")
        end

        def notification_recipients
          Refinery::Setting.find_or_set(:registration_notification_recipients,
                                        "you@example.com")
        end

        def notification_subject
          Refinery::Setting.find_or_set(:registration_notification_subject,
                                        "New registration from your website")
        end

        def confirmation_message=(value)
          Refinery::Setting.set(:registration_confirmation_message, value)
        end

        def confirmation_subject=(value)
          Refinery::Setting.set(:registration_confirmation_subject, value)
        end

        def notification_recipients=(value)
          Refinery::Setting.set(:registration_notification_recipients, value)
        end
      end
    end
  end
end
