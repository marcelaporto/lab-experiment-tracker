class Procedure < ApplicationRecord
  belongs_to :experiment
  has_many :equipments
  has_many :comments, as: :commentable
  has_many :observations, as: :observational

  def gather_equipment(list)
    all_equipment = list.split(",").collect{|s| s.strip.downcase}.uniq
    all_equipment.each do |equipment|
      self.equipments << Equipment.create(description: equipment, procedure_id: self.id)
    end
  end

end
