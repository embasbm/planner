# frozen_string_literal: true

class V1::CitiesController < ApplicationController

  def create
    @city = City.new(city_params)
    if @city.save
      V1::CityService.create_city_content(@city, params[:upload])
      render json: @city, status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def show
    @city = City.find(params[:id])
    @activities = @city.fetch_activities(params[:category], params[:location], params[:district])
    render json: @activities
  end

  private
    def city_params
      params[:city] = {}
      params[:city][:name] = File.basename(params[:upload].original_filename, File.extname(params[:upload].original_filename))
      params.require(:city).permit(:name)
    end
end
