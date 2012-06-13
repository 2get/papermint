class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @task = current_user.tasks.build
      @feed_items_1 = current_user.feed_1.paginate(page: params[:page])
      @feed_items_2 = current_user.feed_2.paginate(page: params[:page])
      @feed_items_3 = current_user.feed_3.paginate(page: params[:page])
      @feed_items_4 = current_user.feed_4.paginate(page: params[:page])
    end
  end

  def help
  end
end
