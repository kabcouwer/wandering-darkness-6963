class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.references :plot, foreign_key: true
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
