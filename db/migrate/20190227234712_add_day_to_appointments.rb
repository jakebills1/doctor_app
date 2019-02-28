class AddDayToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :day, :string
  end
end
