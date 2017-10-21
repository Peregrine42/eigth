class Session

  extend ActiveModel::Naming

  def initialize c=nil
    @cookie = c
  end

  def username
    @cookie[:username]
  end

  def username= name
    @cookie[:username] = name
  end

  def to_key
    nil
  end

  def to_model
    Session.new
  end

  def persisted?
    return false unless @user
    @cookie[:user_id] == @user.id
  end

end
