class MyMailer < ApplicationMailer
	 def send_email(options={})
    @name = options[:name]
    @email = options[:email]
    @message = options[:message]
    mail(:to=>"olegbabiy.ob@gmail.com", :subject=>"Amazon SES Email")
  end
end
