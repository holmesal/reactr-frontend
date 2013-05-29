// Generated by CoffeeScript 1.6.2
(function() {
  define(['jquery', 'underscore', 'backbone', 'play/views/controls/base', 'context'], function($, _, Backbone, BaseView, Context) {
    var Button;

    Button = BaseView.extend({
      onclick: function() {
        var _this = this;

        this.$el.addClass('control-active');
        setTimeout(function() {
          return _this.$el.removeClass('control-active');
        }, 200);
        return $('body').Burp({
          message: this.model.get('name-display') + ' clicked',
          debug: true
        });
      }
    });
    return Button;
  });

}).call(this);