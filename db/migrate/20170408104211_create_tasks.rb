class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
