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
    $(this).prev("ol").append('<li><input type="text" name="skill_attributes[]" value="" class="skill_with_autocomplete ui-autocomplete-input" data-autocompleteurl="/skills/autocomplete_skill_name"> <a class="remove_skill btn btn-default btn-xs" href="#">remove</a></li>')
    console.log('add')

  $('.skills_area').on 'click', '.remove_skill', ->
    $(this).parent("li").remove()
    console.log('remove')
