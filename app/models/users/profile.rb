class Users::Profile
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :address, type: String

  belongs_to :user, class_name: 'User'

  validates :first_name, :last_name, presence: :true, on: :update

  #
  # Returns user full name, and you can decide if you only want to return the first part of the name
  # using the option 'short'
  #
  # @param [ Hash ] options
  #
  # @return [ String ]
  #
  def full_name(options = {})
    short = options[:short] || false
    macro = [first_name, last_name].map { |name| short ? name.try(:split, ' ').try(:first) : name }
    macro.join(' ').titleize
  end
end
