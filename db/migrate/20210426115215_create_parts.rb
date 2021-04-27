class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      
      t.string      :name        ,null: false               
      t.string      :number      ,null: false, unique: true
      t.integer     :category_id ,null: false
      t.string      :material    ,null: false
      t.integer     :price       ,null: false
      t.integer     :supplier_id ,null: false
      t.references  :user        ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
