define_grid columns: 12, rows: 40, gutter: 0

repeat(:all) do
  stroke_bounds
end

partial! 'documents/header'

grid([3.4, 0.2], [38,10.8]).bounding_box do
  partial! 'documents/body'
end

fill_color '000000'
number_pages "página <page> de <total>", { start_count_at: 2, page_filter: -> (pg) { pg != 1 }, at: [bounds.right - 95, 738], align: :left, size: 12, style: :normal }
