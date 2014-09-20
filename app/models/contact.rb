class Contact < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, allow_blank: true }

  before_save { 
    self.name = name.downcase
    self.email = email.downcase
 }

 default_scope { order('name DESC') }
end
