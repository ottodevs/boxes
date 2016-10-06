class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.boolean :notifiable, default: true
      t.integer :primary_site
      t.string :time_zone, default: "UTC"
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end