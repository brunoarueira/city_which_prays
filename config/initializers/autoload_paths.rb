config = Rails.application.config

config.autoload_paths += %W(
  #{config.root}/lib
  #{config.root}/business
)
