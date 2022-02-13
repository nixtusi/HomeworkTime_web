ActiveRecord::Base.establish_connection

class User < ActiveRecord::Base
    has_secure_password
    # validates :mail,
    #     presence: true,
    #     format: {with:/\A.+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+\z/}
    # validates :password,
    #     format: {with:/(?=.*?[a-z])(?=.*?[0-9])/},
    #     length: {in: 5..10}
        
    # has_many :homeworks
    # has_many :record
end

class Homework < ActiveRecord::Base
    # belongs_to :user
end