class ContactMailer < ActionMailer::Base
  default to: "pikethecrow@gmail.com"

  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject: "Clames: Interested in")
  end
end
