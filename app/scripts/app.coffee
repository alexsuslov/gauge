###*
 * Gauge
 *
 * App
 *
 * @create 2015-03-03
 * @author suslov@me.com
###
# color: #535353
define ['panel'], (Panel)->
  class App extends Panel
    demo: false
    colors: ['#535353', '#fd940a', '#fb000a']
    size:   [320,320]
    start:  -60
    len:    -280
    text:   '0123456'
    arrawConf:
      width: 10
      length: 100

    constructor:(@opts)->
      for name in ['start', 'len', 'size', 'text', 'demo']
        @[name] = @opts[name] if @opts[name]

      draw = SVG(@opts.el).size(@size[0], @size[1])
      scale = draw.group()
        .scale(@size[0] / 320, @size[1] / 320)
      @panel scale, @text, 130, @start, @len
      @arrow scale, 0
      @

    val:(angle)->
      angle = 240 / 100 * angle
      if @demo
        @arrow
          .animate(20000)
          .rotate( angle + -@start , 160, 160 )
      else
        @arrow
          .animate(200)
          .rotate( angle + -@start , 160, 160 )


