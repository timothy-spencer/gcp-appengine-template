class ApplicationController < ActionController::Base
  basicauth_pw = ENV.fetch('BASICAUTH_PASSWORD') {''}
  if basicauth_pw != '' then
    logger.info "setting basic auth password"
    http_basic_authenticate_with name: "myuser", password: basicauth_pw
  end
end
