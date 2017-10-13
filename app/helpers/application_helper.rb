module ApplicationHelper
  # Devise anywhere session stuff
  def resource_name
    :user
  end

  #
  # Just a trick for having access to the devise resource anywhere
  #
  # @return [ User ]
  #
  def resource
    @resource ||= User.new
  end

  #
  # Just a trick for having access to the devise mapping anywhere
  #
  # @return [ Object ]
  #
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
