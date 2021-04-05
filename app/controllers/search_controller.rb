class SearchController < ApplicationController
  def index
    @total_members = AirbenderService.total_members(params[:nation])
    @first_25 = AirbenderService.first_25_members(params[:nation])
  end
end