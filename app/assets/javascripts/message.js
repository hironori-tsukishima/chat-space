$(document).on('turbolinks:load', function(){
  function buildHTML(message){
    var html = `<div class ="chat-main__body__message-name">${message.user_name}
                </div>
                <div class ="chat-main__body__message-time">${message.created_at}
                </div>
                <div class ="chat-main__body__message-body">${message.text}
                </div>`
    return html;
  }


  $(function(){
    $(".message_js").on("submit", function(e){
      e.preventDefault();
      var formData = new FormData(this);
      console.log(formData)
      var url =$(this).attr("action")

      $.ajax({
        type: "post",
        data: formData,
        url: url,
        dataType: "json",
        processData: false,
        contentType: false
      })
      .done(function(message){
        console.log(message.user_name)
        var html = buildHTML(message);
        $('.chat-main__body').append(html)
        $('#message_text').val('')
        $('.chat-main__body').animate({
          scrollTop: $('.chat-main__body')[0].scrollHeight},
         'slow', 'swing');
          return false;
      })
      .fail(function(){
        alert('error');
      })
    })
  })
})
