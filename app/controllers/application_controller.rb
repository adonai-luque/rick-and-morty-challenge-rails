require "http"
require "json"

class ApplicationController < ActionController::Base

  def index
    start = Time.now
    @rick_and_morty = {
      "locations" => get_locations,
      "episodes" => [],
      "characters" => []
    }
    finish = Time.now
    puts(finish - start)
    render template: "layouts/application"
  end

  private
  def get_locations
    next_url = "https://rickandmortyapi.com/api/location"
    locations = {}
    until next_url == nil
      data = JSON.parse(HTTP.get(next_url).body)
      next_url = data["info"]["next"]
      data["results"].each { |location| locations[location["id"]] = location["name"] }
    end
    return locations
  end

  def get_episodes
  end

  def get_characters
  end
end
