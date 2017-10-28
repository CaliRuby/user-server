class DocumentForm
  include ActiveAttr::Model

  attribute :body

  validates :body, presence: true
end
