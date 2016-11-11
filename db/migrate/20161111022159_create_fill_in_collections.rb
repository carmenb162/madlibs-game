class CreateFillInCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :fill_in_collections do |t|
      t.string :verb1
      t.string :noun1
      t.string :noun2
      t.string :noun3
      t.string :noun4
      t.string :adjective1
      t.string :adjective2
      t.string :adjective3
      t.string :adjective4
      t.string :adverb1

      t.timestamps
    end
  end
end
