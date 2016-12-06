class CreateLibreta < ActiveRecord::Migration[5.0]
  def change
    create_table :libreta do |t|
      t.string :nombre
      t.integer :tlf

      t.timestamps
    end
  end
end
