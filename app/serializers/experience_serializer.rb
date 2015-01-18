class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description

  has_one :host
  has_many :times
end
