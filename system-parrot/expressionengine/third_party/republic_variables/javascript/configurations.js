$(document).ready(function() {
  $("#template_group_name").keyup(function () {
    $("#template_group_name_span").html($("#template_group_name").val());
  });
});
