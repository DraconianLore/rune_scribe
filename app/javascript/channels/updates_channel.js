import consumer from "./consumer"

consumer.subscriptions.create("UpdatesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Live Updates Connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Live Updates Disconnected')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('Updating Data...')
  },

  char_level_up(char) {
    // level up char
    this.perform("char_level_up", char || null)
  },

  new_structure(structure) {
    this.perform("new_structure", structure)
  }
  
});
