###*
 * Gauge
 *
 * Panel
 *
 * @create 2015-03-03
 * @author suslov@me.com
###
# color: #535353
define ['svg'], (SVG)->
  class Panel
    ###*
     * [rad description]
     * @param  {Number} angle угол в градусах
     * @return угол в радианах
    ###
    rad:(angle)-> angle * Math.PI / 180

    ###*
     * Стрелка
     * @param  {[type]} draw [description]
     * @return {[type]}      [description]
    ###
    arrow:(draw)->
      @arrow = draw.group()
        .center( 160, 160)
        .rotate( -@start, 160, 160)
      w = @arrawConf.width
      l = @arrawConf.length
      @arrow
        .polygon("0,0  #{w/2},0 #{w/2},#{l}")
        .fill('#1c83dd')
        .x -2
        .y 0
      @arrow.circle()
        .x 0
        .y 0
        .fill '#1c83dd'
        .radius 6

    ###*
     * Текст по окружности
     * @param  {Object} draw   для рисования
     * @param  {Stinng} text   текст который рисуем
     * @param  {Number} radius
     * @param  {Number} start  Start angle
     * @param  {Number} len    length
     * @return draw group
    ###
    arcText:(draw, text, radius, start, len)->
      arcText = draw.group().x( 30).y( 30)
      end = start + len
      step = len / text.length
      for angle,i in (a for a in [start ... end] by step)
        x = radius + (radius * Math.sin @rad angle)
        y = radius + (radius * Math.cos @rad angle)
        arcText.circle()
          .fill '#1c83dd'
          .x x
          .y y
          .radius 16
        arcText.text(text[i])
          .x x - 5
          .y y - 5
          .fill '#f0efef'
          .font
            size: 16
            family: 'Verdana'
      arcText

    ###*
     * Засечки
     * @param {Object} draw   для рисования
     * @param {Number} radius
     * @param {Number} start  Start angle
     * @param {Number} len    length
     * @param {[type]} count  кол-во
     * @return {Object} draw group
    ###
    Lines: (draw, radius, start, len, count)->
      Lines = draw.group()
        .x 50
        .y 50
      end = start + len
      step = len / count
      for angle in [ start ... end] by step
        @arc Lines, radius, angle, 0, 5
      Lines


    ###*
     * Дуга
     * @param  {Object} draw   для рисования
     * @param  {Number} radius
     * @param  {Number} start  Start angle
     * @param  {Number} len    length
     * @param  {[type]} width = 2 ширина дуги
     * @param  {[type]} stroke = 2  толщина
     * @param  {[type]} color='#535353' цвет дуги
     * @return {Object} draw group
    ###
    arc:(draw, radius, start, len, width = 2, stroke =2, color='#535353')->
      for angle in [start .. (start + len)]
        x = radius + (radius * Math.sin @rad angle)
        y = radius + (radius * Math.cos @rad angle)
        x1 = x - (width * Math.sin @rad angle)
        y1 = y - (width * Math.cos @rad angle)
        draw.line(x1, y1, x, y)
          .stroke
            width: stroke
            color:color


    ###*
     * Дуги
     * @param  {Object} draw   для рисования
     * @param  {Number} radius
     * @param  {Number} start  Start angle
     * @param  {Number} len    length
     * @param  {Array} colors цвета
     * @return {Object} draw group
    ###
    arcs:(draw, radius, start, lens, colors)->
      arcs = draw.group()
        .x 60
        .y 60
      for len, i in lens
        @arc arcs, radius, start, len, 2, 2, colors[i]
        start = start + len
      arcs


    ###*
     * Panel в сборе
     * @param  {Object} draw   для рисования
     * @param  {String} text
     * @param  {Number} radius
     * @param  {Number} start  Start angle
     * @param  {Number} len    length
     * @return {Object} draw group
    ###
    panel:(draw, text, radius, start, len)->
      panel = draw.group()
      step = len / text.length
      gray = text.length - 3
      @arcs panel, radius - 30, start, [ gray * step, step, step ], @colors
      @Lines panel, radius - 20, start, len, text.length
      @arcText panel, text, radius, start, len
      panel
