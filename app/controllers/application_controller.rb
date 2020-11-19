class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  # flashメッセージにnoticeとalert以外を使える様にしている
end
