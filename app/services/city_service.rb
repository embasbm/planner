module CityService
  class << self
    def create_city_content(city, file)
      content_file = JSON.parse(file.read)
      return unless content_file
      create_activities(city, content_file)
    end

    def create_activities(city, content_file)
      content_file.each do |activity_params|
        opening_hours = activity_params.delete('opening_hours')
        position = activity_params.delete('latlng')
        new_activity = Activity.create!(activity_params.merge(city: city))

        create_timetable(new_activity, opening_hours)
        create_position(new_activity, position)
      end
    end

    def create_timetable(activity, opening_hours)
      opening_hours.each do |day|
        opens_at = day[1].blank? ? '' : day[1][0].split('-')[0]
        closes_at = day[1].blank? ? '' : day[1][0].split('-')[1]

        OpeningDay.create!(
          name: day[0],
          opens_at: opens_at,
          closes_at: closes_at,
          activity: activity
        )
      end
    end

    def create_position(activity, position)
      Position.create!(
        latitude: position[0],
        longitud: position[1],
        activity: activity
      )
    end
  end
end
