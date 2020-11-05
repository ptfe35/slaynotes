class Public::HomeController < ApplicationController

def top
end

def about
end

def new_guest
  user = EndUser.find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
  end
  sign_in user
  redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
end

end
