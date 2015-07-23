class RestaurantsController < ApplicationController

  before_filter :admin?, :except => [:index, :show]

  def index
    @search = (params[:search].length > 0) ? params[:search] : "restaurants"
    parameters = { term: @search, limit:10}
    location_filter = (params[:location].length > 0) ? params[:location] : "San Francisco"

    @response = Yelp.client.search(location_filter, parameters).as_json

    if @response['hash']['total'] != 0
      @results = []
      for i in 0..9
        @business = @response['hash']['businesses'][i]
        @categories = []
        @business['categories'].each do |category|
          @categories.push(category[0])
        end

        @restaurant = Restaurant.where(yelp_id: @business['id']).first
        # @id = @restaurant ? @restaurant.id : 'new'
        # @restaurant.id if @id = @restaurant.id
        if !@restaurant
          @restaurant = Restaurant.create(
            yelp_id: @business['id'],
            title: @business['name']
            )
        end

        @id = @restaurant.id

        @results.push(
        {
        name: "#{@business['name']}",
        location: @business['location']['display_address'],
        image: "#{@business['image_url']}",
        rating: @business['rating_img_url'],
        categories: @categories.join(', '),
        latitude: @business['location']['coordinate']['latitude'],
        longitude: @business['location']['coordinate']['longitude'],
        id: @id,
        #wait_time: @restaurant.wait_time
        })
    	end
    else
      @results = nil
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

  def edit
    
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @response = Yelp.client.business(@restaurant.yelp_id).as_json['hash']
    @reservations = @restaurant.reservations
    @new_reservation = Reservation.new(restaurant: @restaurant)
    @categories = []
    @response['categories'].each do |category|
      @categories.push(category[0])
    end

    @result = {name: @response['name'],
              location: @response['location']['display_address'],
              image: @response['image_url'],
              rating: @response['rating_img_url'],
              categories: @categories.join(', '),
              latitude: @response['location']['coordinate']['latitude'],
              longitude: @response['location']['coordinate']['longitude'],
              review_count: @response['review_count']
              }
    render :show, locals: {result: @result}
  end

  def new

  end

end
