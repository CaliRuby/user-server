repeat(-> (page) { page != 0 }) do
  font "Helvetica", align: :center, size: 12, position: :center
  stroke_bounds
  grid([0, 0], [1, 11]).bounding_box do
    stroke_bounds
  end
  grid([0, 0.2], [10, 5]).bounding_box do
    image File.join(Rails.root, 'app', 'assets', 'images', 'brand-dark.png'), :width => 30, vposition: 5, position: :left
  end
  grid([0, 3], [1, 8]).bounding_box do
    move_down 14
    text 'Cali Ruby Meetup', align: :center, size: 14, style: :bold
  end
  grid([2, 0.1], [2, 5]).bounding_box do
    move_down 6
    text "printed at: #{ l Time.zone.now, format: :long }", align: :left, size: 10, style: :bold
  end
end
