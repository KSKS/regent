var fetchMenus = function(cb) {

  var clientId = "c3sbrpbtkbs5gverurfkxpemc";
  var sig = "IjeNxhBZLU0ay4A9YFnetnLf-ys";

  $.ajax("/redmond_menu", {

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
      $("<div />", { "class": "sub-menu-title" }).text(title),
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
  );
};
