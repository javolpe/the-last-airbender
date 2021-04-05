class SearchController < ApplicationController
  def index
    @total_members = AirbenderService.total_members(params[:nation])
  end
end