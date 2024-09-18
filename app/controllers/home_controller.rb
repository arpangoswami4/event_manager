

class HomeController < ApplicationController

  skip_before_action :is_user_logged_in?

  def index
  end

end
