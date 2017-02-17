class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
<<<<<<< HEAD
    @wikis = Wiki.all
    @user = current_user
  end

  def new
=======
    @user = current_user
    @wikis = Wiki.all
  end

  def new
    @user = current_user
>>>>>>> 2c48bf10e65329416f95713333d4894f550d91b9
    @wiki = Wiki.new
  end

  def show
<<<<<<< HEAD
=======
    @user = current_user
>>>>>>> 2c48bf10e65329416f95713333d4894f550d91b9
    @wiki = Wiki.find(params[:id])
  end

  def edit
<<<<<<< HEAD
=======
    @user = current_user
>>>>>>> 2c48bf10e65329416f95713333d4894f550d91b9
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      render :new
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
    def wiki_params
      params.require(:wiki).permit(:title, :body)
    end
end
