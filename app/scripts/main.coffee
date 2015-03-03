###*
 * Gauge
 *
 * Require config
 *
 * @create 2015-03-03
 * @author suslov@me.com
###
'use strict'
require.config
  waitSeconds: 0
  # baseUrl: '/scripts'
  shim:
    bootstrap:  deps: ['jquery']
  paths:
    jquery:     '../libs/jquery/dist/jquery'
    svg:        '../libs/svg.js/dist/svg'





require ['app', 'jquery' ], (App, $)->
  gauge = new App
    el: 'gauge'
    size:[320, 320]
    text: '0123456'
    demo: true
  gauge.val 100

  # плагин
  $.fn.gauge = (opts)->
    (
      for el in  @
        opts.el = el
        new App opts
      )

  gaugeArray = $('.gauge').gauge
    size: [240, 240]
    demo: true

  gaugeArray[0].val 50
  gaugeArray[1].val 30
  gaugeArray[2].val 70
  gaugeArray[3].val 80
