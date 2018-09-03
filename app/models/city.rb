class City
  include Mongoid::Document
  field :name, type: String

  embeds_many :activities

  def fetch_activities(category = nil, location = nil, district = nil)
    data_structure = filter_result_by(category, location, district )
    result = []
    data_structure.each do |activity|
      point = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [activity.position&.latitude, activity.position&.longitud]
        },
        properties: {
          name: activity.name
        }
      }
      result << point
    end
    result
  end

  def filter_result_by(category, location, district)
    filtered = activities
    filtered = filtered.select { |x| x.category.downcase.match(category.downcase) } if category.present?
    filtered = filtered.select { |x| x.location.downcase.match(location.downcase) } if location.present?
    filtered = filtered.select { |x| x.district.downcase.match(district.downcase) } if district.present?
    filtered
  end
end
