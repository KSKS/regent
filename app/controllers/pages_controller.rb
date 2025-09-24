class PagesController < ApplicationController

  def home
  end

  def issaquah
  end
  
  def bellevue
  end

  def bakery
  end

  def bellevue_menu
    render json: fetch_menu(:bellevue)
  end

  def issaquah_menu
    render json: fetch_menu(:issaquah)
  end

  def issaquah_food
  end

  def bellevue_food
  end

  def drinks
  end

  def mooncakes
  end

end

