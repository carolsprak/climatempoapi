module Api
	module V1
        class WeatherController < ApplicationController   
            def  show
                @host = 'http://api.openweathermap.org/data/2.5/'       
                @key = 'YOUR-KEY'
                
                city = params[:city]
                @weather_city = api_request_city_weather(@host, city, @key)
                puts @weather_city
        
                render json: @weather_city   
            
            end
        
            private 
        
            # GET API city weather from Open weather map
            def api_request_city_weather(host, city, key)
              require 'net/http'
              require 'net/https'
              require 'open-uri'
              require 'json'
        
              url_weather = host + 'weather?q=' + city + '&appid=' + key
        
              uri = URI.parse(url_weather)
              http = Net::HTTP.new(uri.host, uri.port)
              request = Net::HTTP::Post.new(uri.request_uri)
              
              response = http.request(request)
        
              content = JSON.parse(response.body)
        
              return content
            
            end
        
        
		end
	end
end
