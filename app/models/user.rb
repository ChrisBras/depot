class User < ActiveRecord::Base
  after_destroy :ensure_an_admin_remains

  attr_accessible :name, :password_digest, :password, :password_confirmation

  validates :name, presence: true, uniqueness: true
  has_secure_password

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise 'Can\'t delete last user'
      end
    end
end
