// Generated by CoffeeScript 1.6.2
(function() {
  define(['jquery', 'underscore', 'backbone', 'build/views/mainView', 'play/models/controllerModel', 'play/views/controllerView'], function($, _, Backbone, MainView, ControllerModel, ControllerView) {
    var AppRouter, initialize;

    AppRouter = Backbone.Router.extend({
      routes: {
        '': 'landingRoute',
        'controller': 'controllerRoute',
        '*actions': 'defaultAction'
      }
    });
    initialize = function() {
      var app_router;

      app_router = new AppRouter;
      app_router.on('route:landingRoute', function() {
        console.log('landingRoute!');
        return window.app.views.main = new MainView;
      });
      app_router.on('route:controllerRoute', function() {
        console.log('controller route!');
        window.app.models.controller = new ControllerModel;
        return window.app.views.controller = new ControllerView({
          model: window.app.models.controller
        });
      });
      app_router.on('route:defaultAction', function(actions) {
        return console.log('No route: ' + actions);
      });
      return Backbone.history.start();
    };
    return {
      initialize: initialize
    };
  });

}).call(this);
