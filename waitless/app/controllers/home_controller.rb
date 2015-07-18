class HomeController < ApplicationController
  def index
  	parameters = { term: params[:term], limit:16}
  	render json: Yelp.client.search('San Francisco, parameters')
  end

  def search

  end
end
