document.addEventListener("turbolinks:load", function() {

  $("#cakes-show").click(function() {
    $("#cakes-selection").fadeToggle(600, "linear", function() {
      if ($(this).is(":visible")) {
        $("#pastry-selection").fadeOut();
        $("#cookies-selection").fadeOut();

        $("#cakes-show").text("Hide Selections");
        $("#pastry-show").text("Show Selections");
        $("#cookies-show").text("Show Selections");

        if (isBreakpoint("xs")) {
          $("#cakes-selection")[0].scrollIntoView(true);
        }

          $(".cake-name").textfill({
            maxFontPixels: 15
          });
      } else {
        $("#cakes-show").text("Show Selections");
      }
    });
  });
  $("#pastry-show").click(function() {
    $("#pastry-selection").fadeToggle(600, "linear", function() {
      if ($(this).is(":visible")) {
        $("#cakes-selection").fadeOut();
        $("#cookies-selection").fadeOut();

        $("#pastry-show").text("Hide Selections");
        $("#cakes-show").text("Show Selections");
        $("#cookies-show").text("show Selections");

        if (isBreakpoint("xs")) {
          $("#pastry-selection")[0].scrollIntoView(true);
        }

        $(".pastry-name").textfill({
          maxFontPixels: 15
        });
      } else {
        $("#pastry-show").text("Show Selections");
      }
    });
  });
  $("#cookies-show").click(function() {
    $("#cookies-selection").fadeToggle(600, "linear", function() {
      if ($(this).is(":visible")) {
        $("#cakes-selection").fadeOut();
        $("#pastry-selection").fadeOut();

        $("#cookies-show").text("Hide Selections");
        $("#cakes-show").text("Show Selections");
        $("#pastry-show").text("Show Selections");

        if (isBreakpoint("xs")) {
          $("#cookies-selection")[0].scrollIntoView(true);
        }

        $(".cookie-name").textfill({
          maxFontPixels: 15
        });
      } else {
        $("#cookies-show").text("Show Selections");
      }
    });
  });




  $("#cake-modal").on('show.bs.modal', function (event) {
    var source = $(event.relatedTarget);

    var modal = $(this);
    modal.find(".modal-title").text(source.data("title"));
    modal.find(".modal-description").text(source.data("description"));
    var imgSrc = source.find(".cake-pic").children("img").attr("src");
    modal.find(".modal-image").empty().append($("<img />", { 'src': imgSrc }));
  });

  $("#pastry-modal").on('show.bs.modal', function (event) {
    var source = $(event.relatedTarget);

    var modal = $(this);
    modal.find(".modal-title").text(source.data("title"));
    modal.find(".modal-description").text(source.data("description"));
    var imgSrc = source.find(".pastry-pic").children("img").attr("src");
    modal.find(".modal-image").empty().append($("<img />", { 'src': imgSrc }));
  });

  $("#cookie-modal").on('show.bs.modal', function (event) {
    var source = $(event.relatedTarget);

    var modal = $(this);
    modal.find(".modal-title").text(source.data("title"));
    modal.find(".modal-description").text(source.data("description"));
    var imgSrc = source.find(".cookie-pic").children("img").attr("src");
    modal.find(".modal-image").empty().append($("<img />", { 'src': imgSrc }));
  });

});

