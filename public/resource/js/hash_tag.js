$('#tokenfield').tokenfield({
  beautify: true
});
    
$('#tokenfield').on('tokenfield:createdtoken', function (e) {
  
  var labels =  $(".token-label").map(function() {
                  return $(this).text();
                }).get();
  
  var hash_tags = labels.join(', ');
  updatedByHashTag(1,hash_tags);
});

$('#tokenfield').on('tokenfield:removedtoken', function (e) {
  
  var labels =  $(".token-label").map(function() {
                  return $(this).text();
                }).get();
  
  var hash_tags = labels.join(', ');
  updatedByHashTag(1,hash_tags);
});