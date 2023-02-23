import consumer from "./consumer"



// $(document).on('turbolinks:load', function () {

//     const chats = $('#chats')

//     // ルームIDを#chats内のdata-room-idから取得し、
//     // chats_channel.rbでも使えるようにする
//     const room = consumer.subscriptions.create(
//         {channel: "ChatsChannel", room_id: chats.data('room_id')}, {

//             connected() {
              
//             },

//             disconnected() {
              
//             },

//             received(data) {
//                 // 受け取ったデータを追加する
//                 //  dataには、chats_channel.rbから送られるパラメーター名に
//                 //  部分テンプレートに文字が埋め込まれているものが送られてくるので
//                 //  配列からmessageを抜き出し追加している。
//                 chats.append(data['message'])
//             },

//             speak: function (message) {
//                 return this.perform('speak', {message: message})
//             }
//         });

//     // 入力フォームの制御
//     $(document).ready(function () {
//         // 入力エリアのエレメント
//         const textElement = $('#message')
//         // 入力エリアのEnterKey検出
//         textElement.keypress(function (event) {
//             if (event.shiftKey && event.keyCode === 13) {
//                 // speakを呼び出し
//                 room.speak(textElement.val())
//                 // 入力エリアを空にする
//                 textElement.val('')
//                 event.preventDefault()
//             }
//         })
//     })
// })