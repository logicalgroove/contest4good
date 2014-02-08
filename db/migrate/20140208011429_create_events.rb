class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :subject, index: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :event_duration_in_minutes

      t.timestamps
    end
  end
end
