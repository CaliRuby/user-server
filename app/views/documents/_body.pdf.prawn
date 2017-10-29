document_structure = Prawn::Extensions::Markdown::Parser::StringParser.new(@document.body).to_pdf
document_structure.each { |fragment| fragment.render_on(pdf) }
