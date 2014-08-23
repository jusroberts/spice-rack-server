module ApplicationHelper

  def user_id
    current_user ? current_user.id : nil
  end

end
