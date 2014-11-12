class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :enforce_ssl

  private

  def enforce_ssl
    if request.url.split(':')[0] == 'http'
      redirect_to request.url.sub('http', 'https')
    end if Rails.env.production?
  end

end
