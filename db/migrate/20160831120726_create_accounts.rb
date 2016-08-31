class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :ancestry
      t.string :kind
      t.references :owner, foreign_key: { to_table: :users })

      t.timestamps
    end
  end
end
