class PresentationsController < ApplicationController
  resource_controller
  
  before_filter :require_user
  before_filter :require_owner, :only => [:show, :update]
  
  actions :new, :show, :create, :edit, :update
  
  create.before {object.user = current_user}
  create.wants.html {redirect_to current_user}

  update.wants.html {redirect_to current_user}
end
