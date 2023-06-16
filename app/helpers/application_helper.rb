module ApplicationHelper
  def isAdmin?
    return session[:isAdmin?] == true
  end
end
