class Session

  attr_reader :cookie, :users, :password, :username

  def initialize c, users=nil, params=nil
    @cookie = c
    @users = users
    @username = params[:username] if params
    @password = params[:password] if params
  end

  def save
    return false unless users
    return false if username.blank?
    return false if password.blank?
    user = users.find_by(name: username)
    if user.try(:authenticate, password)
      cookie[:user_id] = user.id
      true
    else
      false
    end
  end

  def find_user
    result = users.find_by(id: cookie[:user_id])
    result ? result : User.new
  end

  def destroy
    cookie[:user_id] = nil
  end

end
