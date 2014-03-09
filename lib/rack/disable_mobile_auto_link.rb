module Rack
  class DisableMobileAutoLink
    ALLOW_DISABLE_KEYS = %w(telephone email address).freeze

    def initialize(app, targets)
      @app = app

      @targets = targets.select {|target| ALLOW_DISABLE_KEYS.include?(target) }
    end

    def call(env)
      status, headers, response = @app.call(env)

      injected_response = Rack::Response.new([], status, headers)
      if response.respond_to?(:to_ary)
        response.each do |fragment|
          injected_response.write inject_mobile_tags(fragment)
        end
      end

      injected_response.finish
    end

    private

    def inject_mobile_tags(response)
      format_detections = @targets.map {|target| "#{target}=no" }.join(',')

      meta_tags = "<meta name='format-detection' content='#{format_detections}'>"

      response.sub(%r{</head>}, "#{meta_tags}</head>")
    end
  end
end
