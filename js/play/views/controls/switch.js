// Generated by CoffeeScript 1.6.2
(function() {
  define(['jquery', 'underscore', 'backbone', 'play/views/controls/base'], function($, _, Backbone, BaseView) {
    var SwitchView;

    SwitchView = BaseView.extend({
      onclick: function() {
        if (this.$el.hasClass('control-active')) {
          return this.switchOn();
        } else {
          return this.switchOff();
        }
      },
      switchOn: function() {
        this.model.set('value', 0);
        this.$el.removeClass('control-active');
        return $('body').Burp({
          message: this.model.get('name-display') + ' turned off',
          debug: true
        });
      },
      switchOff: function() {
        this.model.set('value', 1);
        this.$el.addClass('control-active');
        return $('body').Burp({
          message: this.model.get('name-display') + ' turned on',
          debug: true
        });
      }
    });
    return SwitchView;
  });

}).call(this);