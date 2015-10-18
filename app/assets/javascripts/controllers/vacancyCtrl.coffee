JobsApp.controller 'VacancyCtrl', ['$scope', 'Restangular', ($scope, Restangular) ->

  Restangular.setRequestSuffix('.json');
  $scope.vacancies = Restangular.all('vacancies').getList().$object;

  $scope.message = 'vacancies'

  $scope.idSelected = 0;
  $scope.idRelSelected = 0;

  $scope.setSelected = (idSelected) ->
    $scope.idSelected = idSelected
    Restangular.one('vacancies', idSelected).get({applicants: true}).then (c) ->
      $scope.currentVacancy = c;
      $scope.setRelSelected(c.applicants[0]);
    return

  $scope.getSkillClass = (id, skillId, skills) ->
    if id == $scope.idSelected
      if $scope.compareSkill(skillId, skills) then 'list-group-item-success' else 'list-group-item-danger'

  $scope.setRelSelected = (applicant) ->
    $scope.idRelSelected = applicant.id;
    $scope.currentApplicant = applicant;

  $scope.compareSkill = (skillId, skills) ->
    skills.some (el) ->
      el.id == skillId
]
