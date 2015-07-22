class ReservationMailer < ApplicationMailer
<<<<<<< HEAD

  def contact_email(name, email)
    @name = name
    @email = email
    mail(
      to: @email,
      subject: "Hi #{@name}, your reservation is ready" )
=======
  def contact_email(name,email,message)
    @name = name
    @email = email
    @message = message
    mail(from: @email,
         to: '',
         subject: 'Reservation Ready' )
>>>>>>> 8fcdd97417ede989b331d0370a5532e68441397c
  end
end
