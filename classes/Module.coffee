class Opt
  defaults: (opt, defaultsArgs) -> #class can override this and access both the arguments the class was called with, and any additional arguments set by the constructor

  applyDefaults: (options, defaults, applyToSelf, defaultsArgs) -> #apply default values to an options object
    options[prop] ?= val for prop, val of @defaults(options, defaultsArgs)
    @[prop] ?= val for prop, val of options if applyToSelf #apply them to self
    options

  addDefaults: (parent, defaults) -> #inherit and override parent class defaults, call addDefaults super, newOptions = {prop: val}
    defaults[prop] ?= val for prop, val of parent
    return defaults

  constructor: (@opt = {}, applyToSelf = false, defaults = @defaults, defaultsArgs...) -> @applyDefaults @opt, defaults, applyToSelf, defaultsArgs

#adapted from https://arcturo.github.io/library/coffeescript/03_classes.html Module class

moduleKeywords = ['extended', 'included']

share.Module = class Module extends Opt
  @extend: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @[key] = value

    obj.extended?.apply(@)
    this

  @include: (obj) ->
    for key, value of obj when key not in moduleKeywords
      # Assign properties to the prototype
      @::[key] = value

    obj.included?.apply(@)
    this

  include: (obj) -> #this is so instances can mixin another class after construction
    @[prop] = val for prop, val of obj
