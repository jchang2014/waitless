class ReservationMailer < ApplicationMailer
  def contact_email(name,email,message)
    @name = name
    @email = email
    @message = message
    mail(from: @email,
         to: '',
         subject: 'Reservation Ready' )
  end
end
