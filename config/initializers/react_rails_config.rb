#reactjs

config = Rails.application.config

if Rails.env.development?
  config.react.server_renderer = React::ServerRendering::ExecJSRenderer
end

config.react.addons = true
