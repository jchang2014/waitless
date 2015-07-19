class RestaurantsController < ApplicationController

	def index
		parameters = { term: params[:search], limit:10}
		location_filter = (params[:location].length > 0) ? params[:location] : "San Francisco"
    p "*" * 50
    puts params[:search]
    puts params[:location]
    puts location_filter

  	response = Yelp.client.search(location_filter, parameters).as_json
    @results = []
    puts response
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
      format.json {
        render json: { results: @results }
      }
    end
  end


  def show
    render :_result
  end
end
