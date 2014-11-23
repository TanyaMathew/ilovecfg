require 'sinatra'

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

## post '/email' do
## ??????
## end

