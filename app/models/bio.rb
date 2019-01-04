class Bio < ApplicationRecord
  belongs_to :user


  def get_avatar
    self.profile_image.blank? ? 'default' : self.profile_image
  end
end
