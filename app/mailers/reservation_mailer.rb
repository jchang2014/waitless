class ReservationMailer < ApplicationMailer
  def notify_email(user)
    mail(to: user.email) do |format|
      format.html { render layout: 'mailer' }
      format.text
    end
  end
end
