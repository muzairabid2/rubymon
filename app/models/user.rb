class User < ActiveRecord::Base
  before_create :generate_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_presence_of :email

  has_many :teams
  has_many :monsters



  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:facebook_uid => auth.uid).first
    unless user
      user_with_same_email = User.where(:email => auth.info.email).first
      if user_with_same_email
        user_with_same_email.update_attributes(:facebook_uid => auth.uid)
        #user_with_same_email.skip_confirmation!
        return user_with_same_email
      else
        user = User.new(
                        :facebook_uid => auth.uid,
                        :email => auth.info.email.blank? ? "dumy@dumy.com" : auth.info.email,
                        :password => Devise.friendly_token[0, 20]
        )
        user.save
        return user
      end
    end
    puts "FB hash", auth
    user
  end


  protected

  def generate_token
    self.authentication_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(:authentication_token => random_token)
      update_attributes!(:authentication_token => random_token)
    end
  end


end
