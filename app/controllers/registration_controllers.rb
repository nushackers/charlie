class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:failure] = "Registrations are disabled"
  end
  
  def create
    flash[:failure] = "Registrations are disabled"
  end
end
