"use strict";

window.ActiveAdmin = {};
'use strict';

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i['return']) _i['return'](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError('Invalid attempt to destructure non-iterable instance'); } }; })();

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

(function (window, $) {
  var ActiveAdmin = (function () {
    function ActiveAdmin() {
      _classCallCheck(this, ActiveAdmin);
    }

    _createClass(ActiveAdmin, null, [{
      key: 'turbolinksVisit',
      value: function turbolinksVisit(params) {
        var path = [window.location.pathname, '?', this.toQueryString(params)].join('');
        Turbolinks.visit(path);
      }
    }, {
      key: 'queryString',
      value: function queryString() {
        return (window.location.search || '').replace(/^\?/, '');
      }
    }, {
      key: 'queryStringToParams',
      value: function queryStringToParams() {
        var decode = function decode(value) {
          return decodeURIComponent((value || '').replace(/\+/g, '%20'));
        };

        return this.queryString().split("&").map(function (pair) {
          return pair.split("=");
        }).map(function (_ref) {
          var _ref2 = _slicedToArray(_ref, 2);

          var key = _ref2[0];
          var value = _ref2[1];

          return { name: decode(key), value: decode(value) };
        });
      }
    }, {
      key: 'toQueryString',
      value: function toQueryString(params) {
        var encode = function encode(value) {
          return encodeURIComponent(value || '');
        };

        return params.map(function (_ref3) {
          var name = _ref3.name;
          var value = _ref3.value;
          return [encode(name), encode(value)];
        }).map(function (pair) {
          return pair.join('=');
        }).join('&');
      }
    }, {
      key: 'turbolinks',
      get: function get() {
        return typeof Turbolinks !== 'undefined' && Turbolinks.supported;
      }
    }]);

    return ActiveAdmin;
  })();

  window.activeadmin = ActiveAdmin;
})(window, jQuery);
'use strict';

var onDOMReady = function onDOMReady() {
  //
  // Use ActiveAdmin.modal_dialog to prompt user if
  // confirmation is required for current Batch Action
  //
  $('.batch_actions_selector li a').click(function (event) {
    var _this = this;

    var message = undefined;
    event.stopPropagation(); // prevent Rails UJS click event
    event.preventDefault();
    if (message = $(this).data('confirm')) {
      ActiveAdmin.modal_dialog(message, $(this).data('inputs'), function (inputs) {
        $(_this).trigger('confirm:complete', inputs);
      });
    } else {
      $(this).trigger('confirm:complete');
    }
  });

  $('.batch_actions_selector li a').on('confirm:complete', function (event, inputs) {
    var val = undefined;
    if (val = JSON.stringify(inputs)) {
      $('#batch_action_inputs').removeAttr('disabled').val(val);
    } else {
      $('#batch_action_inputs').attr('disabled', 'disabled');
    }

    $('#batch_action').val($(this).data('action'));
    $('#collection_selection').submit();
  });

  //
  // Add checkbox selection to resource tables and lists if batch actions are enabled
  //

  if ($(".batch_actions_selector").length && $(":checkbox.toggle_all").length) {

    if ($(".paginated_collection table.index_table").length) {
      $(".paginated_collection table.index_table").tableCheckboxToggler();
    } else {
      $(".paginated_collection").checkboxToggler();
    }

    $(document).on('change', '.paginated_collection :checkbox', function () {
      if ($(".paginated_collection :checkbox:checked").length) {
        $(".batch_actions_selector").each(function () {
          $(this).aaDropdownMenu("enable");
        });
      } else {
        $(".batch_actions_selector").each(function () {
          $(this).aaDropdownMenu("disable");
        });
      }
    });
  }
};

$(document).ready(onDOMReady).on('page:load turbolinks:load', onDOMReady);
'use strict';

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

ActiveAdmin.DropdownMenu = (function () {
  function DropdownMenu(options, element) {
    _classCallCheck(this, DropdownMenu);

    this.options = options;
    this.element = element;
    this.$element = $(this.element);

    var defaults = {
      fadeInDuration: 20,
      fadeOutDuration: 100,
      onClickActionItemCallback: null
    };

    this.options = $.extend(defaults, this.options);
    this.isOpen = false;

    this.$menuButton = this.$element.find('.dropdown_menu_button');
    this.$menuList = this.$element.find('.dropdown_menu_list_wrapper');

    this._buildMenuList();
    this._bind();
  }

  _createClass(DropdownMenu, [{
    key: 'open',
    value: function open() {
      this.isOpen = true;
      this.$menuList.fadeIn(this.options.fadeInDuration);

      this._position();
      return this;
    }
  }, {
    key: 'close',
    value: function close() {
      this.isOpen = false;
      this.$menuList.fadeOut(this.options.fadeOutDuration);
      return this;
    }
  }, {
    key: 'destroy',
    value: function destroy() {
      this.$element = null;
      return this;
    }
  }, {
    key: 'isDisabled',
    value: function isDisabled() {
      return this.$menuButton.hasClass('disabled');
    }
  }, {
    key: 'disable',
    value: function disable() {
      this.$menuButton.addClass('disabled');
    }
  }, {
    key: 'enable',
    value: function enable() {
      this.$menuButton.removeClass('disabled');
    }
  }, {
    key: 'option',
    value: function option(key, value) {
      if ($.isPlainObject(key)) {
        return this.options = $.extend(true, this.options, key);
      } else if (key != null) {
        return this.options[key];
      } else {
        return this.options[key] = value;
      }
    }
  }, {
    key: '_buildMenuList',
    value: function _buildMenuList() {
      this.$nipple = $('<div class="dropdown_menu_nipple"></div>');
      this.$menuList.prepend(this.$nipple);
      this.$menuList.hide();
    }
  }, {
    key: '_bind',
    value: function _bind() {
      var _this = this;

      $('body').click(function () {
        if (_this.isOpen) {
          _this.close();
        }
      });

      this.$menuButton.click(function () {
        if (!_this.isDisabled()) {
          if (_this.isOpen) {
            _this.close();
          } else {
            _this.open();
          }
        }
        return false;
      });
    }
  }, {
    key: '_position',
    value: function _position() {
      this.$menuList.css('top', this.$menuButton.position().top + this.$menuButton.outerHeight() + 10);

      var button_left = this.$menuButton.position().left;
      var button_center = this.$menuButton.outerWidth() / 2;
      var button_right = button_left + button_center * 2;
      var menu_center = this.$menuList.outerWidth() / 2;
      var nipple_center = this.$nipple.outerWidth() / 2;
      var window_right = $(window).width();

      var centered_menu_left = button_left + button_center - menu_center;
      var centered_menu_right = button_left + button_center + menu_center;

      if (centered_menu_left < 0) {
        // Left align with button
        this.$menuList.css('left', button_left);
        this.$nipple.css('left', button_center - nipple_center);
      } else if (centered_menu_right > window_right) {
        // Right align with button
        this.$menuList.css('right', window_right - button_right);
        this.$nipple.css('right', button_center - nipple_center);
      } else {
        // Center align under button
        this.$menuList.css('left', centered_menu_left);
        this.$nipple.css('left', menu_center - nipple_center);
      }
    }
  }]);

  return DropdownMenu;
})();

$.widget.bridge('aaDropdownMenu', ActiveAdmin.DropdownMenu);

var onDOMReady = function onDOMReady() {
  return $('.dropdown_menu').aaDropdownMenu();
};

$(document).ready(onDOMReady).on('page:load turbolinks:load', onDOMReady);
'use strict';

$(function () {
  // Provides a before-removal hook:
  // $ ->
  //   # This is a good place to tear down JS plugins to prevent memory leaks.
  //   $(document).on 'has_many_remove:before', '.has_many_container', (e, fieldset, container)->
  //     fieldset.find('.select2').select2 'destroy'
  //
  //   # If you need to do anything after removing the items you can use the
  //   has_many_remove:after hook
  //   $(document).on 'has_many_remove:after', '.has_many_container', (e, fieldset, container)->
  //     list_item_count = container.find('.has_many_fields').length
  //     alert("There are now #{list_item_count} items in the list")
  //
  $(document).on('click', 'a.button.has_many_remove', function (event) {
    event.preventDefault();
    var parent = $(this).closest('.has_many_container');
    var to_remove = $(this).closest('fieldset');
    recompute_positions(parent);

    parent.trigger('has_many_remove:before', [to_remove, parent]);
    to_remove.remove();
    return parent.trigger('has_many_remove:after', [to_remove, parent]);
  });

  // Provides before and after creation hooks:
  // $ ->
  //   # The before hook allows you to prevent the creation of new records.
  //   $(document).on 'has_many_add:before', '.has_many_container', (e, container)->
  //     if $(@).children('fieldset').length >= 3
  //       alert "you've reached the maximum number of items"
  //       e.preventDefault()
  //
  //   # The after hook is a good place to initialize JS plugins and the like.
  //   $(document).on 'has_many_add:after', '.has_many_container', (e, fieldset, container)->
  //     fieldset.find('select').chosen()
  //
  $(document).on('click', 'a.button.has_many_add', function (event) {
    var before_add = undefined;
    event.preventDefault();
    var parent = $(this).closest('.has_many_container');
    parent.trigger(before_add = $.Event('has_many_add:before'), [parent]);

    if (!before_add.isDefaultPrevented()) {
      var index = parent.data('has_many_index') || parent.children('fieldset').length - 1;
      parent.data({ has_many_index: ++index });

      var regex = new RegExp($(this).data('placeholder'), 'g');
      var html = $(this).data('html').replace(regex, index);

      var fieldset = $(html).insertBefore(this);
      recompute_positions(parent);
      return parent.trigger('has_many_add:after', [fieldset, parent]);
    }
  });

  $(document).on('change', '.has_many_container[data-sortable] :input[name$="[_destroy]"]', function () {
    recompute_positions($(this).closest('.has_many'));
  });

  init_sortable();
  $(document).on('has_many_add:after', '.has_many_container', init_sortable);
});

var init_sortable = function init_sortable() {
  var elems = $('.has_many_container[data-sortable]:not(.ui-sortable)');
  elems.sortable({
    items: '> fieldset',
    handle: '> ol > .handle',
    start: function start(ev, ui) {
      ui.item.css({ opacity: 0.3 });
    },
    stop: function stop(ev, ui) {
      ui.item.css({ opacity: 1.0 });
      recompute_positions($(this));
    }
  });
  elems.each(recompute_positions);
};

var recompute_positions = function recompute_positions(parent) {
  parent = parent instanceof jQuery ? parent : $(this);
  var input_name = parent.data('sortable');
  var position = parseInt(parent.data('sortable-start') || 0, 10);

  parent.children('fieldset').each(function () {
    // We ignore nested inputs, so when defining your has_many, be sure to keep
    // your sortable input at the root of the has_many block.
    var destroy_input = $(this).find("> ol > .input > :input[name$='[_destroy]']");
    var sortable_input = $(this).find('> ol > .input > :input[name$=\'[' + input_name + ']\']');

    if (sortable_input.length) {
      sortable_input.val(destroy_input.is(':checked') ? '' : position++);
    }
  });
};
'use strict';

ActiveAdmin.modal_dialog = function (message, inputs, callback) {
  var html = '<form id="dialog_confirm" title="' + message + '"><ul>';
  for (var _name in inputs) {
    var elem, opts, wrapper;
    var type = inputs[_name];
    if (/^(datepicker|checkbox|text|number)$/.test(type)) {
      wrapper = 'input';
    } else if (type === 'textarea') {
      wrapper = 'textarea';
    } else if ($.isArray(type)) {
      var _ref = ['select', 'option', type, ''];
      wrapper = _ref[0];
      elem = _ref[1];
      opts = _ref[2];
      type = _ref[3];
    } else {
      throw new Error('Unsupported input type: {' + _name + ': ' + type + '}');
    }

    var klass = type === 'datepicker' ? type : '';
    html += '<li>\n      <label>' + (_name.charAt(0).toUpperCase() + _name.slice(1)) + '</label>\n      <' + wrapper + ' name="' + _name + '" class="' + klass + '" type="' + type + '">' + (opts ? (function () {
      var result = [];

      opts.forEach(function (v) {
        var $elem = $('<' + elem + '/>');
        if ($.isArray(v)) {
          $elem.text(v[0]).val(v[1]);
        } else {
          $elem.text(v);
        }
        result.push($elem.wrap('<div>').parent().html());
      });

      return result;
    })().join('') : '') + ('</' + wrapper + '>') + "</li>";
    // unset any temporary variables
    var _ref2 = [];
    wrapper = _ref2[0];
    elem = _ref2[1];
    opts = _ref2[2];
    type = _ref2[3];
    klass = _ref2[4];
  }

  html += "</ul></form>";

  var form = $(html).appendTo('body');
  $('body').trigger('modal_dialog:before_open', [form]);

  form.dialog({
    modal: true,
    open: function open(event, ui) {
      $('body').trigger('modal_dialog:after_open', [form]);
    },
    dialogClass: 'active_admin_dialog',
    buttons: {
      OK: function OK() {
        callback($(this).serializeObject());
        $(this).dialog('close');
      },
      Cancel: function Cancel() {
        $(this).dialog('close').remove();
      }
    }
  });
};
'use strict';

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

(function ($, ActiveAdmin) {
  var PerPage = (function () {
    function PerPage(element) {
      _classCallCheck(this, PerPage);

      this.element = element;
    }

    _createClass(PerPage, [{
      key: 'update',
      value: function update() {
        var params = ActiveAdmin.queryStringToParams().filter(function (_ref) {
          var name = _ref.name;
          return name != 'per_page' || name != 'page';
        });

        params.push({ name: 'per_page', value: this.element.value });

        if (ActiveAdmin.turbolinks) {
          ActiveAdmin.turbolinksVisit(params);
        } else {
          window.location.search = ActiveAdmin.toQueryString(params);
        }
      }
    }], [{
      key: '_jQueryInterface',
      value: function _jQueryInterface(config) {
        return this.each(function () {
          var $this = $(this);
          var data = $this.data('perPage');

          if (!data) {
            data = new PerPage(this);
            $this.data('perPage', data);
          }

          if (config === 'update') {
            data[config]();
          }
        });
      }
    }]);

    return PerPage;
  })();

  ;

  $(document).on('change', '.pagination_per_page > select', function (event) {
    PerPage._jQueryInterface.call($(this), 'update');
  });

  $.fn['perPage'] = PerPage._jQueryInterface;
  $.fn['perPage'].Constructor = PerPage;
})(jQuery, window.activeadmin);
'use strict';

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

ActiveAdmin.CheckboxToggler = (function () {
  function CheckboxToggler(options, container) {
    _classCallCheck(this, CheckboxToggler);

    this.options = options;
    this.container = container;
    this._init();
    this._bind();
  }

  _createClass(CheckboxToggler, [{
    key: 'option',
    value: function option(key, value) {}
  }, {
    key: '_init',
    value: function _init() {
      if (!this.container) {
        throw new Error('Container element not found');
      } else {
        this.$container = $(this.container);
      }

      if (!this.$container.find('.toggle_all').length) {
        throw new Error('"toggle all" checkbox not found');
      } else {
        this.toggle_all_checkbox = this.$container.find('.toggle_all');
      }

      this.checkboxes = this.$container.find(':checkbox').not(this.toggle_all_checkbox);
    }
  }, {
    key: '_bind',
    value: function _bind() {
      var _this = this;

      this.checkboxes.change(function (event) {
        return _this._didChangeCheckbox(event.target);
      });
      this.toggle_all_checkbox.change(function () {
        return _this._didChangeToggleAllCheckbox();
      });
    }
  }, {
    key: '_didChangeCheckbox',
    value: function _didChangeCheckbox(checkbox) {
      var numChecked = this.checkboxes.filter(':checked').length;

      var allChecked = numChecked === this.checkboxes.length;
      var someChecked = numChecked > 0 && numChecked < this.checkboxes.length;

      this.toggle_all_checkbox.prop({ checked: allChecked, indeterminate: someChecked });
    }
  }, {
    key: '_didChangeToggleAllCheckbox',
    value: function _didChangeToggleAllCheckbox() {
      var setting = this.toggle_all_checkbox.prop('checked');
      this.checkboxes.prop({ checked: setting });
      return setting;
    }
  }]);

  return CheckboxToggler;
})();

$.widget.bridge('checkboxToggler', ActiveAdmin.CheckboxToggler);
'use strict';

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; _again = false; if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; desc = parent = undefined; continue _function; } } else if ('value' in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

function _inherits(subClass, superClass) { if (typeof superClass !== 'function' && superClass !== null) { throw new TypeError('Super expression must either be null or a function, not ' + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

ActiveAdmin.TableCheckboxToggler = (function (_ActiveAdmin$CheckboxToggler) {
  _inherits(TableCheckboxToggler, _ActiveAdmin$CheckboxToggler);

  function TableCheckboxToggler() {
    _classCallCheck(this, TableCheckboxToggler);

    _get(Object.getPrototypeOf(TableCheckboxToggler.prototype), 'constructor', this).apply(this, arguments);
  }

  _createClass(TableCheckboxToggler, [{
    key: '_bind',
    value: function _bind() {
      var _this = this;

      _get(Object.getPrototypeOf(TableCheckboxToggler.prototype), '_bind', this).apply(this, arguments);

      this.$container.find('tbody td').click(function (event) {
        if (event.target.type !== 'checkbox') {
          _this._didClickCell(event.target);
        }
      });
    }
  }, {
    key: '_didChangeCheckbox',
    value: function _didChangeCheckbox(checkbox) {
      _get(Object.getPrototypeOf(TableCheckboxToggler.prototype), '_didChangeCheckbox', this).apply(this, arguments);

      $(checkbox).parents('tr').toggleClass('selected', checkbox.checked);
    }
  }, {
    key: '_didChangeToggleAllCheckbox',
    value: function _didChangeToggleAllCheckbox() {
      this.$container.find('tbody tr').toggleClass('selected', _get(Object.getPrototypeOf(TableCheckboxToggler.prototype), '_didChangeToggleAllCheckbox', this).apply(this, arguments));
    }
  }, {
    key: '_didClickCell',
    value: function _didClickCell(cell) {
      $(cell).parent('tr').find(':checkbox').click();
    }
  }]);

  return TableCheckboxToggler;
})(ActiveAdmin.CheckboxToggler);

$.widget.bridge('tableCheckboxToggler', ActiveAdmin.TableCheckboxToggler);
'use strict';

(function ($) {

  $(document).on('focus', 'input.datepicker:not(.hasDatepicker)', function () {
    var input = $(this);

    // Only create datepickers in compatible browsers
    if (input[0].type === 'date') {
      return;
    }

    var defaults = { dateFormat: 'yy-mm-dd' };
    var options = input.data('datepicker-options');

    input.datepicker($.extend(defaults, options));
  });
})(jQuery);
'use strict';

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

(function ($, ActiveAdmin) {
  var Filters = (function () {
    function Filters() {
      _classCallCheck(this, Filters);
    }

    _createClass(Filters, null, [{
      key: '_clearForm',
      value: function _clearForm(event) {
        var regex = /^(q\[|q%5B|q%5b|page|utf8|commit)/;
        var params = ActiveAdmin.queryStringToParams().filter(function (_ref) {
          var name = _ref.name;
          return !name.match(regex);
        });

        event.preventDefault();

        if (ActiveAdmin.turbolinks) {
          ActiveAdmin.turbolinksVisit(params);
        } else {
          window.location.search = ActiveAdmin.toQueryString(params);
        }
      }
    }, {
      key: '_disableEmptyInputFields',
      value: function _disableEmptyInputFields(event) {
        var params = $(this).find(':input').filter(function (i, input) {
          return input.value === '';
        }).prop({ disabled: true }).end().serializeArray();

        if (ActiveAdmin.turbolinks) {
          event.preventDefault();
          ActiveAdmin.turbolinksVisit(params);
        }
      }
    }, {
      key: '_setSearchType',
      value: function _setSearchType() {
        $(this).siblings('input').prop({ name: 'q[' + this.value + ']' });
      }
    }]);

    return Filters;
  })();

  $(document).on('click', '.clear_filters_btn', Filters._clearForm).on('submit', '.filter_form', Filters._disableEmptyInputFields).on('change', '.filter_form_field.select_and_search select', Filters._setSearchType);
})(jQuery, window.activeadmin);
'use strict';

var onDOMReady = function onDOMReady() {
  return $('#active_admin_content .tabs').tabs();
};

$(document).ready(onDOMReady).on('page:load turbolinks:load', onDOMReady);
(function() {


}).call(this);
