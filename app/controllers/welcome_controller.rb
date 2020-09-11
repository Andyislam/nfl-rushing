# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
  	require 'open-uri'
    require 'json'
  	redis = Redis.new(host: "localhost")
    @cashed_json = cashed_json redis
    @col_headers = col_headers redis
    
  end

  def col_headers redis
  	redis.get("headers").split(",")
  end

  def cashed_json redis
	if redis.get("data") == nil
  		headers = []

		begin
	  		data = JSON.load(open('http://raw.githubusercontent.com/tsicareers/nfl-rushing/master/rushing.json').read)
	  		data.map {|d|
	  			d.keys.each_with_index do |k, index|
	  				d[index] = d[k]
	  				headers << k
	  				d.delete(k)
	  			end
	  		}
	  	rescue
	  		data = {error: true}
	  	end
		redis.setex("headers", 300 , headers.uniq.join(","))

		redis.setex("data", 300 , data.to_json)
  	end
	JSON.parse(redis.get("data"))
  end
end


