class RestaurantsController < ApplicationController
	def index
		# parameters = { term: params[:search], limit:10}
		# params[:location].length > 0 ? @location_filter = params[:location] : @location_filter = "San Francisco"

  # 	results = Yelp.client.search(@location_filter, parameters).as_json

  # 	array = []
  # 	for i in 0..9
  # 		@business = results['hash']['businesses'][i]
  # 		array.push(
  # 		[
	 #  	@name = @business['name'],
	 #  	@location = @business['location']['address'][0],
	 #  	@image = @business['image_url']
	 #  	])
	 #  end

	 #  render json: array
	end

  def show
    render :_result
  end
end
