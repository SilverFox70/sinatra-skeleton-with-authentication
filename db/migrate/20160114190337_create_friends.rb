class CreateFriends < ActiveRecord::Migration
  def change
    create_table    :friends do |t|
      t.integer     :user_id, null: false
      t.integer     :target_user_id
      t.integer     :relationship_code, null: false
      t.string      :relationship_description

      t.timestamps(null: false)
    end
  end
end
