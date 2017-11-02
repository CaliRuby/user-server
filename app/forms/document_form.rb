class DocumentForm
  include ActiveAttr::Model

  DEFAULT_CONTENT = <<~HEREDOC
  # Title 1
  ## Title 2
  ### Title 3
  #### Title 4
    * first element
    * second element

    1. first element
    2. second element

  this is the [repo](https://github.com/CaliRuby/user-server) related with this meetup, and our [meetup page](https://www.meetup.com/cali-ruby-meetup), enjoy it!

  Cali Ruby ![repo](http://res.cloudinary.com/analisistem/image/upload/v1509648892/CALI_RUBY_2016_2_iqustf.jpg)
  HEREDOC

  attribute :body, default: DEFAULT_CONTENT

  validates :body, presence: true
end
