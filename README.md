## About

The goal of this project is to write a web API to help select activities to do in Madrid (or any city).

## Test

    ```ruby
        git clone https://github.com/embasbm/planner

        cd planner

        rspec
    ```

## Live demo

    ```bash
        git clone https://github.com/embasbm/planner

        cd planner/lib

        curl -X POST \
            https://ancient-crag-14076.herokuapp.com/api/v1/cities \
            -H 'cache-control: no-cache' \
            -H 'content-type: multipart/form-data' \
            -F upload=@madrid.json
    ```
This will retrun a JSON object where we can get the the ID for the city we've just created: `{"_id":{"$oid":"5b9c1e4305aab200049e9301"},"activities":[{"...`

Now the see activities for that city, there are some filter available, e.g.

    ```bash
        curl https://ancient-crag-14076.herokuapp.com/api/v1/cities/5b9c1e4305aab200049e9301
        curl https://ancient-crag-14076.herokuapp.com/api/v1/cities/5b9c1e4305aab200049e9301?category=cultural&location=outdoors&district=Centro
    ```

There is a *recommend* end point which accepts date ranges and category:

    ```bash
        curl https://ancient-crag-14076.herokuapp.com/api/v1/cities/recommend?name=madrid
        curl https://ancient-crag-14076.herokuapp.com/api/v1/cities/recommend?name=madrid&range=10:00-13:00&category=cultural
    ```
## TODOs

~~- Make scopes for ```City Class```~~

## Reference
embasbm@gmail.com
