class UsersController < ApplicationController
  def downgrade
    current_user.standard!
    set_users_wikis_to_public(current_user)
    redirect_to root_path
  end

  private
  def set_users_wikis_to_public(user)
    wikis = Wiki.all
    wikis.each do |w|
      if w.user_id === user.id
        w.private = false
        w.save!
      end
    end
  end
end
