class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :heading
      t.text :description
      t.string :uuid

      t.timestamps
    end
  end
end
