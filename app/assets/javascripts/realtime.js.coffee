window.app.realtime =
  connect : () ->
    window.app.socket = io.connect('http://0.0.0.0:5001');

    window.app.socket.on 'rt-change', (message) ->
      window.app.trigger 'books', message




