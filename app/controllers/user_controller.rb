class UserController < DeviseController
  prepend_before_filter :require_no_authentication
  prepend_before_filter :allow_params_authentication!

  def magic
    self.resource = resource_class.new_with_session(sign_up_params || {}, session)
    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_in(resource_name, resource)
        respond_with resource, location: '/'
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: '/'
      end
    else
      clean_up_passwords resource

      @validatable = devise_mapping.validatable?

      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end

      if resource.errors.messages[:email] == [ 'has already been taken' ]
        self.resource = warden.authenticate!(auth_options)
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        respond_with resource
      end
    end
  end

  def non_magic
    redirect_to '/', notice: flash[:alert]
  end

  private

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#non_magic" }
  end

end
