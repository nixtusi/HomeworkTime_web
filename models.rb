ActiveRecord::Base.establish_connection
require 'bundler/setup'
Bundler.require

class User < ActiveRecord::Base
    has_secure_password
    validates :password,
        format: {with:/(?=.*?[a-z])(?=.*?[0-9])/},
        length: {in: 5..10}
        
    has_many :homeworks
end

class Homework < ActiveRecord::Base
    belongs_to :user
end
