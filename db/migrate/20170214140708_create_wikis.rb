class CreateWikis < ActiveRecord::Migration[5.0]
  def change
    create_table :wikis do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :private, :default => false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
