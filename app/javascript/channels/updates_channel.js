import consumer from "./consumer"

consumer.subscriptions.create("UpdatesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('ws connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('ws disconnected')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('ws data recieved')
  }
});
