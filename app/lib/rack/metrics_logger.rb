module Rack
  class MetricsLogger
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)

      metrics = (env['rack.metrics'] || {}).merge(
        status: status,
        runtime: headers['X-Runtime']
      )
      logger.post("kibana", metrics)
      [status, headers, body]
    end

    def logger
      @logger ||= Fluent::Logger::FluentLogger.new(nil)
    end
  end
end
