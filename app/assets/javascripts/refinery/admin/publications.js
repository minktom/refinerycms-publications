//= require chosen-jquery

$(document).ready(function(){
  $("#item_author_ids").chosen({
    no_results_text: "No results matched",
    allow_single_deselect: true
  });
});
