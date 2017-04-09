class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :description
      t.references :procedure

      t.timestamps
    end
  end
end
