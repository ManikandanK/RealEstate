class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties

  def admin?
    has_role? :admin
  end

  def agent?
    has_role? :agent
  end


  before_create do
    add_role :customer
  end
end
