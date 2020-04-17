class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_header?
    true
  end

  helper_method :render_header?
end
