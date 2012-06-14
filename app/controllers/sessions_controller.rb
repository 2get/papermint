# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      sign_in user
      redirect_back_or home_path
    else
      flash.now[:error] = "無効なメールアドレス／パスワードの組み合わせです"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
