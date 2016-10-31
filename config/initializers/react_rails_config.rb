#reactjs

config = Rails.application.config

config.react.server_renderer = React::ServerRendering::ExecJSRenderer
config.react.addons = true

if Rails.env.development?
  config.react.variant = :development
elsif Rails.env.production?
  config.react.variant = :production
end
