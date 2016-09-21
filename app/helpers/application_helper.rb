module ApplicationHelper
  def root_url
    '/'
  end

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end


  def variable_lister(model_instance)
    info = model_instance.attributes
  end

  def variable_formatter(variable)
    variable.capitalize.gsub("_", " ")
  end

end
