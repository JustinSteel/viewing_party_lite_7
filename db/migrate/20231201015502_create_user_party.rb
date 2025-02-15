class CreateUserParty < ActiveRecord::Migration[7.0]
  def change
    create_table :user_parties do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :view_party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
