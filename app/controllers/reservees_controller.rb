class ReserveesController < ApplicationController

  def contact
    h = JSON.generate({ 'name' => @reservation.user.name,
                        'email'=> @reservation.user.email,
                        'message' => "Your Reservation is in 5 minutes"})

    NotifyUserWorker.perform_in(3.seconds, @reservation.id)

    redirect_to :root
  end
end
