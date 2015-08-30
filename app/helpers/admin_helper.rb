module AdminHelper
  def get_current_user_role
    if current_user.has_role? :admin
      "Admin"
    elsif current_user.has_role? :content_manager, Page
      "Content-ninja"
    else
      "Unknown"
    end
  end
end

