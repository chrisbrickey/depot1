App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    #code below receives the data (product catalog) on the client by subscribing to the channel and defining what to do with the data when it is received
    $(".store #main").html(data.html)
