$ ->
  $('.btn_like_idea').click ->
    $(@).attr('disabled', '')
    idea_id = $(@).attr("name").match(/^like_button_idea([0-9]+)/)[1]
    url = '/ideas/' + idea_id + '/like.json'
    $.getJSON url, (json) ->
      if json.status
        button_name = 'like_button_idea' + json.likable_id
        $("button[name='" + button_name + "']").each ->
          $(@).removeAttr('disabled')
          $(@).find('.like_count').text(json.count)
      else
       alert("failed:" + json.status)
