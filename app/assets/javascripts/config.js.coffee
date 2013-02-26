window.app =
  models : {}
  collections : {}
  views : {}
  routers : {}
  navigate : new Backbone.Router().navigate

_.extend window.app, Backbone.Events

$.ajaxSetup
  headers : 
    'X-CSRF-Token' : $('meta[name=csrf-token]').attr('content')

$(document).on 'click', 'a:not([data-bypass])', (evt) ->
  href = $(@).attr 'href'
  protocol = @protocol + '//'

  if href.slice(protocol.length) != protocol
    evt.preventDefault();
    app.navigate href, true


