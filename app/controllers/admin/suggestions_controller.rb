class Admin::SuggestionsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

end
