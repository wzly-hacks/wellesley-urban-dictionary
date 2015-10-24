class AddTopicToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :topic_id, :integer
    add_index :entries, :topic_id
  end
end
