require 'mail'
require './app_config.rb'

def send_confirmation_email()
    options = { :address              => "smtp.gmail.com",
                :port                 => 587,
                :user_name            => GMAIL_ACCOUNT,
                :password             => GMAIL_PASSWORD,
                :authentication       => 'plain',
                :enable_starttls_auto => true  }

    Mail.defaults do
      delivery_method :smtp, options
    end

    Mail.deliver do
        to      'roof@odd-e.com'
        cc      'suzuki11109@gmail.com, anuchit.prasertsang@gmail.com'
        from    'massive.mail3r@gmail.com'
        subject 'Please activate your CallJumer account'
        body    'Welcome to the Call Jumper Membership,
                Please click the https://calljumper.com/verified/ to activate your member account.
                Sincerely
                Call jumper Membership Team'
    end
end
