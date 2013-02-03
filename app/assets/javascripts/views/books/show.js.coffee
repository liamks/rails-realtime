app.views.books ?= {}

app.views.books.Show = Backbone.View.extend
  id : 'show-view'

  className : 'action-view'

  template : JST['templates/books/show']

  serialize : ->
    @model.toJSON()

  render : ->
    @$el.html @template(@serialize())
    @$el