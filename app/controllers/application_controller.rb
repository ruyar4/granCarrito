class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :do_common_stuff
  def do_common_stuff
  	@controllerName = self.class.name.sub("Controller", "").singularize
  	@acctionName = params["action"].to_s
  end
end
