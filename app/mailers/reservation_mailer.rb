class ReservationMailer < ApplicationMailer

  def notification(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email,
         subject: 'Waitless: Time to go eat!')
  end

end
