class Users::ProfilesController < ApplicationController
  before_action :set_user

  def index
  end

  def edit
  end

  def update
    if @user.update_attributes(profile_params)
      redirect_to users_profiles_path, notice: 'Profile was succesfully updated'
    else
      render :edit
    end
  end

  private


  def profile_params
    params.require(:user).permit(
      profile_attributes: [:id, :first_name, :last_name, :phone, :address],
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end
end
