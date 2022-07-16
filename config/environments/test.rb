# frozen_string_literal: true

# The test environment is used exclusively to run your application's
# test suite. You never need to work with it otherwise. Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs. Don't rely on the data there!

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Precompile poltergeist_disable_transition.css for tests
  config.assets.precompile += %w[poltergeist_disable_transition.css]

  # Don't precompile all themes for tests
  config.assets.precompile += %w[
    color_themes/original/desktop.css
    color_themes/dark_green/desktop.css
    color_themes/original/mobile.css
    jasmine-load-all.js
    jasmine-jquery.js
  ]

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Store uploaded files on the local file system in a temporary directory.
  # config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Set the logging destination(s)
  config.log_to = %w[file]

  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # for fixture_builder
  ENV["FIXTURES_PATH"] = "spec/fixtures"
end
