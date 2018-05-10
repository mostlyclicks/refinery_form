require "spec_helper"

describe "registrations admin routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to new" do
    expect( :get => "/refinery/registrations/new" ).to route_to(
      :controller => "refinery/registrations/admin/registrations",
      :action => "new",
      :locale => :en
    )

  end

  it "can route to create" do
    expect( :post => "/refinery/registrations" ).to be_routable
  end

  it "can route to show" do
    expect( :get => "/refinery/registrations/1" ).to route_to(
      :controller => "refinery/registrations/admin/registrations",
      :action => "show",
      :id => '1',
      :locale => :en
    )
  end

  it "can route to edit" do
    expect( :get => "/refinery/registrations/1/edit" ).to route_to(
      :controller => "refinery/registrations/admin/registrations",
      :action => "edit",
      :id => "1",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/refinery/registrations/1" ).not_to be_routable
  end

  it "does route to delete" do
    expect( :delete => "/refinery/registrations/1" ).to route_to(
      :controller => "refinery/registrations/admin/registrations",
      :action => "destroy",
      :id => '1',
      :locale => :en
    )
  end

end
