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
    bootstrap:  '../libs/bootstrap/dist/js/bootstrap'
    affix:      '../libs/bootstrap/js/affix'
    alert:      '../libs/bootstrap/js/alert'
    dropdown:   '../libs/bootstrap/js/dropdown'
    tooltip:    '../libs/bootstrap/js/tooltip'
    modal:      '../libs/bootstrap/js/modal'
    transition: '../libs/bootstrap/js/transition'
    button:     '../libs/bootstrap/js/button'
    popover:    '../libs/bootstrap/js/popover'
    carousel:   '../libs/bootstrap/js/carousel'
    scrollspy:  '../libs/bootstrap/js/scrollspy'
    collapse:   '../libs/bootstrap/js/collapse'
    tab:        '../libs/bootstrap/js/tab'
    text:       '../libs/requirejs-plugins/lib/text'

require ['app', 'jquery' ], (App, $)->
  gauge = new App
    el: 'gauge'

