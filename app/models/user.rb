class User < ApplicationRecord
    has_many :access
    has_many :device
end
