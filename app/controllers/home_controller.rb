class HomeController < ApplicationController
  def user
    session[:isAdmin?] = false
  end

  def admin
    session[:isAdmin?] = true
  end
end
