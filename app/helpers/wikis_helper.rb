module WikisHelper
  def new_line_to_html(text)
    text.gsub("\n", "<br>")
  end

  def user_is_authorized_for_wiki(wiki)
    if wiki.private?
      current_user && (current_user.id == wiki.user_id || current_user.admin?)
    else
      current_user
    end    
  end
end
