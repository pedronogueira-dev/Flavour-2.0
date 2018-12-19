class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_contacts.subject
  #
  def send_contacts(recipient, sender, meal)
    @greeting = "Hi, #{recipient.user.first_name}"
    @sign_off = "From the Falvour Team"

    @recipient_email = recipient.user.email

    @meal_location = meal.restaurant.name
    @meal_date = meal.reservation_date

    @sender_first_name = sender.first_name
    @sender_contacts = sender.contacts.where(share: true)

    mail(to: "#{recipient.user.email}", subject: "Contact info from #{sender.first_name}")
  end
end
