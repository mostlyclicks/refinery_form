require "spec_helper"

describe "Registrations front-end routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to index" do
    expect( :get => "/registrations" ).to route_to(
      :controller => "refinery/registrations/registrations",
      :action => "index",
      :locale => :en
    )
  end

  it "can route to new" do
    expect( :get => "/registrations/new" ).to route_to(
      :controller => "refinery/registrations/registrations",
      :action => "new",
      :locale => :en
    )
  end

  it "can route to create" do
    expect( :post => "/registrations" ).to route_to(
      :controller => "refinery/registrations/registrations",
      :action => "create",
      :locale => :en
    )
  end

  it "routes to thank_you" do
    expect( :get => "/registrations/thank_you" ).to route_to(
      :controller => "refinery/registrations/registrations",
      :action => "thank_you",
      :locale => :en
    )
  end

  it "does not route to show" do
    expect( :get => "/registrations/1" ).not_to route_to(
      :controller => "refinery/registrations/registrations",
      :action => "show",
      :locale => :en
    )
  end

  it "does not route to edit" do
    expect( :get => "/registrations/1/edit" ).not_to route_to(
      :controller => "refinery/registrations/registrations",
      :action => "edit",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/registrations/1" ).not_to be_routable
  end

  it "does not route to delete" do
    expect( :delete => "/registrations/1" ).not_to be_routable
  end

end
