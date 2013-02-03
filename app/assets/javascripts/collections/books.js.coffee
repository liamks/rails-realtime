app.collections.Books = Backbone.Collection.extend
  model : app.models.Book
  url : '/books'