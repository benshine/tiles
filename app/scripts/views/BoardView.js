// BoardView

define(['backbone', 'jst'], function (Backbone, JST) {
  'use strict';

  return Backbone.View.extend({

    template: JST['app/scripts/templates/BoardView.ejs'],

    tagName: 'div',

    id: '',

    className: '',

    events: {
      'click .tile': 'handleTileClick',
      'click .reset': 'handleResetClick',
      'click .randomize': 'handleRandomizeClick'
    },

    initialize: function () {
      this.listenTo(this.model, 'change', this.render);
    },

    render: function () {
      // First build the containing structure
      this.$el.html(this.template(this.model.toJSON()));
      var $tiles = this.$('.tiles-grid');

      // Now construct tiles
      var gridWidth = this.model.width;
      var gridHeight = this.model.height;
      var tileModel;

      for (var row = 0; row < gridHeight; row++) {
        var $row = $('<div>').addClass('row');
        for (var col=0; col < gridWidth; col++) {
          tileModel = this.model.tileAt(row, col);
          var $tileWrapper = $('<div>').addClass('tile-wrapper').addClass('col-xs-1');
          var $tile = $('<div>').addClass('tile').css('background-color', tileModel.get('color'));
          $tileWrapper.append($tile);
          $tile.attr('data-id', tileModel.get('id'));
          $row.append($tileWrapper);
        }

        $tiles.append($row);
      }
    },

    handleTileClick: function (event) {
      var target = $(event.target);
      var tileId = target.attr('data-id');
      this.model.at(tileId).toggleColor();
    },

    handleResetClick: function () {
      this.model.resetToDefaults();
    },

    handleRandomizeClick: function () {
      this.model.randomizeAll();
    }
  });
});
