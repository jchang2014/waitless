class RestaurantsController < ApplicationController
	def index
		parameters = { term: params[:search], limit:10}
		params[:location].length > 0 ? @location_filter = params[:location] : @location_filter = "San Francisco"

  	response = Yelp.client.search(@location_filter, parameters).as_json
  	@results = []
  	for i in 0..9
  		@business = response['hash']['businesses'][i]
  		@results.push(
  		{
	  	name: "#{@business['name']}",
	  	location: "#{@business['location']['address'][0]}",
	  	image: "#{@business['image_url']}",
	  	latitude: @business['location']['coordinate']['latitude'],
	  	longitude: @business['location']['coordinate']['longitude']
	  	})
  	end

  	render 'index', locals: {results: @results}
  	#render json: array

	end
end
