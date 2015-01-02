'use strict';

requirejs.config({
  paths: {
    bower: '../bower_components',
    jquery: '../bower_components/jquery/dist/jquery',
    jst: '../generated/scripts/templates',
    backbone: '../bower_components/backbone/backbone',
    underscore: '../bower_components/underscore/underscore',
    tinycolor: '../bower_components/tinycolor/tinycolor'
  }
});

requirejs([
  'collections/TilesCollection',
  'views/BoardView'
], function (TilesCollection, BoardView) {
  window.Tiles = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {}
  };

  var gridWidth = 12;
  var gridHeight = 5;

  var tilesCollection = new TilesCollection({ width: gridWidth, height: gridHeight });
  tilesCollection.resetToDefaults();

  var boardView = new BoardView({ el: '#board', model: tilesCollection });
  boardView.render();

});
