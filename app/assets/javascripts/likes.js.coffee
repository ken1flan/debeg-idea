$ ->
  $('.btn_like_idea').click ->
    $(@).attr('disabled', '')
    likable_id = $(@).attr("name").match(/^like_button_idea([0-9]+)/)[1]
    url = '/likes/ideas/' + likable_id + '.json'
    $.getJSON url, (json) ->
      if json.status
        button_name = 'like_button_idea' + json.likable_id
        $("button[name='" + button_name + "']").each ->
          $(@).removeAttr('disabled')
          $(@).find('.like_count').text(json.count)

  $('.btn_like_comment').click ->
    $(@).attr('disabled', '')
    likable_id = $(@).attr("name").match(/^like_button_comment([0-9]+)/)[1]
    url = '/likes/comments/' + likable_id + '.json'
    $.getJSON url, (json) ->
      if json.status
        button_name = 'like_button_comment' + json.likable_id
        $("button[name='" + button_name + "']").each ->
          $(@).removeAttr('disabled')
          $(@).find('.like_count').text(json.count)
