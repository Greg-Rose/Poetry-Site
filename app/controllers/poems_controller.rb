class PoemsController < ApplicationController
  def index
    @poems = Poem.paginate(page: params[:page], per_page: 8).order(:sort)
  end

  def show
    @poem = Poem.find(params[:id])
  end
end
