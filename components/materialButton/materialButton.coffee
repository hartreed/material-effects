{ Ripple } = share

Template.materialButton.onRendered ->
  $(@firstNode).addClass @data.name if @data.name?
  @ripple = new Ripple @$('.ripple')
  @element = @$('.materialButton')

  @getRelativePosition = (x, y) ->
    offset = @element.offset()
    return {
      x: x - offset.left
      y: y - offset.top
    }

Template.materialButton.helpers
  attr: -> Template.instance().data

Template.materialButton.events
  'click': (event, instance) ->
    pos = instance.getRelativePosition event.clientX, event.clientY
    instance.ripple.react pos
