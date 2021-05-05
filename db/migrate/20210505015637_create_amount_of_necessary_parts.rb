class CreateAmountOfNecessaryParts < ActiveRecord::Migration[6.0]
  def change
    create_table :amount_of_necessary_parts do |t|
      t.integer     :count
      t.references  :part           ,null: false, foreign_key: true
      t.references  :product        ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
