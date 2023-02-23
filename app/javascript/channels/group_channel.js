// import consumer from "./consumer"

// App.room = App.cable.subscriptions.create("GroupChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//     $('#add-message').append("<div>" + data["group_message"] + "</div>");
//   },

//   speak: (messagebody) 
//     // channelのspeakアクションにパラメータを渡す
//     @perform 'speak', {messagebody: messagebody, user: user, group: group} 
  
//   // チャットを送る
//   $(document).on('turbolinks:load', function () {
//     $(document).on 'keypress', '[data-behavior~=group_speaker]', (event) {
//     // return(Enter)が押された時
//     if event.keyCode is 13
//       //channel speakへ、event.target.valueを引数に
//       App.room.speak event.target.value, $('[data-user]').attr('data-user'), $('[data-group]').attr('data-group')
//       //inputの中身を空に
//       event.target.value = ''
//       alert()
//       event.preventDefault()
//     };
//   };
  
// });
