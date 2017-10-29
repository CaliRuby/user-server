require 'net/http'
require 'tmpdir'

module Prawn::Extensions::Markdown::Fragments
  class ImageFragment < MarkdownFragment
    def render_on(pdf_object)
      if is_remote_uri?
        filename = @content.first.split('/').last
        file_path = "#{Dir.tmpdir}/#{filename}"
        content = Net::HTTP.get(URI.parse(@content.first))
        File.open(file_path, 'wb') do |f|
          f.puts content
        end
      else
        file_path = File.expand_path(@content.first)
      end
      pdf_object.image file_path, width: 100
    end

    private

    def is_remote_uri?
      !/^(http:|https:)/.match(@content.first).nil?
    end
  end
end
