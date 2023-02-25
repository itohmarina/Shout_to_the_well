class Public::SuggestionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @suggestion =Suggestion.new
  end

  def confirm
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user_id =current_user.id
    if @suggestion.invalid?
      render "public/suggestions/new"
    end
  end



  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user_id =current_user.id
    if params[:back] || !@suggestion.save
      render "public/suggestions/new"
    else
      redirect_to suggestions_thanks_path
    end
  end

  def thanks
  end


private


def suggestion_params
  params.require(:suggestion).permit(:title, :body,)
end


end
