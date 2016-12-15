class AddEmail < ActiveRecord::Migration[5.0]
  
   def change
		add_column :libreta, :email, :string
   end
end
