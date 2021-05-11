class CreatePartCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :part_counts do |t|
      t.integer     :count          ,null: false
      t.references  :product_part   ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
