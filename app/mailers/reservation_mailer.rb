class ReservationMailer < ApplicationMailer

  def contact_email(user)
    @user = user
    @message = 'ready!'
    mail(to: @user.email,
         subject: 'Reservation Ready' )
  end
end
