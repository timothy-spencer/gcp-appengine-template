class ApplicationController < ActionController::Base
	  http_basic_authenticate_with name: "myuser", password: "notreally4asecret"
end
