app.views.books ?= {}

app.views.books.Index = Backbone.View.extend
  id : 'index-view'

  className : 'action-view'

  template : JST['templates/books/index']

  events : 
    'click a[data-method=delete]' : 'destroy'
  
  initialize : ->
    @collection.on 'reset', @.render, @
    @collection.on 'change add remove', @.render, @

  destroy : (evt) ->
    evt.preventDefault()
    $a = $(evt.currentTarget)
    id = $a.attr('data-id')
    model = @collection.get id
    model.destroy()
    @collection.remove model


  serialize : ->
    books : @collection

  render : ->
    @$el.html @template(@serialize())
    @$el