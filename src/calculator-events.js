var GearSizeUI, GearSizeUIEvents, GearSizes, calculator, events, util;

util = require('util');

events = require('events');

calculator = new GearSize.Calculator;

GearSizes = {
  generateReferenceTable: function() {},
  loadControlValues: function() {},
  renderTable: function() {}
};

GearSizeUI(function() {
  this.loaded = false;
  this.gearSizes = {};
  return events.EventEmitter.call(this);
});

util.inherits(GearSizeUI, events.EventEmitter);

GearSizeUI = new GearSizeUI();

GearSizeUI.on('first-load')(function() {
  this.loaded = true;
  GearSizes.loadControlValues();
  this.gearSizes = GearSizes.generateReferenceTable;
  return GearSizes.renderTable(this.gearSizes);
});

Inheriting(from(EventEmitter));

GearSizeUIEvents = (typeof exports !== "undefined" && exports !== null) && exports || (this.GearSizeUIEvents = {});

GearSize.UIEvents = (function() {
  function UIEvents() {}

  UIEvents.prototype.renderGearSizes = renderGearSizes;

  UIEvents.prototype.renderGearSizeReferenceTable = renderGearSizeReferenceTable;

  return UIEvents;

})();
