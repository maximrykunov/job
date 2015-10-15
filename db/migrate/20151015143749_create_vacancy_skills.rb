class CreateVacancySkills < ActiveRecord::Migration
  def change
    create_table :vacancy_skills do |t|
      t.references :vacancy, index: true
      t.references :skill, index: true

      t.timestamps null: false
    end
    add_foreign_key :vacancy_skills, :vacancies
    add_foreign_key :vacancy_skills, :skills
  end
end
