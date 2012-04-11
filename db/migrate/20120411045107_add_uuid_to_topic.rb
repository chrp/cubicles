class AddUuidToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :uuid, :string

  end
end
