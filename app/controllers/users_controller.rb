# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_filter :signed_in_user,
    only: [:index, :edit, :update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @title = @user.name
    @tasks = @user.tasks.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    redirect_to home_path if signed_in?
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
       redirect_to home_path
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: "ユーザ#{@user.name}を更新しました。" }
        #format.json { head :no_content }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "ログインしてください"
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  #def admin_user
  #  redirect_to(root_path) unless current_user.admin?
  #end
end
