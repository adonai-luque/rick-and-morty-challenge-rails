require "http"
require "json"

class ApplicationController < ActionController::Base

  def index
    @rick_and_morty = {
      "locations" => [],
      "episodes" => [],
      "characters" => []
    }
    render template: "layouts/application"
  end

  private
end
