require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'massive.mail3r@gmail.com',
            :password             => 'password',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
    to      'junji.asada@pastoraldog.com'
    cc      'roof@odd-e.com, suzuki11109@gmail.com, anuchit.prasertsang@gmail.com'
    from    'massive.mail3r@gmail.com'
    subject 'Please activate your CallJumer account'
    body    'Welcome to the Call Jumper Membership,
            Please click the https://calljumper.com/verified/ to activate your member account.
            Sincerely
            Call jumper Membership Team'
end
