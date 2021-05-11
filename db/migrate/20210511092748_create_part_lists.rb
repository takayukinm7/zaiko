class CreatePartLists < ActiveRecord::Migration[6.0]
  def change
    create_table :part_lists do |t|
      t.references  :product        ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
