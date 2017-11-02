class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :redirect_to_workspace

  #
  # Overrides the default behaviour by redirecting after sign in
  #
  # @param [ Devise::Resource ] resource
  #
  def after_sign_in_path_for(resource)
    '/workspace'
  end

  #
  # Overrides the default behaviour by redirecting after sign out
  #
  # @param [ Devise::Resource ] resource
  #
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def redirect_to_workspace
    redirect_to workspace_path if user_signed_in? && request.url == root_url
  end
end
