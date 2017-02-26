class UsersController < ApplicationController
  def downgrade
    current_user.standard!
    redirect_to root_path
  end
end
