class SetupDatabase < ActiveRecord::Migration
  def up
    create_table :tweets do |t|
      t.text :description
      t.string :author
      t.boolean :positive, :default => false
      t.timestamps
    end
  end

  def down
    raise IrreversibleMigration
  end
end
