module EventsHelper

  def is_user_admin?
    @user.admin?
  end

end
