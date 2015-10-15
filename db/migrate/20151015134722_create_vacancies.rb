class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.date :created_date
      t.integer :validity
      t.integer :salary
      t.string :contact

      t.timestamps null: false
    end
  end
end
