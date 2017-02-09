class User < ActiveRecord::Base
has_many :review
def full_name
  return "#{first_name} #{last_name}"
end
end
