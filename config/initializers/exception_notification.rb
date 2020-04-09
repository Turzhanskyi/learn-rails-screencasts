# frozen_string_literal: true

if Rails.env == 'production' || Rails.env == 'staging' || Rails.env == 'development'

  exceptions = []
  exceptions << 'ActiveRecord::RecordNotFound'
  exceptions << 'AbstractController::ActionNotFound'
  exceptions << 'ActionController::RoutingError'
  exceptions << 'ActionController::InvalidAuthenticityToken'

  server_name = case Rails.env
                when 'production'     then 'mystore.com'
                when 'staging'        then 'staging.mystore.com'
                when 'development'    then 'DEVELOPMENT screencast.storeapp'
                else
                  'unknown env mystore'
                end

  Rails.application.config.middleware.use ExceptionNotification::Rack,
                                          email: {
                                            email_prefix: "[#{server_name} error]",
                                            sender_address: 'cpl.km.ua@gmail.com',
                                            exception_recipients: ['cpl.km.ua@gmail.com']
                                          },
                                          ignore_exceptions: exceptions
end
