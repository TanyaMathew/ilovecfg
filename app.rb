require 'sinatra'
require 'pony'

get '/' do
	erb :entrypage
end

post '/' do
	@name = params[:user_name]

  if @name.length >= 2
  	erb :index

  else
  	erb :apologies
  end
end

get '/charitychooser' do
	erb :charitychooser
end

post '/charitychooser' do
  @typeoforganisation = params[:typeoforganisation]
  @thecause = params[:thecause]

 if params[:typeoforganisation] == "Local" && params[:thecause] == "Healthcare"
 	erb :grassroots_healthcare

 elsif params[:typeoforganisation] == "Local" && params[:thecause] == "Education"
 	erb :grassroots_education
 	
 elsif params[:typeoforganisation] == "Local" && params[:thecause] == "Environment"
 	erb :grassroots_environment

 elsif params[:typeoforganisation] == "Local" && params[:thecause] == "Wildlife"
 	erb :grassroots_wildlife

 elsif params[:typeoforganisation] == "International" && params[:thecause] == "Healthcare"
 	erb :international_healthcare

 elsif params[:typeoforganisation] == "International" && params[:thecause] == "Education"
 	erb :international_education

 elsif params[:typeoforganisation] == "International" && params[:thecause] == "Environment"
 	erb :international_environment

 elsif params[:typeoforganisation] == "International" && params[:thecause] == "Wildlife"
 	erb :international_wildlife

 elsif params[:typeoforganisation] == "Social Enterprise" && params[:thecause] == "Healthcare"
 	erb :enterprise_healthcare

 elsif params[:typeoforganisation] == "Social Enterprise" && params[:thecause] == "Education"
 	erb :enterprise_education

 elsif params[:typeoforganisation] == "Social Enterprise" && params[:thecause] == "Environment"
 	erb :enterprise_environment

 elsif params[:typeoforganisation] == "Social Enterprise" && params[:thecause] == "Wildlife"
 	erb :enterprise_wildlife 	 	 	
 
 else 
 	print "You have not chosen any options"

 end
end

get '/email' do
	erb :email
end

post '/email' do
  @user_name  = params[:user_name]
  @email_address = params[:email_address]
  @chosen_charity = params[:chosen_charity]  
  
Pony.mail( 
	:to => @email_address, 
	:subject => 'Christmas Loving!', 
	:body => 'Hi ' + @user_name + '! Merry Christmas! Your friend just donated to' + @chosen_charity + ' as your Christmas present!', 
	:via => 'smtp', 
	:via_options => {
	    :domain => "localhost.localdomain", 
	    :address => 'smtp.gmail.com', 
	    :port => '587',
		#:user_name => ENV['SENDGRID_USERNAME'],
    	#:password => ENV['SENDGRID_PASSWORD'],
    	:user_name => 'christmascharitychooser@gmail.com',
    	:password => 'codefirstgirls',
	    :authentication => :plain,
    	:enable_starttls_auto => true
	}
	)
  erb :thanks

end

