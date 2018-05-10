# encoding: utf-8
require "spec_helper"

module Refinery
  module Registrations
    module Admin
      describe Registration, type: :feature do
        refinery_login_with :refinery_user

       describe "registrations list" do
          before do
            FactoryGirl.create(:registration, :full_name => "UniqueTitleOne")
            FactoryGirl.create(:registration, :full_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.registrations_admin_registrations_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

       describe "show" do
         let!(:registration) do
            FactoryGirl.create(:registration, :full_name => "UniqueTitleOne")
          end

         it "has expected text and menu" do
           visit refinery.registrations_admin_registrations_path

           click_link "Read the registration"

           expect(page).to have_content("UniqueTitleOne")
           expect(page).not_to have_content("UniqueTitleTwo")

           within "#actions" do
             expect(page).to have_content("Age")
             expect(page).to have_content("Back to all registrations")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/registrations']")
             expect(page).to have_content("Remove this registration forever")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/registrations/#{registration.id}']")
           end
         end
       end

       describe "when no " do
         before { Refinery::Registrations::Registration.destroy_all }

         context "registrations" do
           it "shows expected message" do
            visit refinery.registrations_admin_registrations_path

            expect(page).to have_content("You have not received any registrations yet.")

            end
           end

     end

      describe "action links" do
        before { visit refinery.registrations_admin_registrations_path }

        specify "in the side pane" do
          within "#actions" do
            expect(page).to have_content("Inbox")
            expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/registrations']")

            expect(page).to have_content("Update who gets notified")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/registrations/settings/registration_notification_recipients/edit']")
            expect(page).to have_content("Edit confirmation email")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/registrations/settings/registration_confirmation_message/edit']")
          end
        end
      end



        describe "destroy" do
          before { FactoryGirl.create(:registration, :full_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.registrations_admin_registrations_path

            click_link "Remove this registration forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Registrations::Registration.count).to eq 0
          end
        end

          describe "destroy from registration show page" do
          before { FactoryGirl.create(:registration, :full_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.registrations_admin_registration_path( :id => '1')

            click_link "Remove this registration forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Registrations::Registration.count).to eq 0
          end
          end

      end
    end
  end
end
