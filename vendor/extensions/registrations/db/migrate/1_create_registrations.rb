class CreateRegistrations < ActiveRecord::Migration

  def up
    create_table :refinery_registrations do |t|
      t.string :full_name
      t.string :email_address
      t.string :phone_number
      t.string :ussa_number
      t.string :fis_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :athlete_previous_sponsorship_level
      t.string :athlete_previous_sponsorship_brand
      t.string :athlete_previous_sponsorship_brand_other
      t.string :athlete_team_club_name
      t.string :athlete_age_group
      t.string :athlete_coach_name
      t.string :athlete_preferred_race_center
      t.string :coach_team_club_name
      t.string :coach_position
      t.string :coach_preferred_race_center

     t.timestamps
    end

    add_index :refinery_registrations, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "registrations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/registrations"})
    end

    drop_table :refinery_registrations
  end

end
