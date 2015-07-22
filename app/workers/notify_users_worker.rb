class NotifyUsersWorker
  include Sidekiq::Worker

<<<<<<< HEAD
  def perform(reservation_id)
    reservation = Reservation.where(id: reservation_id).first
    # if reservation.notify_now?
    #   p "*" * 50
    #   p 'sidekiq running'
      # message = JSON.load(message)
    ReservationMailer.contact_email(reservation.user.name, reservation.user.email).deliver
    # end
=======
  def perform(message, reservation_id)
    reservation = Reservation.where(id: reservation_id).first
    if reservation.notify_now?
      message = JSON.load(message)
      ReservationMailer.contact_email(message['name'], message['email'], message['message']).deliver
    end
>>>>>>> 8fcdd97417ede989b331d0370a5532e68441397c
  end
end
