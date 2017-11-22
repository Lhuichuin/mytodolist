class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
    	t.string :task
    	t.integer :status, default: 0
    	t.integer :list_id
      t.timestamps
    end
  end
end
