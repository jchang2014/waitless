class RestaurantsController < ApplicationController
	def index
		parameters = { term: "restaurants", limit:20}
		@location_filter = "Embarcadero"
    iterator = 0
  	response = Yelp.client.search(@location_filter, parameters).as_json
  	@results = []
  	for i in 0..9
  		@business = response['hash']['businesses'][i]
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
	  	longitude: @business['location']['coordinate']['longitude']
	  	})
  	end

  	render 'index', locals: {results: @results}

	end

  def show
    render :_result
  end
end
