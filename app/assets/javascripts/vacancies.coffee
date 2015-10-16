# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.skills_area').on 'keydown.autocomplete', '.skill_with_autocomplete', (e) ->
    $(this).autocomplete
      minLength: 2
      source: (request, response) ->
        $.ajax
          url: $('.skill_with_autocomplete').data('autocompleteurl')
          dataType: "json"
          data:
            name: request.term
          success: (data) ->
            response(data)

  $('.add_skill').click ->
    $(this).prev("ol").append('<li><input type="text" name="skills[]" value="" class="skill_with_autocomplete ui-autocomplete-input" data-autocompleteurl="/skills/autocomplete_skill_name"> <a class="remove_skill btn btn-default btn-xs" href="#">remove</a></li>')
    console.log('add')

  $('.skills_area').on 'click', '.remove_skill', ->
    $(this).parent("li").remove()
    console.log('remove')
