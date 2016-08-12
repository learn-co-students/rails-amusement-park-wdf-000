module UsersHelper

  def user_view
    if !session[:user_id]
      ['Sign up', new_user_path, 'Sign in', signin_path]
    elsif !User.find(session[:user_id]).admin?
      ['Log Out', logout_path]
    else ['Log Out', logout_path, 'ADMIN', root_path]
    end
  end

  def is_admin?
    session[:user_id] && User.find(session[:user_id]).admin?
  end

end
