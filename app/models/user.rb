class User < ApplicationRecord
  # Include default devise modules.
  # For reference: :Confirmable, :rememberable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :registerable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  belongs_to :company
  has_many :repositories, through: :company

  enum role: [:dev, :admin, :super_admin]

  after_initialize do
    if self.new_record?
      self.role ||= :dev
    end
  end

  def admin?
    role.to_sym == :admin
  end

  def super_admin?
    role.to_sym == :super_admin
  end
end
