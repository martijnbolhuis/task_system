module ApplicationHelper

  def community_admin?
    @community_user.role == 'admin'
  end

  def can_edit_object? object
    object.user == @user or @community_user.role == 'admin'
  end
end
