class Sabrina::PoemsController < ApplicationController
  before_action :authorize_admin

  def index
    @poems = Poem.order(:sort)
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.new(poem_params)

    if @poem.save
      redirect_to sabrina_poem_path(@poem)
    else
      flash.now[:alert] = "You must include the title and body of your poem"
      render 'new'
    end
  end

  def edit
    @poem = Poem.find(params[:id])
  end

  def update
    @poem = Poem.find(params[:id])

    if @poem.update(poem_params)
      redirect_to sabrina_poem_path(@poem)
    else
      flash.now[:alert] = "You must include the body of your poem"
      render 'edit'
    end
  end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy

    redirect_to sabrina_poems_path
  end

  private

  def authorize_admin
    if !admin_signed_in?
      redirect_to root_path
    end
  end

  def poem_params
    params.require(:poem).permit(:title, :body)
  end
end
