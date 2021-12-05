module UsersHelper
  def creator_permissions?(user, creator = nil)
    user&.role?(:admin) || current?(creator) || false
  end
  
  def current?(user)
    current_user == user
  end
end
