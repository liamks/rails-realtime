$ () ->
  start = () ->
    app.realtime.connect();
    booksRouter = new app.routers.Books();
    Backbone.history.start({pushState: true});

  start();