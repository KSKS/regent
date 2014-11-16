class PagesController < ApplicationController

  def home
  end

  def capitol_hill
  end
  
  def redmond
  end

  def bakery
  end

  def redmond_menu
    response = RestClient.get 'http://api.singleplatform.co/locations/regent-bakery--cafe/menu', 
                    { 
                      params: {
                        'client' => 'c3sbrpbtkbs5gverurfkxpemc',
                        'sig' => 'IjeNxhBZLU0ay4A9YFnetnLf-ys'
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

    render json: result
  end
end
