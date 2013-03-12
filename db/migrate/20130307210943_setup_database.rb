class SetupDatabase < ActiveRecord::Migration
  def up
    create_table :miners do |t|
      t.string :url
      t.timestamps
    end

    create_table :tweets do |t|
      t.references :miner
      t.text :description
      t.string :author
      t.timestamps
    end
  end

  def down
    raise IrreversibleMigration
  end
end
