require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params["team"])
      params.select {|param, data| param != "team"}.each do |member, details|
        Superhero.new(details)
      end

      @superheroes = Superhero.all
      erb :team
    end
end
