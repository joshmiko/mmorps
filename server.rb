require "sinatra"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}


get '/index' do
  if session[:visit_count].nil?
    session[:visit_count] = 1
    session[:computer_score] = 0
    session[:player_score] = 0


  else
    session[:visit_count] += 1
  end
  erb :index
end

post '/index' do
session[:user_input] = params[:user_input]
session[:computer_input] = ["rock", "paper", "scissors"].sample


  computer_score = session[:computer_score]
  player_score = session[:player_score]


  if session[:user_input] == session[:computer_input]
        player_score += 0
        computer_score += 0

      elsif session[:user_input] == "rock" && session[:computer_input] == "scissors"
        player_score += 1

      elsif session[:user_input] == "scissors" && session[:computer_input] == "paper"
        player_score += 1

      elsif session[:user_input] == "paper" && session[:computer_input] == "rock"
        player_score += 1

      else
        computer_score += 1
      end
  session[:computer_score] = computer_score
  session[:player_score] = player_score
    redirect '/index'
 end

 get '/reset' do
  session.clear
  redirect '/index'
end


 #player won
