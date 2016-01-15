$(document).ready(function() {
  console.log("JS is active...");
  bindlisteners();
});

var bindlisteners = function(){
  console.log("binding listeners...");
  deleteButtonListener();
};

var deleteButtonListener = function(){
  $('.user_container').on('click', '#delete_button', function(event){
    event.preventDefault();
    console.log("Delete button click ...");
    var path = $(this).attr('href');
    console.log("this: " + path);
    deleteProfile(path);
  });
};

var deleteProfile = function(path){
  $.ajax({
    method: "DELETE",
    url: path,
    dataType: 'json'
  }).done(function(response){
    console.log("Removing item from page with an id of: " + response.id);
    $('#' + response.id).remove();
  });
};
