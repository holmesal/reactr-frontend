// Generated by CoffeeScript 1.6.2
(function() {
  define(['jquery', 'underscore', 'backbone', 'handlebars', 'hammer', 'text!templates/control.html'], function($, _, Backbone, handlebars, hammer, ControlTemplate) {
    var BaseView;

    BaseView = Backbone.View.extend({
      className: 'control',
      template: handlebars.compile(ControlTemplate),
      log: function(words) {
        return console.log(words);
      },
      initialize: function() {
        var hammertime,
          _this = this;

        console.log(hammer);
        return hammertime = hammer(this.el).on('tap', function(e) {
          if (_this.onclick) {
            return _this.onclick();
          }
        });
      },
      setSize: function() {
        console.log(this.options.controldims);
        this.$el.css({
          width: this.options.controldims.width,
          height: this.options.controldims.height
        });
        this.$el.find('.control-icon').css({
          'font-size': this.options.controldims.icon,
          'margin-top': this.options.controldims.height / 2 - this.options.controldims.icon
        });
        return this.$el.find('.control-name').css({
          'font-size': this.options.controldims.text,
          'margin-top': this.options.controldims.width / 6
        });
      },
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        this.setSize();
        return this.$el;
      }
    });
    return BaseView;
  });

}).call(this);