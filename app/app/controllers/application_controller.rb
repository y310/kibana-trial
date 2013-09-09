class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :collect_metrics

  rescue_from Exception do
    head 400
  end

  def collect_metrics
    yield
  ensure
    env['rack.metrics'] = params.slice(:user_id, :controller, :action).merge(
      path: request.path,
      user_agent: request.user_agent,
      method: request.method
    )
  end
end
