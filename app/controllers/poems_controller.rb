class PoemsController < ApplicationController
  def index
    @poems = Poem.order(:sort).paginate(page: params[:page], per_page: 12)
  end

  def show
    @poem = Poem.find(params[:id])
  end
end
