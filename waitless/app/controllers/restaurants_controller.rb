class RestaurantsController < ApplicationController
	def index
		parameters = { term: params[:search], limit:20}
		@location_filter = (params[:location].length > 0) ? params[:location] : "San Francisco"
  	@response = Yelp.client.search(@location_filter, parameters).as_json

    if @response['hash']['total'] != 0
    	@results = []
    	for i in 0..9
    		@business = @response['hash']['businesses'][i]
        @restaurant = Restaurant.where(yelp_id: @business['id']).first
        @restaurant == nil ? @id = 'new' : @id = @restaurant.id

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
    render :_result
  end
end
