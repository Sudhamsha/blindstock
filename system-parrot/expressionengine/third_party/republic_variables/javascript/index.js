/*jslint vars: true, undef: true, browser: true, plusplus: true */
/*global EE, jQuery, $, Modernizr, Placeholder, window, Lectric, helpers, methods */

$(document).ready(function () {

  $(".editAccordion > div").hide();
  $(".editAccordion > h3").css("cursor", "pointer").addClass("collapsed").parent().addClass("collapsed");

  $(".editAccordion").css("borderTop", $(".editAccordion").css("borderBottom"));

  // Expand/Collapse the variable groups
  $(".editAccordion h3").click(function () {
    if ($(this).hasClass("collapsed")) {
      $(this).siblings().slideDown("fast");
      $(this).removeClass("collapsed").parent().removeClass("collapsed");
    } else {
      $(this).siblings().slideUp("fast");
      $(this).addClass("collapsed").parent().addClass("collapsed");
    }
  });

  $("#toggle_all").toggle(function () {
    $(".editAccordion h3").removeClass("collapsed").parent().removeClass("collapsed");
    $(".editAccordion > div").show();
  }, function () {
    $(".editAccordion h3").addClass("collapsed").parent().addClass("collapsed");
    $(".editAccordion > div").hide();
  });


  $(".editAccordion.open h3").each(function () {
    $(this).siblings().show();
    $(this).removeClass("collapsed").parent().removeClass("collapsed");
  });

  // Show form field for variable
  var variableCurrentValue = "";
  $('td.variable-edit-value').click(function (e) {

    var clicked = $(e.target);

    if (clicked.hasClass('cancel-edit-mode')) {
      var variableTd = $(this).closest('td');
      variableTd.find('form').hide();
      variableTd.find('.variable-value').show();
      variableTd.removeClass('isExpanded');


      variableTd.find('textarea').val(variableCurrentValue);
      variableCurrentValue = "";
      e.preventDefault();

    } else {
      var variableTd = $(this);
      if (variableTd.find('form').is(':hidden')) {
        variableTd.find('textarea').attr('style', 'min-height: 55px');
        variableTd.find('form').show();
        variableTd.find('.variable-value').hide();
        variableTd.find('textarea').focus();

        variableCurrentValue = variableTd.find('textarea').val();

        if ($('td.variable-edit-value.isExpanded').length > 0) {
          if ($("#save_on_page_click").length > 0) {
            updateVariable($('td.variable-edit-value.isExpanded').find('form'));
          }
          $('td.variable-edit-value.isExpanded form').hide();
          $('td.variable-edit-value.isExpanded .variable-value').show();
          $('td.variable-edit-value.isExpanded').removeClass('isExpanded');
        }
        variableTd.addClass('isExpanded');
      }
    }
  });

  function updateVariable(formElement) {
    var textareaData = formElement.find('textarea').val(),
      variableId   = formElement.find('.variable_id').val(),
      formData     = formElement.serialize(),
      variableTd   = formElement.closest('td');

      //variableTd.find('.value-wrapper').addClass('loader');
    $.ajax({
      type: "POST",
      url: EE.BASE + "&C=addons_modules&M=show_module_cp&module=republic_variables&method=update_variable&variable_id=" + variableId,
      data: formData,
      success: function () {
        var defaultBackgroundColor = variableTd.css('backgroundColor');
        variableTd.animate({backgroundColor: "#e6f3d3"}, 250).animate({backgroundColor: defaultBackgroundColor}, 250);
      }
    });

    variableTd.find('form').hide();
    variableTd.find('.variable-value').text(textareaData).html();
    variableTd.find('.variable-value').show();
    $('td.variable-edit-value.isExpanded').removeClass('isExpanded');

    // show/hide the fixed bottom for columns where height > maxheight
    variableTd.closest('tr').find('.variable-value').each(function () {
      var fixedBottom = $(this).parent().find('.fixed-bottom');
      if ($(this).css('height') !== $(this).css('max-height')) {
        fixedBottom.hide();
      } else {
        fixedBottom.show();
      }
    });

    return false;
  }

  // Submit variable changes inline using Ajax
  $('form.variable-edit').submit(function () {
    updateVariable($(this));
    return false;
  });

  $("#mainContent").click(function (e) {

    if ($("#save_on_page_click").length === 0) {
      return;
    }

    var clicked = $(e.target);

    if (clicked.is('a')) {
      return;
    }

    if (clicked.hasClass('variable-edit-value') || clicked.closest('td').hasClass('variable-edit-value')) {
      return;
    }

    if ($('td.variable-edit-value.isExpanded').length > 0) {
      updateVariable($('td.variable-edit-value.isExpanded').find('form'));
    }
  });

  // Add custom classes to table columns
  $("td .variable-value").each(function() {

    // Add wrapper and fixed bottom
    $(this).wrap('<div class="value-wrapper"></div>');
    var fixedBottom = $('<div class="fixed-bottom"></div>');
    $(this).parent().append(fixedBottom);

    // Get column background color
    var backgroundColor    = $(this).closest('td').css('backgroundColor').replace('rgb', 'rgba');
    var backgroundColorMax = backgroundColor.replace(')', ', 1)');
    var backgroundColorMin = backgroundColor.replace(')', ', 0)');

    var styles = [];

    // Add styles on the fixed bottom for the different browsers using columns background color
    styles[0] = "background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);";
    styles[1] = "background: -moz-linear-gradient(top,  " + backgroundColorMin + " 0%, " + backgroundColorMax + " 100%); /* FF3.6+ */";
    styles[2] = "background: -webkit-gradient(linear, left top, left bottom, color-stop(0%," + backgroundColorMin + "), color-stop(100%," + backgroundColorMax + ")); /* Chrome,Safari4+ */";
    styles[3] = "background: -webkit-linear-gradient(top,  " + backgroundColorMin + " 0%," + backgroundColorMax + " 100%); /* Chrome10+,Safari5.1+ */";
    styles[4] = "background: -o-linear-gradient(top,  " + backgroundColorMin + " 0%," + backgroundColorMax + " 100%); /* Opera 11.10+ */";
    styles[5] = "background: -ms-linear-gradient(top,  " + backgroundColorMin + " 0%," + backgroundColorMax + " 100%); /* IE10+ */";
    styles[6] = "background: linear-gradient(to bottom,  " + backgroundColorMin + " 0%," + backgroundColorMax + " 100%); /* W3C */";

    fixedBottom.attr('style', styles.join(""));

    if ($(this).css('height') !== $(this).css('max-height')) {
      fixedBottom.hide();
    } else {
      fixedBottom.show();
    }
  });

});
