class RestaurantsController < ApplicationController

  before_filter :admin?, :except => [:index, :show]

  def index

    parameters = { term: params[:search], limit:10}
    location_filter = (params[:location].length > 0) ? params[:location] : "San Francisco"

    response = Yelp.client.search(location_filter, parameters).as_json
    @results = []
    for i in 0..9
      @business = response['hash']['businesses'][i]
      @categories = []
      @business['categories'].each do |category|
        @categories.push(category[0])
      end

      @restaurant = Restaurant.where(yelp_id: @business['id']).first
      if @restaurant == nil
        @id = 'new'
      else
        @id = @restaurant.id
      end

      @results.push(
      {
      name: "#{@business['name']}",
      location: @business['location']['display_address'],
      image: "#{@business['image_url']}",
      rating: @business['rating_img_url'],
      categories: @categories.join(', '),
      latitude: @business['location']['coordinate']['latitude'],
      longitude: @business['location']['coordinate']['longitude'],
      id: @id
      })
    end

    respond_to do |format|
      format.html {
        render "index", layout: false, locals: {results: @result}
      }
      format.json {
        render json: @results
      }
    end
  end

  def show
    #render "_result", layout: false, locals: { results: @results }
  end

  def new
  end
end
