class UsersController < ApplicationController
  load_and_authorize_resource :except=>[:welcome,:create_customer,:create_agent,:new_agent,:list_customers,:new_customer]
  def index
    @users = User.all
    respond_to do |format|
      format.html {render :action => "/custom/index"}
      format.json  { render :json => @users.to_json }
      format.pdf { render :action => "/custom/index.pdf.prawn", :layout => false }
    end
  end

  def list_customers
    @users = User.with_role(:customer).reverse
    respond_to do |format|
      format.html {render :action => "/custom/index"}
      format.json  { render :json => @users.to_json }
      format.pdf { render :action => "/custom/index.pdf.prawn", :layout => false }
    end
  end

  def list_agents
    @users = User.with_role :agent
    respond_to do |format|
      format.html {render :action => "/custom/index"}
      format.json  { render :json => @users.to_json }
      format.pdf { render :action => "/custom/index.pdf.prawn", :layout => false }
    end
  end

  def create_agent

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.add_role :agent
        format.html { redirect_to '/users/list_agents', notice: 'Agent was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :action => "/custom/new_agent" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def create_customer

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to '/users/list_customers', notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :action => "/custom/new_customer" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def new_agent
    @user = User.new
    render :action => "/custom/new_agent"
  end

  def new_customer
    @user = User.new
    render :action => "/custom/new_customer"
  end

  def welcome
    if current_user.admin?
      redirect_to "/users/list_agents"
    elsif current_user.agent?
      redirect_to "/users/list_customers"
    else
      redirect_to '/properties'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:users).permit(:email, :password,:password_confirmation, :full_name, :type, :phone_number, :address)
  end
end
