class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
  set :database, "sqlite3:db/nyc#{ENV['SINATRA_ENV']}.sqlite"
  set :method_override, :true

  get "/" do
    erb :'application/root'
  end

  helpers do
    def all_landmarks
      Landmark.all
    end

    def all_figures
      Figure.all
    end

    def all_titles
      Title.all
    end

    def available_landmarks
      Landmark.all.find_all {|landmark| landmark.figure == nil}
    end

    def insert_html(path,local_vars ={})
      erb path.to_sym, {}, local_vars
    end
  end
end
