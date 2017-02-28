class Collaborators < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborators do |c|
      c.belongs_to :wiki, index: true
      c.belongs_to :user, index: true
      c.timestamps
    end
  end
end
