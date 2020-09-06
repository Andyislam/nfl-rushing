class WelcomeController < ApplicationController
  def index
  	require 'open-uri'
	require 'json'
	begin
		json = JSON.load(open("https://raw.githubusercontent.com/tsicareers/nfl-rushing/master/rushing.json"))
	rescue
		json = {error: true}
	end
	render json: json
  end
end
