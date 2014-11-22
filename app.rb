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


