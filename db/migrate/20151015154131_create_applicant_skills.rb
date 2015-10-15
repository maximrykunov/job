class CreateApplicantSkills < ActiveRecord::Migration
  def change
    create_table :applicant_skills do |t|
      t.references :applicant, index: true
      t.references :skill, index: true

      t.timestamps null: false
    end
    add_foreign_key :applicant_skills, :applicants
    add_foreign_key :applicant_skills, :skills
  end
end
