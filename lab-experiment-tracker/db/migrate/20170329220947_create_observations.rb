class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.string :body, :null => false
      t.integer :scientist_id, :null => false
      t.integer :observational_id
      t.string  :observational_type
      t.timestamps
    end
  end
end
