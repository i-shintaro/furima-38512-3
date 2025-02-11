class RenameBirthDataToBirthDateInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :birth_data, :birth_date
  end
end
