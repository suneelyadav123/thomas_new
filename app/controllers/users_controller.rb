class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  def index
    @users = User.all.order(:name)
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      begin
        if @user.save
          format.html { redirect_to @user, :notice => 'User was successfully created.' }
        else
          format.html { render :action => "new" }
          format.json { render :json => @user.errors.full_messages.to_sentence, :status => :unprocessable_entity }
        end
      rescue Exception => e
        format.json { render :json => e.message.gsub!(e.message,"User already registered"), :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find_by_id params[:id]
    
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to users_path, :notice => 'User was successfully updated.' }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors.full_messages.to_sentence, :status => :unprocessable_entity }
      end
    end
  end

  def show

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user ||= User.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :password_confirmation, :active, :address_line1,:address_line2, :branch_name, :branch_code, :state, :pincode)
  end
end
