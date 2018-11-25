$(document).on('turbolinks:load', function(){
  function buildHTML(message){

    var imageUrl = message.image ? `<img class="lower-message__image" src="${message.image}">` : ''
    console.log(imageUrl);
    var text = message.text ? `${message.text}` : ''

    console.log(text);
    var html = `<div class ="message-box", data-id="${message.id}"
                  <div class ="chat-main__body__message-name">${message.user_name}
                  </div>
                  <div class ="chat-main__body__message-time">${message.created_at}
                  </div>
                  <div class="chat-main__body__message-body">
                    <p class="lower-message__content">
                      ${text}
                    </p>
                  </div>
                      ${imageUrl}
                  </div>
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
        console.log(message)
        var html = buildHTML(message);
        $('.chat-main__body').append(html)
        $('#message_text').val('')
        $('.chat-main__body').animate({
          scrollTop: $('.chat-main__body')[0].scrollHeight},
         'slow', 'swing');
        $(".submit").prop('disabled', false)
          return false;
      })
      .fail(function(){
        alert('error');
      })
    })
  })



// $(function(){
    setInterval(updateMessage, 5000);
  // })




      function updateMessage(){
      if(location.pathname.match(/\/groups\/\d+\/messages/)) {

      var message_id = $('.message-box').last().data('id');
                          console.log(message_id)
        $.ajax({
          url: location.href,
          type: 'GET',
          data: { id: message_id },
          dataType: 'json'
       })

        .done(function(data){
           console.log(data)
          var insertHTML = "";
            data.forEach(function(message){
            insertHTML += buildHTML(message);
            $('.chat-main__body').append(insertHTML);
            });
            var mainBarContent = $('.chat-main__body')
            mainBarContent.animate({scrollTop: $('.chat-main__body')[0].scrollHeight},'slow', 'swing');
        })

        .fail(function(){
          alert('自動更新に失敗しました');
        })
      }
      }
})

