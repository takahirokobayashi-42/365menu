class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admins_home_path
    else
      root_path
    end
  end

  #def after_sign_in_path_for(resource_or_scope)
    #if resource_or_scope == :customer
      #root_path
    #elsif resource_or_scope == :admin
      #admins_homes_top_path
    #end
  #end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
