# frozen_string_literal: true

class Api::V1::CitiesController < ApplicationController

  def create
    @city = City.new(city_params)
    if @city.save
      CityService.create_city_content(@city, params[:upload])
      render json: @city, status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def show
    @city = City.find(params[:id])
    @activities = @city.fetch_activities({category: params[:category], location: params[:location], district: params[:district]})
    render json: @activities
  end

  def recommend
    @city = City.find_by(name: params[:name])
    @activities = @city.recommend_activities({ range: params[:range], category: params[:category] })
    render json: @activities
  end

  private
    def city_params
      params[:city] = {}
      params[:city][:name] = File.basename(params[:upload].original_filename, File.extname(params[:upload].original_filename))
      params.require(:city).permit(:name)
    end
end
