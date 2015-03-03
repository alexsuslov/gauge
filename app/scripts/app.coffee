###*
 * Gauge
 *
 * App
 *
 * @create 2015-03-03
 * @author suslov@me.com
###
# color: #535353
define ['svg'], (SVG)->
  class App
    rad:(angle)-> angle * Math.PI / 180
    arc:(draw, radius, start, stop, width = 10, stroke =1, color='#535353')->
      for angle in [start .. (start + stop)]
        x = radius + (radius * Math.sin @rad angle)
        y = radius + (radius * Math.cos @rad angle)
        x1 = x - (width * Math.sin @rad angle)
        y1 = y - (width * Math.cos @rad angle)
        draw.line(x1, y1, x, y)
          .stroke
            width: stroke
            color:color

    arcText:(draw, text, radius, start, stop)->
      # for char in text
      #   console.log char
      step = (start + stop) / text.length + 1
      for angle,i in (a for a in [start .. (start + stop)] by step)
        x = radius + (radius * Math.sin @rad angle)
        y = radius + (radius * Math.cos @rad angle)
        # cicle = draw.circle()
        #   .fill '#1c83dd'
        #   .x x
        #   .y y
        #   .radius 4
        draw.text(text[i])
          .x x-4
          .y y-6
          .fill '#535353'
          .font
            size: 16
            family: 'Verdana'

    constructor:(@opts)->
      draw = SVG(@opts.el).size(300, 300)

      Group = draw.group()
        .x 50
        .y 50

      group = Group.group()
        .x 10
        .y 10

      @arc group, 100, -45, -180
      @arc group, 100, -225, -30, 15, 1 , '#fd940a'
      @arc group, 100, -255, -30, 20, 1 , '#fb000a'
      cicle = group.circle()
        .fill '#1c83dd'
        .x 100
        .y 100
        .radius 16

      # lines
      step = (45-285)/6
      for angle in [ -45 .. -285] by step
        @arc Group, 110, angle, 0, 5

      # text
      groupText = draw.group()
        .x 30
        .y 30
      @arcText groupText, '0123456', 130, -45, -243
      # draw.text('0')
      #   .x 38
      #   .y 221
      #   .fill '#535353'
      #   .font
      #     size: 16
      #     family: 'Verdana'

      @


