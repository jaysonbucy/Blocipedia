class WikisController < ApplicationController
  before_action :authenticate_user!, except: :show

  def new
    @wiki = Wiki.new
  end
end
