class AddDepositReceivedStatusToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :deposit_received_status, :boolean
  end
end
