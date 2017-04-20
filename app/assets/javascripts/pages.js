var fetchMenus = function(location, cb) {
  var path;

  if (location === "redmond") {
    path = "/redmond_menu";
  } else {
    path = "/cap_menu";
  }

  $.ajax(path, {

    accepts: "application/json",
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("Error getting menu: " + errorThrown);
    },
    success: function(data, textStatus, errorThrown) {
      //var parsed = JSON.parse(data);

      cb(null, $.map(data, function(value, index) {
        return {
          title: value.list.title,
          entries: $.map(value.items, function(e, i) {
            return {
              name: e.title,
              prices: $.map(e.prices, function(p, pi) {
                return { type: p.title, value: p.price };
              })
            };
          })
        };
      }));
    }
  });
};


/*

entree {
  name: string
  prices: [
    type: string
    value: number
  ]
}
*/

var createMenu = function(title, entries) {
  return $("<div />", { "class": "col-sm-6 col-md-4"} ).append(
    $("<div />", { "class": "sub-menu" }).append(
      // $("<div />", { "class": "sub-menu-title" }).html(title + ' <span class="fa-stack pull-right"><i class="fa fa-circle-o fa-stack-1x"></i><i class="fa fa-chevron-down"></i></span>'),
      $("<div />", { "class": "sub-menu-title" }).html(' <i class="fa fa-chevron-up fa-border pull-right"></i>' + title),
      $("<div />", { "class": "sub-menu-entrees opened" }).append(
        $.map(entries, function(e, index) {
          return $("<div />", { "class": "sub-menu-entree" }).append(

            $("<div />", { "class": "sub-menu-entree-name" }).text(e.name),

            $("<div />", { "class": "sub-menu-entree-price" }).append(
              $("<ul />").append(
                $.map(e.prices, function(price, i) {
                  return $("<li />").append(
                    $("<span />", { "class": "price-type" }).text(price.type),
                    $("<span />", { "class": "price-value" }).text(price.value));
                })
              )
            )
          );
        })

      )
    )
  );
};

var openMenu = function(element) {
  element.children(".sub-menu-title").children(".fa").removeClass("fa-chevron-down");
  element.children(".sub-menu-title").children(".fa").addClass("fa-chevron-up");

  element.children(".sub-menu-entrees").removeClass("closed");
  element.children(".sub-menu-entrees").addClass("opened");
};

var closeMenu = function(element) {
  element.children(".sub-menu-title").children(".fa").removeClass("fa-chevron-up");
  element.children(".sub-menu-title").children(".fa").addClass("fa-chevron-down");

  element.children(".sub-menu-entrees").removeClass("opened");
  element.children(".sub-menu-entrees").addClass("closed");
};

var isMenuOpened = function(element) {
  return element.children(".sub-menu-entrees").hasClass("opened");
};

document.addEventListener("turbolinks:load", function() {
  $("#menu-content").on("click", ".sub-menu-title", function(event) {
    var subMenu = $(this).parent();
    if (isMenuOpened(subMenu)) {
      closeMenu(subMenu);
    } else {
      openMenu(subMenu);
    }
  });
});
