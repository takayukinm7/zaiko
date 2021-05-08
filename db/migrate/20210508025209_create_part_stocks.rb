class CreatePartStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :part_stocks do |t|
      t.integer     :still_extant ,null: false               
      t.integer     :lot          ,null: false
      t.integer     :buy_point    ,null: false
      t.references  :part         ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
