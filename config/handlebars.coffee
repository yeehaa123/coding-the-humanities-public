moment = require('moment')

module.exports = -> 
  helpers:
    getBlock: (type, additional...) ->
      additional.pop()
      @getBlock(type).add(additional).toHTML()
    position: (index) ->
      index * 850
    parameterize: (string) ->
      string.toLowerCase().split(" ").join("-")
    tagString: (tags) ->
      tags.join(", ")
    publicationDate: (date) ->
      moment(date).format('LL')
  partials:
    cell: "{{#if this}}<td>{{> linkedTitleOrName}}</td>{{/if}}"
    cellDouble: "{{#if this}}<td colspan='2'>{{> linkedTitleOrName}}</td>{{/if}}"
    linkedTitleOrName: "<a href='{{url}}'>{{> titleOrName}}</a>"
    titleOrName: "{{#if title}}{{title}}{{else}}{{name}}{{/if}}"
    slideSection: "{{#if section}}section{{section}}{{/if}}"
