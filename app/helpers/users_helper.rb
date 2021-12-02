module UsersHelper
  def creator_permissions?(user)
    current? user || user.admin?
  end
  
  def current?(user)
    current_user == user
  end
end
