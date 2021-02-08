class CitiesToUsers < ActiveRecord::Migration[6.1]
  def change
  	add_reference :users, :city, foreign_key: true
  end
end
