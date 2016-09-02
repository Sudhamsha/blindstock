$(document).ready(function () {
  
  // Show/Hide the move-icon
  $("#variables h3").mouseover(function (){
    $(this).children('.move').show();
  }).mouseout(function (){
    $(this).children('.move').hide();
  });
  
  // Reorder variable groups
  $( "#variables" ).sortable({
    items: ".editAccordion.sort",
    handle: 'h3 .move',
    update: function(event, ui) { 
      var str = "";
      $(".editAccordion.sort").each(function () {
        var div_id = $(this).attr('id');
        div_id = div_id.replace('id_', '');
        str = str + div_id + "-";
      });
      $.ajax({
        type: "POST",
        url: EE.BASE+"&C=addons_modules&M=show_module_cp&module=republic_variables&method=reorder_groups&ids="+str,
        success: function () {

        }
      });
    },
    placeholder: "variables-placeholder"
  });
});