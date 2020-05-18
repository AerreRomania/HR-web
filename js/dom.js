/**
 * @param {function} a The function to execute when the DOM is ready
 */
function(a, b, c) {
  b = document
  c = 'addEventListener'
  b[c] ? b[c]('DocumentContentLoaded', a) : window.attachEvent('onload', a)
}