app.views.books ?= {}

app.views.books.Form = Backbone.View.extend
  id : 'form-view'

  className : 'action-view'

  template : JST['templates/books/form']

  events :
    'click input[type=submit]' : 'save'

  initialize : ->
    @model = new app.models.Book()

  save : (evt) ->
    evt.preventDefault()
    @isNew = @model.isNew()
    @model.save @formValues(),
        success : () =>
          if @isNew
            app.collections.books.add @model

          @clear()
          app.navigate '/books/', true
        error :(error) =>
          console.log error

  clear : () ->
    @model = new app.models.Book()
    this.$el.find('input[type=text],input[type=number]').val('')

  serialize : ->
    @model.toJSON()

  formValues : ->
      title : this.$el.find('input[name=title]').val()
      num_pages : this.$el.find('input[name=num_pages]').val()

  render : ->
    @$el.html @template(@serialize())
    @$el