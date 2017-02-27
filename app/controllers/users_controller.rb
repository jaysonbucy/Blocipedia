class UsersController < ApplicationController
  def downgrade
    current_user.standard!
    set_users_wikis_to_public(current_user)
    redirect_to root_path
  end

  private
  def set_users_wikis_to_public(user)
    user.wikis.update_all(private: false)
  end
end
