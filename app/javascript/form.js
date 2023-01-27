/* global $*/
$(document).on('turbolinks:load', function(){
  $(".input-text").on("input", function() {
    let countNum = String($(this).val().length);
    $(".counter").text(countNum + "文字");
    if (countNum > 200) {
      $(".counter").css("color","red");
      $(".counter").text("200文字以内で記入してください");
    } else {
      $(".counter").css("color","black");
    }
  });
});

$(document).on('turbolinks:load', function(){
  $(".title-text").on("input", function() {
    let countNum = String($(this).val().length);
    $(".title-counter").text(countNum + "文字");
    if (countNum > 50) {
      $(".title-counter").css("color","red");
      $(".title-counter").text("50文字以内で記入してください");
    } else {
      $(".title-counter").css("color","black");
    }
  });
});

$(document).on('turbolinks:load', function(){
  $(".summary-text").on("input", function() {
    let countNum = String($(this).val().length);
    $(".summary-counter").text(countNum + "文字");
    if (countNum > 100) {
      $(".summary-counter").css("color","red");
      $(".summary-counter").text("100文字以内で記入してください");
    } else {
      $(".summary-counter").css("color","black");
    }
  });
});

$(document).on('turbolinks:load', function(){
  $(".story-text").on("input", function() {
    let countNum = String($(this).val().length);
    $(".story-counter").text(countNum + "文字");
    if (countNum > 2000) {
      $(".story-counter").css("color","red");
      $(".story-counter").text("2000文字以内で記入してください");
    } else {
      $(".story-counter").css("color","black");
    }
  });
});

$(document).on('turbolinks:load', function(){
  $("#suggestion-text").on("input", function() {
    let countNum = String($(this).val().length);
    $("#suggestion-counter").text(countNum + "文字");
    if (countNum > 1200) {
      $("#suggestion-counter").css("color","red");
      $("#suggestion-counter").text("1200文字以内で記入してください");
    } else {
      $("#suggestion-counter").css("color","black");
    }
  });
});