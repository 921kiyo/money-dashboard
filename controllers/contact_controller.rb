require('pry-byebug')
get '/contact' do
  erb(:"contact/contact")
end

post '/contact' do
  send_message #This uses the helper method send_message to deal with the message that was posted.
  flash[:notice] = "Thank you for your message. We'll be in touch soon." #flash to display a thank-you message to the user before redirecting them back to the Home page
  redirect(to("/contact"))
end

def send_message
  Pony.mail(
    :from => params[:name] + "<" + params[:email] + ">",
    :to => 'hello@gmail.com',
    :subject => params[:name] + " has contacted you",
    :body => params[:message],
    # :port => '587',
    :via => :smtp,
    :via_options => {
      :address => 'smtp.gmail.com',
      :port => '587',
      :enable_starttls_auto => true,
      :user_name => 'hello@gmail.com',
      :password => '921kiyohito', # Put PW only when doing presentation (Link for gmail setting: https://www.google.com/settings/security/lesssecureapps)
      :authentication => :plain,
      :domain => 'localhost.localdomain'
      })
end
#smtp is a server name


