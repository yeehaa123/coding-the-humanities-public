# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = 
  templateData:
    site:
      title: "Coding the Humanities"
    visionSnippets: ()->
      @getCollection('visionSnippets').toJSON()
    peopleProfiles: ()->
      @getCollection('peopleProfiles').toJSON()
    pages: ()->
      @getCollection('pages').toJSON()
  collections:
    visionSnippets: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'visionSnippets'},{order_prop: 1})
    peopleProfiles: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'peopleProfiles'},{order_prop: 1})
    pages: ->
      @getCollection("html").findAllLive({isPage: true})
  plugins:
    consolidate:
      handlebars: true
    handlebars:
      helpers:
        getBlock: (type, additional...) ->
          additional.pop()
          @getBlock(type).add(additional).toHTML()
      partials:
        menu: "<ul>{{#each this}}<li><a href='.{{url}}'>{{title}}</a></li>{{/each}}</ul>"
    nodesass:
      neat: true

# Export the DocPad Configuration
module.exports = docpadConfig
