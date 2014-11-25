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

 if params[:typeoforganisation] == "Grassroots" && params[:thecause] == "Healthcare"
 	erb :grassroots_healthcare

 elsif params[:typeoforganisation] == "Grassroots" && params[:thecause] == "Education"
 	erb :grassroots_education
 	
 elsif params[:typeoforganisation] == "Grassroots" && params[:thecause] == "Environment"
 	erb :grassroots_environment

 elsif params[:typeoforganisation] == "Grassroots" && params[:thecause] == "Wildlife"
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

post '/' do
  @user_name  = params[:user_name]
  @email_address = params[:email_address]
  @chosen_charity = params[:chosen_charity]  
  
Pony.mail( 
	:to => @email_address, 
	:from => 'nikkiravi92@gmail.com', 
	:subject => 'Christmas Loving!', 
	:body => 'Hi ' + @name + '! Merry Christmas! Your friend just donated to' + @chosen_charity + ' as your Christmas present! ', 
	:via => :smtp, 
	:via_options => { 
		:address => 'smtp.gmail.com', 
	    :port => '25'
	}
	)
  erb :thanks

end

