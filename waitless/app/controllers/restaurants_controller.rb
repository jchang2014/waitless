class RestaurantsController < ApplicationController
	def index
    @search = (params[:search].length > 0) ? params[:search] : "restaurants"
		parameters = { term: @search, limit:20}
		@location_filter = (params[:location].length > 0) ? params[:location] : "San Francisco"
  	@response = Yelp.client.search(@location_filter, parameters).as_json

    if @response['hash']['total'] != 0
    	@results = []
    	for i in 0..9
    		@business = @response['hash']['businesses'][i]
        @restaurant = Restaurant.where(yelp_id: @business['id']).first
        
        #Auto create a new restaurant in database if it doesnt exist already
        #Potential flaw: doesn't let the user know this waitlist is inaccurate(because it's new)
        #@restaurant = Restaurant.create(yelp_id: @business['id']) if @restaurant == nil 
        
        @id = @restaurant ? @restaurant.id : 'new'


        #Pull only the "pretty" category names
    		@categories = []
    		@business['categories'].each do |category|
    			@categories.push(category[0])
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
    else
      @results = nil
    end

  	render 'index', locals: {results: @results}

	end

  def show
    @restaurant = Restaurant.find(params[:id])
    @response = Yelp.client.business(@restaurant.yelp_id).as_json['hash']
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
              longitude: @response['location']['coordinate']['longitude']
              }
    render :show, locals: {result: @result}
  end
end
