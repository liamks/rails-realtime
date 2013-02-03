app.models.Book = Backbone.Model.extend
  urlRoot : '/books'
  defaults :
    title : ''
    num_pages : 0