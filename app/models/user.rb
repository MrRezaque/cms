class User < ActiveRecord::Base
  rolify
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  has_many :pages, foreign_key: :created_by_id
  has_and_belongs_to_many :roles, :join_table => :users_roles

  validates :username,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            },
            format: {
                with: /\A[a-zA-Z0-9]+\z/,
                message: "only allows letters and numbers"
            },
            length: {
                minimum: 3,
                maximum: 30
            }

  validates :email,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            } # etc.

  before_create do
    self.username = self.username.downcase
    self.email    = self.email.downcase
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login] #, :lockable

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["username = :value OR email = :value", { :value => login }]).first
    else
      where(conditions.to_h).first
    end
  end
end
