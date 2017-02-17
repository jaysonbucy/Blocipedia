module WikisHelper
  def new_line_to_html(text)
    text.gsub("\n", "<br>")
  end
end
