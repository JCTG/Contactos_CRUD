class ChangeTypeDataContactos < ActiveRecord::Migration[5.0]
  def change
      change_column :libreta, :tlf, :string
  end
end
