module Devise
  #
  # If a user is not authenticatable you can redirect to a specific page.
  # see more info here: https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-when-the-user-can-not-be-authenticated
  #
  class CustomFailure < Devise::FailureApp
    #
    # Just a redirect...
    #
    def redirect_url
      root_path
    end

    #
    # You need to override respond to eliminate recall
    #
    def respond
      http_auth? ? http_auth : redirect
    end
  end
end
