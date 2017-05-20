class PoemsController < ApplicationController
  def index
    @poems = Poem.order(:sort)
  end

  def show
    @poem = Poem.find(params[:id])
  end
end
