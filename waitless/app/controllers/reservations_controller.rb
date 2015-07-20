class ReservationsController < ApplicationController
	def create
		@reservation = Reservation.new(params[:reservation])
		if @reservation.save
			redirect '/'
		else
			redirect '/restaurants'
		end
	end
end
