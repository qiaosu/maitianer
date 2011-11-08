class User < ActiveRecord::Base
  has_many :babies
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def self.find_for_tsina_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.new(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def first_baby
    babies[0]
  end
end
