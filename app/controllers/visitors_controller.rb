class VisitorsController < ApplicationController
  def index
    @applicants = Applicant.active
    @vacancies = Vacancy.active
  end
end
