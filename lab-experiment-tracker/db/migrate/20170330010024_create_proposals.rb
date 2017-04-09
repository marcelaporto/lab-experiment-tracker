class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.integer :status, :default => 1
      t.text :summary
      t.text :hypothesis
      t.integer :user_id

      t.timestamps
    end
  end
end
