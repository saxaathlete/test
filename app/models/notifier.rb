class Notifier < ActionMailer::Base
  default_url_options[:host] = "localhost:3000"

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "Binary Logic Notifier cherry.dkp@gmail.com"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "Binary Logic Notifier cherry.dkp@gmail.com"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

end
