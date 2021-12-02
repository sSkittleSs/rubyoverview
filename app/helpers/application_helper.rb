module ApplicationHelper
  def creator_permissions?(user)
    current? user || user.admin?
  end
end
