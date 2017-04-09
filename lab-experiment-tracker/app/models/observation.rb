class Observation < ApplicationRecord
  belongs_to :scientist, class_name: "User"
  belongs_to :observational, polymorphic: true
  has_many :comments, as: :commentable
end
