class ReservationMailer < ApplicationMailer

  def notification(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email)
  end

end
