$(document).ready(function () {

  // Return a helper with preserved width of cells
  var fixHelper = function(e, ui) {
      ui.children().each(function() {
          $(this).width($(this).width());
      });
      return ui;
  };

  // Reorder variable groups
  var thisItem = null;
  var XID = EE.XID;
  $( "#sort_table" ).sortable({
    items: ".sort",
    handle: 'td.move',
    helper: fixHelper,
    update: function(event, ui) {
      thisItem = ui.item;
      var ids = [];
      $("tr.sort").each(function (i) {
        var div_id = $(this).attr('data-id');
        ids[i] = div_id;
      });

      $.ajax({
        type: "POST",
        url: EE.BASE+"&C=addons_modules&M=show_module_cp&module=republic_variables&method=" + $("#sort_table").attr('data-action'),
        data: {'XID': XID, 'ids': ids},
        dataType: 'json',
        success: function (response) {
          XID = response.XID;

          $("#sort_table tbody tr").removeClass('odd').removeClass('even');
          $("#sort_table tbody tr:nth-child(2n+1)").addClass('even');
          $("#sort_table tbody tr:nth-child(2n)").addClass('odd');

          thisItem.find('td').animate({'backgroundColor' : '#F7FFCD'}, 150);
          thisItem.find('td').animate({'backgroundColor' : 'transparent'}, 150, function(){
              thisItem.find('td').attr('style', '');
          });
        }
      });

    },
    //placeholder: "language-placeholder"
    placeholder: {
      element: function(currentItem) {
        var tdCount = $("#sort_table thead th").size();
        return $("<tr class='placeholder'><td colspan='" + tdCount + "'></td></tr>")[0];
      },
      update: function(container, p) {
        return;
      }

    }
  });
});
