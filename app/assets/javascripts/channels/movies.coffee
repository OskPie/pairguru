jQuery(document).on 'turbolink:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "MoviesChannel"
      movie_id: comments.data('movie-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      comments.append data['comment']
    send_comment: (comment, movie_id) ->
      @perform 'send_comment', comment: comment, movie_id: movie_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textare = $this.find('#comment_content')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_comment textarea.val(),
      comments.data('movie-id')
      textarea.val('')
    e.preventDefault()
    return false
