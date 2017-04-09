class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.string :title, :null => false
      t.integer :scientist_id, :null => false
      t.integer :proposal_id
      t.text :results
      t.text :conclusions

      t.timestamps
    end
  end
end
