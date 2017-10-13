module Users::ProfilesHelper
  #
  # Returns a pseudo-ramdom url to a funny robot image
  #
  # @param [ User ] user
  # @return [ String ]
  #
  def photo_url(user)
    Faker::Avatar.image(user.profile.full_name)
  end
end
