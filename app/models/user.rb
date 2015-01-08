class User < PersistenceLayers::Neo4j::User
  has_one :out, :role, type: :role, model_class: false

  validates_uniqueness_of :email, case_sensitive: false
  validates_uniqueness_of :handle
  validates :handle, length: { in: 3..20 }

  before_destroy { role.destroy }

  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  )
end
