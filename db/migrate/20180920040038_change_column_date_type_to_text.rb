class ChangeColumnDateTypeToText < ActiveRecord::Migration[5.2]
  def change
    change_column :clients, :date, :text
  end
end