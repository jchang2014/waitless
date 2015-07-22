class ReserveesController < ApplicationController

  def contact
<<<<<<< HEAD
    h = JSON.generate({ 'name' => @reservation.user.name,
                        'email'=> @reservation.user.email,
                        'message' => "Your Reservation is in 5 minutes"})

    NotifyUserWorker.perform_in(5.seconds, h, @reservation.id)
=======
    h = JSON.generate({ 'name' => @reservation.user.email,
                        'email'=> @reservation.user.email,
                        'message' => "Your Reservation is in 5 minutes"})

    NotifyUserWorker.perform_in(3.seconds, @reservation.id)
>>>>>>> 8fcdd97417ede989b331d0370a5532e68441397c

    redirect_to :root
  end
end
