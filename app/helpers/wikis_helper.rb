module WikisHelper
  # def new_line_to_html(text)
  #   text.gsub("\n", "<br>")
  # end

  def user_is_authorized_for_wiki(wiki)
    if wiki.private?
      current_user && (current_user.id == wiki.user_id || wiki.collaborators.ids.include?(current_user.id) || current_user.admin?)
    else
      current_user
    end
  end

  def markdown(wiki)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank'},
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: false
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(wiki).html_safe
  end
end
