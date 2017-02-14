class WikisController < ApplicationController
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: :show

  def new
    @wiki = Wiki.new
  end
end
