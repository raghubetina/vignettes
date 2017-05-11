Rails.application.routes.draw do
  # Routes for the Response resource:
  # CREATE
  get "/responses/new", :controller => "responses", :action => "new"
  post "/create_response", :controller => "responses", :action => "create"

  # READ
  get "/responses", :controller => "responses", :action => "index"
  get "/responses/:id", :controller => "responses", :action => "show"

  # UPDATE
  get "/responses/:id/edit", :controller => "responses", :action => "edit"
  post "/update_response/:id", :controller => "responses", :action => "update"

  # DELETE
  get "/delete_response/:id", :controller => "responses", :action => "destroy"
  #------------------------------

  # Routes for the Vignette resource:
  # CREATE
  get "/vignettes/new", :controller => "vignettes", :action => "new"
  post "/create_vignette", :controller => "vignettes", :action => "create"

  # READ
  get "/vignettes", :controller => "vignettes", :action => "index"
  get "/vignettes/:id", :controller => "vignettes", :action => "show"

  # UPDATE
  get "/vignettes/:id/edit", :controller => "vignettes", :action => "edit"
  post "/update_vignette/:id", :controller => "vignettes", :action => "update"

  # DELETE
  get "/delete_vignette/:id", :controller => "vignettes", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
