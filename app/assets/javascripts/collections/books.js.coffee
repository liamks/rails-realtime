app.collections.Books = Backbone.Collection.extend
  model : app.models.Book
  url : '/books'

  initialize : () ->
    app.on 'books', @handle_change, @

  handle_change : (message) ->
    switch message.action
      when 'create'
        @add message.obj
      when 'update'
        model = @get message.id
        model.set message.obj
      when 'destroy'
        @remove message.obj

