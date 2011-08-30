class Group < ActiveRecord::Base
  
  #---------------#
  # allow_manage? #
  #---------------#
  def allow_manage?( user_id )
    return false if user_id.blank?
    return false if self.user_id != user_id
    return true
  end
  
end
