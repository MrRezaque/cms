class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  respond_to :html
  layout 'admin'
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  skip_before_filter :require_no_authentication, only: [:new]

#GET /resource/sign_up
  def new
    authorize! :create, User

  end

  #POST /resource
  def create
    authorize! :create, User
    resource = User.new(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      resource.add_role :content_manager, Page
      set_flash_message :notice, :"User added" if is_flashing_format?
      # redirect to somewhere
      redirect_to user_list_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      raise 'huyayz' ##error responding
      render :action => 'new'
      #respond_with resource, location => add_user_path
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
