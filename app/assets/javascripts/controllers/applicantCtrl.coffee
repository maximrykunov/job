JobsApp.controller 'ApplicantCtrl', ['$scope', 'Restangular', ($scope, Restangular) ->

  Restangular.setRequestSuffix('.json');
  $scope.applicants = Restangular.all('applicants').getList().$object;

  $scope.message = 'applicants'

  $scope.idSelected = 0;
  $scope.idRelSelected = 0;

  $scope.setSelected = (idSelected) ->
    $scope.idSelected = idSelected
    Restangular.one('applicants', idSelected).get({vacancies: true}).then (c) ->
      $scope.currentApplicant = c;
      $scope.setRelSelected(c.vacancies[0]);
    return

  $scope.getSkillClass = (id, skillId, skills) ->
    if id == $scope.idSelected
      if $scope.compareSkill(skillId, skills) then 'list-group-item-success' else 'list-group-item-danger'

  $scope.setRelSelected = (vacancy) ->
    $scope.idRelSelected = vacancy.id;
    $scope.currentVacancy = vacancy;

  $scope.compareSkill = (skillId, skills) ->
    skills.some (el) ->
      el.id == skillId
]
