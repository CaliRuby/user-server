class DocumentsController < ApplicationController
  def new
    @document = DocumentForm.new
  end

  def create
    @document = DocumentForm.new(document_params)
    @prawnto_options = {
      filename: "document-#{Time.zone.now}.pdf",
      inline: true,
      prawn: { page_size: [612, 792], margin: 20, page_layout: :portrait }
    }
  end

  private

  def document_params
    params.require(:document).permit(:body)
  end
end
