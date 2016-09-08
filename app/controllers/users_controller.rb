class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      return redirect_to user_path(@user)
    else
      return render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :tickets, :nausea, :admin)
  end
end




# <h2>Sign up</h2>
# <%= form_for @user do |f| %>
#   <% @user.attributes.each do |name| %>
#   <br />
#   <%= f.label name[0].to_sym %>
#   <%= f.text_field name[0].to_sym %>
#   <% end %>
#   <%= f.submit "Create User" %>
# <% end %>


