# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = 
  templateData:
    site:
      title: "Coding the Humanities"
    visionSnippets: ->
      @getCollection('visionSnippets').toJSON()
    peopleProfiles: ->
      @getCollection('peopleProfiles').toJSON()
    learnResources: ->
      @getCollection('learnResources').toJSON()
    pages: ->
      @getCollection('pages').toJSON()
    posts: ->
      @getCollection('posts').toJSON()
  collections:
    visionSnippets: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'visionSnippets'},{order_prop: 1})
    peopleProfiles: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'peopleProfiles'},{order_prop: 1})
    learnResources: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'learnResources'},{difficulty_level: 1})
    posts: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'posts'})
    pages: ->
      @getCollection("html").findAllLive({isPage: true})
  plugins:
    handlebars:
      helpers:
        getBlock: (type, additional...) ->
          additional.pop()
          @getBlock(type).add(additional).toHTML()
      partials:
        menu: "<ul>{{#each this}}<li><a href='.{{url}}'>{{title}}</a></li>{{/each}}</ul>"
        cell: "{{#if this}}<td>{{> linkedTitleOrName}}</td>{{/if}}"
        cellDouble: "{{#if this}}<td colspan='2'>{{> linkedTitleOrName}}</td>{{/if}}"
        linkedTitleOrName: "<a href='{{url}}'>{{> titleOrName}}</a>"
        titleOrName: "{{#if title}}{{title}}{{else}}{{name}}{{/if}}"
    nodesass:
      neat: true

# Export the DocPad Configuration
module.exports = docpadConfig
