class AdminController < AdminPanelController
  def root
  end

  def info
    render 'pages/test'
  end

  def users
    authorize! :list, User
    @users = User.all
    @admins = User.all.select{|user| user.has_role? :admin}
    @content_managers = User.all.select{|user| user.has_role? :content_manager, Page}
  end

  def approve_articles
    authorize! :approve, Page
    @pages = Page.waiting_for_approve
  end

end
