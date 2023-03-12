module ApplicationHelper

  def owner?(object)
    current_user == object.user
  end

  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

end
