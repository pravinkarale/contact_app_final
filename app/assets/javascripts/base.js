$(document).ready(function(){
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
