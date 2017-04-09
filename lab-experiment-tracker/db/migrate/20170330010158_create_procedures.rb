class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.string :body
      t.integer :experiment_id

      t.timestamps
    end
  end
end
