class NotifyUsersWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservation.where(id: reservation_id).first
    # if reservation.notify_now?
    #   p "*" * 50
    #   p 'sidekiq running'
      # message = JSON.load(message)
    ReservationMailer.contact_email(reservation.user.name, reservation.user.email).deliver
    # end
  end
end
