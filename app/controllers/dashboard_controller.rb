class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:home]
  def index

  end

  def home
    redirect_to "/dashboard/" if current_user
    render :layout => "non_login" unless current_user
  end

end