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

  $('.btn_like_comment').click ->
    $(@).attr('disabled', '')
    regex = $(@).attr("name").match(/^like_button_comment([0-9]+)_([0-9]+)/)
    idea_id = regex[1]
    comment_id = regex[2]
    url = '/ideas/' + idea_id + '/comments/' + comment_id + '/like.json'
    $.getJSON url, (json) ->
      if json.status
        button_name = 'like_button_comment' + json.idea_id + '_' + json.comment_id
        $("button[name='" + button_name + "']").each ->
          $(@).removeAttr('disabled')
          $(@).find('.like_count').text(json.count)
