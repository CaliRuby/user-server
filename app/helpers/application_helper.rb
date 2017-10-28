module ApplicationHelper
  # this maps controller with its associated nav item in navbar
  NAV_MAPPING = {
    'profiles' => 'Profile',
    'workspace' => 'Home',
    'documents' => 'Documents',
  }

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

  #
  # Returns all items who belong to navbar rendering
  #
  # @return [ Array ]
  #
  def navbar_items
    [
      ['Home', 'home', workspace_path, :get],
      ['Profile', 'male', users_profiles_path, :get],
      ['Documents', 'file-code-o', new_document_path, :get],
      ['Log Out', 'hand-spock-o', destroy_user_session_path, :delete]
    ]
  end

  #
  # Evaluates if active_nav_item exists, if not, it returns a default value, it
  # is necessary for making a nav item active on main navbar
  #
  # @return [ Array ]
  #
  def active_nav_item
    content_for(:active_nav_item) || NAV_MAPPING[controller_name] || 'Home'
  end
end
