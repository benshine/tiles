
// TilesCollection

define(['backbone', 'models/TileModel'], function (Backbone, TileModel) {

  return Backbone.Collection.extend({

    model: TileModel,

    initialize: function (options) {
      this.height = options.height || 3;
      this.width = options.width || 3;
    },

    resetToDefaults: function () {
      this.reset();
      var numTiles = this.height * this.width;
      for (var i = 0; i < numTiles; i++) {
        this.push(new TileModel({id: i}));
      }
      this.trigger('change');
    },

    tileAt: function (row, column) {
      if (row >= 0 && row < this.height && column >= 0 && column < this.width) {
        return this.at((row * this.width) + column);
      } else {
        throw new TypeError("invalid tile requested: " + row + ", " + column);
      }
    },

    randomizeAll: function () {
      this.forEach(function (tile) {
        tile.randomizeColor();
      });
    }
  });
});
