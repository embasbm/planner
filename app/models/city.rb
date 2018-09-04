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

  def recommend_activities(options)
    data_structure = recommend_result_by(options)
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

  private
    def filter_result_by(options)
      filtered = activities
      filtered = filtered.by_category(options[:category]) if options[:category].present?
      filtered = filtered.by_location(options[:location]) if options[:location].present?
      filtered = filtered.by_district(options[:district]) if options[:district].present?
      filtered
    end

    def recommend_result_by(options)
      recommend = activities
      if options[:range].present?
        range_start_at = options[:range].split('-')[0]
        range_start_at = DateTime.strptime(range_start_at, "%H:%M")

        range_end_at = options[:range].split('-')[1]
        range_end_at = DateTime.strptime(range_end_at, "%H:%M")

        recommend = recommend.select do |x|
          suitable_days = x.opening_days.select do |day|
            if day.opens_at.blank? || day.closes_at.blank?
              true
            else
              open_at = DateTime.strptime(day.opens_at, "%H:%M")
              close_at = DateTime.strptime(day.closes_at, "%H:%M")
              open_at < range_start_at && range_end_at < close_at
            end
          end
          suitable_days.present?
        end
      end
      if options[:category].present?
        recommend = recommend.select { |x| x.category.downcase.match(options[:category].downcase) }
      end
      recommend
    end
end
