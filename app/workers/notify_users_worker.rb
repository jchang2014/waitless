class NotifyUsersWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservation.where(id: reservation_id).first
    ReservationMailer.contact_email(reservation.user.name, reservation.user.email).deliver
  end
end
