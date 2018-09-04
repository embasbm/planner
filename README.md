## About

The goal of this project is to write a web API to help select activities to do in Madrid (or any city).

## CONCERNS

After a file is posted, a city with that namefile is creAted. I'm not sure when/how to start with reading/parsing the file and create the nested records: should it be a Service, or just use a private method in Cities_controller?

Decided to go for Service, since reading the file is kind of out of the City scaffold scope.

## REFERENCE
embasbm@gmail.com

## TODOs

 - Make scopes:
    -- convert all
```ruby
filtered = filtered.select { |x| x.category.downcase.match(category.downcase) } if category.present?

filtered = filtered.select { |x| x.location.downcase.match(location.downcase) } if location.present?

filtered = filtered.select { |x| x.district.downcase.match(district.downcase) } if district.present?```


in `City.scopes`
