require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShoutToTheWell
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.autoload_paths += %W(#{config.root}/lib)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

#エラーメッセージの日本語化
# デフォルトのロケールを:en以外に変更する
config.i18n.default_locale = :ja

# I18nライブラリに訳文の探索場所を指示する
config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]