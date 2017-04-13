class User < ApplicationRecord
  #below line checks that, when initialized, user has a name present and that it is uniqueness
  validates :name, presence: true, uniqueness: true

  #below line makes user re-enter password in second field and checks that passwords match
  #...it was added when I specified password:digest when I created the User model
  has_secure_password

  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end

end
