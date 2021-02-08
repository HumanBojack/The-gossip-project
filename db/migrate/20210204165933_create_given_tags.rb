class CreateGivenTags < ActiveRecord::Migration[6.1]
  def change
    create_table :given_tags do |t|
    	t.belongs_to :tag
    	t.belongs_to :gossip

      t.timestamps
    end
  end
end
