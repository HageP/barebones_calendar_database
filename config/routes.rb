Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "events#index"
  # Routes for the Lease resource:
  # CREATE
  get "/leases/new", :controller => "leases", :action => "new"
  post "/create_lease", :controller => "leases", :action => "create"

  # READ
  get "/leases", :controller => "leases", :action => "index"
  get "/leases/:id", :controller => "leases", :action => "show"

  # UPDATE
  get "/leases/:id/edit", :controller => "leases", :action => "edit"
  post "/update_lease/:id", :controller => "leases", :action => "update"

  # DELETE
  get "/delete_lease/:id", :controller => "leases", :action => "destroy"
  #------------------------------

  # Routes for the Status resource:
  # CREATE
  get "/statuses/new", :controller => "statuses", :action => "new"
  post "/create_status", :controller => "statuses", :action => "create"

  # READ
  get "/statuses", :controller => "statuses", :action => "index"
  get "/statuses/:id", :controller => "statuses", :action => "show"

  # UPDATE
  get "/statuses/:id/edit", :controller => "statuses", :action => "edit"
  post "/update_status/:id", :controller => "statuses", :action => "update"

  # DELETE
  get "/delete_status/:id", :controller => "statuses", :action => "destroy"
  #------------------------------

  # Routes for the Tenant resource:
  # CREATE
  get "/tenants/new", :controller => "tenants", :action => "new"
  post "/create_tenant", :controller => "tenants", :action => "create"

  # READ
  get "/tenants", :controller => "tenants", :action => "index"
  get "/tenants/:id", :controller => "tenants", :action => "show"

  # UPDATE
  get "/tenants/:id/edit", :controller => "tenants", :action => "edit"
  post "/update_tenant/:id", :controller => "tenants", :action => "update"

  # DELETE
  get "/delete_tenant/:id", :controller => "tenants", :action => "destroy"
  #------------------------------

  # Routes for the Apartment resource:
  # CREATE
  get "/apartments/new", :controller => "apartments", :action => "new"
  post "/create_apartment", :controller => "apartments", :action => "create"

  # READ
  get "/apartments", :controller => "apartments", :action => "index"
  get "/apartments/:id", :controller => "apartments", :action => "show"

  # UPDATE
  get "/apartments/:id/edit", :controller => "apartments", :action => "edit"
  post "/update_apartment/:id", :controller => "apartments", :action => "update"

  # DELETE
  get "/delete_apartment/:id", :controller => "apartments", :action => "destroy"
  #------------------------------

  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
