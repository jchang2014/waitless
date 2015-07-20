class ReservationsController < ApplicationController
	def create
		@reservation = Reservation.new(number_in_party: params[:reservation][:number_in_party], user_id: sessions[:user_id])
		if @reservation.save
			redirect_to '/'
		else
			redirect '/restaurants'
		end
	end
end
