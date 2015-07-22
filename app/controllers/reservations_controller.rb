class ReservationsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new(number_in_party: params[:reservation][:number_in_party],
																	 user_id: session[:user_id], restaurant_id: params[:restaurant_id], timer: @restaurant.wait_time, name: params[:reservation][:name])
		if @reservation.save
			redirect_to "/users/#{session[:user_id]}"
		else
			@errors = @reservation.errors.full_messages
			redirect "/restaurant/#{params[:restaurant_id]}"
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
		respond_to do |format|
			format.html {
				render :partial => "reservations/edit", locals: {reservation: @reservation} 
			}
		end
	end

	def update

	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		p @destroyed

		respond_to do |format|
      format.json {
        render json: @reservation.id
      }
    end
	end
end
