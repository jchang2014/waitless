class RestaurantsController < ApplicationController

	def index
		parameters = { term: params[:search], limit:10}
		location_filter = (params[:location].length > 0) ? params[:location] : "San Francisco"

  	response = Yelp.client.search(location_filter, parameters).as_json
    @results = []
    # puts response
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
    render "_result", layout: false, locals: { results: @results }
  end
end
