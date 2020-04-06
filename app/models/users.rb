class User < ActiveRecord::Base
    has_many :pins
    has_secure_password
end