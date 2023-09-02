# This migration comes from panda (originally 20210725015354)
class CreatePandaProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :panda_profiles do |t|
      t.string :store # jsonb
      t.references :user, null: false, foreign_key: {to_table: :panda_users}

      t.timestamps
    end
  end
end
