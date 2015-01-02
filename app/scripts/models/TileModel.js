// TileModel

define(['backbone', 'tinycolor'], function (Backbone, tinycolor) {
  var WHITE = '#FFFFFF';

  return Backbone.Model.extend({

    url: '',

    initialize: function() {
    },

    defaults: {
      color: WHITE
    },

    validate: function(attrs, options) {
    },

    parse: function(response, options)  {
      return response;
    },

    toggleColor: function () {
      if (this.get('color') === WHITE) {
        this.randomizeColor();
      } else {
        this.set('color', WHITE);
      }
    },

    randomizeColor: function () {
      var randomColor = tinycolor.random();
      this.set('color', randomColor);
    }
  });

});
