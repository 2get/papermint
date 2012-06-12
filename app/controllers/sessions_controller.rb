# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      #session[:user_id] = user.id
      sign_in user
      #redirect_to admin_url
      redirect_back_or user
    else
      #redirect_to login_url, alert: "無効なユーザー／パスワードです"
      flash.now[:error] = "無効なメールアドレス／パスワードの組み合わせです"
      render 'new'
    end
  end

  def destroy
    #session[:user_id] = nil
    #redirect_to store_url, notice: "ログアウト"
    sign_out
    redirect_to root_path
  end
end
