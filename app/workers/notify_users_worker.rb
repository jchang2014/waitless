class NotifyUsersWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservation.where(id: reservation_id).first
    ReservationMailer.notify_email(@reservation.user).deliver
  end
end
