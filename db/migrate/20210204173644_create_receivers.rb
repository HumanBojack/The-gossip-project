class CreateReceivers < ActiveRecord::Migration[6.1]
  def change
    create_table :receivers do |t|
    	t.belongs_to :user
    	t.belongs_to :private_message

      t.timestamps
    end
  end
end
