class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    authenticated_root_path
  end
end
