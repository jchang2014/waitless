class NotifyUsersWorker
  include Sidekiq::Worker

  def perform(message, reservation_id)
    reservation = Reservation.where(id: reservation_id).first
    if reservation.notify_now?
      p "*" * 50
      p 'sidekiq running'
      message = JSON.load(message)
      ReservationMailer.contact_email(message['name'], message['email'], message['message']).deliver
    end
  end
end
