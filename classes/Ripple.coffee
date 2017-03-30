{ Module } = share

share.Ripple = class Ripple extends Module
  constructor: (@element, @opt = {}) ->
    @[prop] = val for prop, val of @opt
    @left = 0
    @top = 0
    @size = 0
    @alpha = 0
    @maxAlpha = 0.6
    @time = 0
    @duration = 1000

  react: (pos) ->
    @time = 0
    @size = 0
    @alpha = @maxAlpha
    @left = pos.x
    @top = pos.y
    @updateElement()
    @start = Date.now()
    requestAnimationFrame @update

  update: =>
    @time = Date.now() - @start
    return if @time > @duration
    @alpha -= 0.04
    @alpha = 0 if @alpha < 0
    @size += 15
    @updateElement()
    requestAnimationFrame @update

  updateElement: ->
    @element.innerWidth @size
    @element.innerHeight @size
    halfSize = Math.floor @size / 2
    @element.css
      opacity: @alpha * @maxAlpha
      left: @left - halfSize
      top: @top - halfSize
