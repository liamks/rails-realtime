app.routers.Books = Backbone.Router.extend
  initialize : ->
    @books = new app.collections.Books window.books
    @indexView = new app.views.books.Index
      collection : @books

    @showView = new app.views.books.Show
      model : @books.at 0

    @formView = new app.views.books.Form()

    $('body').append @indexView.render()
    $('body').append @showView.render()
    $('body').append @formView.render()

  routes :
    "books/" : "index"
    "books/new" : "new"
    "books/:id" : "show"
    "books/:id/edit" : "edit"

  index : () ->
    $('.action-view').hide()
    @indexView.$el.show()

  show : (id) ->
    $('.action-view').hide()
    model = @books.get id
    @showView.model = model
    @showView.render()
    @showView.$el.show()

  edit : (id) ->
    $('.action-view').hide()
    @formView.model = @books.get id
    @formView.render()
    @formView.$el.show()      

  new : () ->
    $('.action-view').hide()
    @formView.clear()
    @formView.$el.show()     