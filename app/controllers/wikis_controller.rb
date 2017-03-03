class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
    @wikis = policy_scope(Wiki)
    #@wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
   @wiki = current_user.wikis.new(wiki_params)
   
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

    if @wiki.update(wiki_params)
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
      params.require(:wiki).permit(:title, :body, :private)
    end
end
