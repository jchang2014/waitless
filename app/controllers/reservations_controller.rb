class ReservationsController < ApplicationController
	before_action :authorize
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new(
			number_in_party: params[:reservation][:number_in_party],
			user_id: session[:user_id],
			restaurant_id: params[:restaurant_id],
			timer: @restaurant.wait_time, name: params[:reservation][:name])

		if @reservation.save
			NotifyUsersWorker.perform_in(@reservation.notification_delay.minutes, @reservation.id)
			@restaurant.update_wait_time
			@reservation.update_timer
			render json: @reservation
			#redirect_to "/users/#{session[:user_id]}"
		else
			@errors = @reservation.errors.full_messages
			render json: @reservation.errors, status: :unprocessable_entity
			#redirect "/restaurant/#{params[:restaurant_id]}"
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
		@reservation = Reservation.find(params[:id])
		@reservation.number_in_party = params[:number]
		@reservation.save
		respond_to do |format|
			format.json {
				render json: @reservation.number_in_party
			}
		end
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
