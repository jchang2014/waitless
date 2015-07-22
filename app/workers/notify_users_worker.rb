class NotifyUsersWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservation.where(id: reservation_id).first
    ReservationMailer.notify_email(reservation.name, @reservation.email, ["your reservation is ready bruh"]).deliver
  end
end
