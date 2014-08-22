class CreateTableProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description, null: false
      t.integer :user_id, null:false
      t.datetime :created_at
    end
  end
end
