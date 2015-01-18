module PersistenceLayers
  module Neo4j
    class User
      include ::Neo4j::ActiveNode

      has_one :out, :role, type: :role, model_class: false, dependent: :destroy

      property :handle, type: String
      index :handle
      property :encrypted_password
      property :created_at, type: DateTime
      property :updated_at, type: DateTime

      ## Database authenticatable
      property :email, type: String, null: false, default: ''
      index :email

      ## Rememberable
      property :remember_created_at, type: DateTime
      index :remember_token

      ## Recoverable
      property :reset_password_token
      index :reset_password_token
      property :reset_password_sent_at, type:   DateTime

      ## Trackable
      property :sign_in_count, type: Integer, default: 0
      property :current_sign_in_at, type: DateTime
      property :last_sign_in_at, type: DateTime
      property :current_sign_in_ip, type:  String
      property :last_sign_in_ip, type: String

      ## Confirmable
      # property :confirmation_token
      # index :confirmation_token
      # property :confirmed_at, type: DateTime
      # property :confirmation_sent_at, type: DateTime
      # property :unconfirmed_email
      # property :confirmation_url

      ## Lockable
      property :failed_attempts, type: Integer, default: 0
      property :locked_at, type: DateTime
      property :unlock_token, type: String
      index :unlock_token
    end
  end
end
