$(document).ready(function() {
  console.log("JS is active...");
  bindlisteners();
});

var bindlisteners = function(){
  console.log("binding listeners...");
  deleteButtonListener();
  qrButtonListener();
};


// Listeners
var deleteButtonListener = function(){
  $('.user_container').on('click', '#delete_button', function(event){
    event.preventDefault();
    console.log("Delete button click ...");
    var path = $(this).attr('href');
    console.log("this: " + path);
    deleteProfile(path);
  });
};

var qrButtonListener = function(){
  $('.user_container').on('click', '#qr_button', function(event){
    event.preventDefault();
    console.log("QR button click...");
    var path = $(this).attr('href');
    insertQR(path);
  });
};

// Methods
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

var insertQR = function(path){
  $.ajax({
    method: "GET",
    url: path,
    dataType: 'json'
  }).done(function(response){
    console.log("Returned from ajax with picture for div# :" + response.id + " :: " + response.img);
    $('#' + response.id).append('<img src="data:image/png;base64,' + response.img+ '" alt="Red dot" />');
  });
};
