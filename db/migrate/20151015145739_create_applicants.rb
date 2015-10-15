class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :contact
      t.integer :status
      t.integer :salary

      t.timestamps null: false
    end
  end
end
