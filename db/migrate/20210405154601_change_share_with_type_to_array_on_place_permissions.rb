class ChangeShareWithTypeToArrayOnPlacePermissions < ActiveRecord::Migration[6.1]
  def change
    change_column :place_permissions, :share_with, :integer, array: true, default: [], using: 'ARRAY[share_with]::INTEGER[]'
  end
end
