$(document).ready(function(){
  // render form in selected language on language dropdown changes
  $('select#language_select').select2({ width: '7%', minimumResultsForSearch: -1
  })
  $("select#language_select").on('change', function(){
    var lang = $(this).val()
    languageChangeAjaxCall(lang)
  })
  // submit form
  $("form#new_user").on('submit', function(e){
    e.preventDefault();
    sendMessage()
  })
})

function sendMessage(){
  // post serialize form when form gets submitted
  $.post("/api/users", $('#new_user').serialize(), function(data) {
    if (data['status'] == 'failure'){
      $('span.response_message').removeClass('success')
      $('span.response_message').not(".failure").addClass('failure')
      $('span.response_message').text(data['message'])
    }
    else{
      $('span.response_message').text('');
      $('span.response_message').removeClass('failure')
      $('span.response_message').not(".success").addClass('success')
      $('span.response_message').text(data['message'])
      $("#user_first_name, #user_last_name, #user_email, #user_phone, #user_message").val("");
    }
  });
}

function languageChangeAjaxCall(lang){
  // ajax call to render form in selected language
  $.ajax({
    url: "/",
    data: {locale: lang}
  })
}
