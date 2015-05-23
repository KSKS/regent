class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def fetch_menu(location)
    client_id = "c3sbrpbtkbs5gverurfkxpemc"
    if location == :redmond
      sig = 'IuvsJcoL3dVSOGy2UJoUp0PewfI'
      location_id = "regent-bakery-and-cafe"
    else
      sig = 'IjeNxhBZLU0ay4A9YFnetnLf-ys'
      location_id = "regent-bakery--cafe"
    end

    response = RestClient.get "http://api.singleplatform.co/locations/#{location_id}/menu", 
                    { 
                      params: {
                        'client' => client_id,
                        'sig' => sig
                      },
                      :accept => :json
                    }

    data = JSON.parse(response.body)

    main_menu = data["menus"].first { |m| m["title"] == 'Main Menu' }

    return null unless main_menu

    result = []

    current = {}
    main_menu["entries"].each do |e|
      if e["type"] == "section"
        if !current.empty?
          result << current
        end
        current = { "list" => e, "items" => [] }
      else
        current["items"] << e
      end
    end
    if !current.empty?
      result << current
    end

    return result
  end

end
