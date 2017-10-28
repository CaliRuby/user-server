class DocumentsController < ApplicationController
  def new
    @document = DocumentForm.new
  end

  def create
  end

  private

  def document_params
    params.require(:document).permit(:body)
  end
end
