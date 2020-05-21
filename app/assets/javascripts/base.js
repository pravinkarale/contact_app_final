$(document).ready(function(){
  // render form in selected language on language dropdown changes
  $("select#language_select").on('change', function(){
    var lang = $(this).val()
    languageChangeAjaxCall(lang)
  })
  // submit form
  $("form#new_contact").on('submit', function(e){
    e.preventDefault();
    sendMessage()
  })
})

function sendMessage(){
  // post serialize form when form gets submitted
  $.post("/api/contact_messages", $('#new_contact').serialize(), function(data) {
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
      $("#contact_message_first_name, #contact_message_last_name, #contact_message_email, #contact_message_phone, #contact_message_message").val("");
    }
  });
}

function languageChangeAjaxCall(lang){
  // ajax call to render form in selected language
  $.ajax({
    url: "/contact_messages/new",
    data: {locale: lang}
  })
}
