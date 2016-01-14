class CreateUsers < ActiveRecord::Migration
  def change
    create_table    :users do |t|
      t.string      :first_name, null: false
      t.string      :last_name, null: false
      t.string      :email, null: false
      t.integer     :age
      t.string      :gender
      t.string      :bio
      t.integer     :role
      t.string      :slug
      t.string      :password_hash, null: false

      t.timestamps(null: false)
    end
  end
end
