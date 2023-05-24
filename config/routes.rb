Rails.application.routes.draw do
  resources "companies"
  resources "contacts"
  resources "activities"
  resources "tasks"
  resources "users"
  resources "sessions"
  # we want a log-out route; give me a route that's logout where the controller is sessions and the action is destroy
  # identifies which controller and action should process the code; goes to sessions/destroy
  get "/logout", :controller => "sessions", :action => "destroy"
  # get "/", :controller => "sessions", :action => "new"
end
