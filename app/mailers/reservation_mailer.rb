class ReservationMailer < ApplicationMailer

  def notification(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email, subject:"WaitLess- It's time to eat!")
  end

end
