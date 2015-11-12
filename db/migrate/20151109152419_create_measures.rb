class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.integer :value

      t.timestamps null: false
    end

    add_reference :measures, :sensor
  end
end
