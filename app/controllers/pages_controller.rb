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
    render json: fetch_menu(:redmond)
  end

  def cap_menu
    render json: fetch_menu(:cap)
  end

  def cap_food
  end

  def redmond_food
  end

  def drinks
  end

  def mooncakes
  end

end

