class PoemsController < ApplicationController
  def index
    @poems = Poem.order(created_at: :desc)
  end

  def show
    @poem = Poem.find(params[:id])
  end
end
