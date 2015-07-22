class ReservationMailer < ApplicationMailer
  def contact_email(name, email)
    @name = name
    @email = email
    mail(
      to: @email,
      subject: "Hi #{@name}, your reservation is ready" )
  end
end
