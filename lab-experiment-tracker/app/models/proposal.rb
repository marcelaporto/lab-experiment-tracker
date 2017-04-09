class Proposal < ApplicationRecord
  belongs_to :user
  has_many :experiments
  has_many :comments, as: :commentable

  def get_status
    if self.status == 1
      "Open"
    elsif self.status == 2
      "In progress"
    elsif self.status == 3
      "Closed"
    else
      "Archived"
    end
  end


end
