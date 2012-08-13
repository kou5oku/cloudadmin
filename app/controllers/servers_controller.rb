class UsersController < ApplicationController

  def new
    @server = Server.new
  end

  def index
    @server = Server.paginate(page: params[:page])
  end

   def create
    @server = Server.new(params[:user])
    if @server.save
       redirect_to @user
    else
      render 'new'
    end
  end

   def edit
   end
end