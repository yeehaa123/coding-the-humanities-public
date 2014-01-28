_ = require('underscore')
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
    learnTopics: ->
      @getCollection('learnTopics').toJSON()
    presentationThatCamp: ->
      @getCollection('presentationThatCamp').toJSON()
    presentationSoundSignatures: ->
      @getCollection('presentationSoundSignatures').toJSON()
    presentationSoundSignaturesTitles: ->
      sections = []
      @getCollection('presentationSoundSignatures').each (slide) ->
        if slide["attributes"]["type"] is "section-title"
          sections.push 
            section: slide["attributes"]["section"], 
            title: slide["attributes"]["title"]
      sections
    presentationRijks: ->
      @getCollection('presentationRijks').toJSON()
    presentationRijksSectionTitles: ->
      sections = []
      @getCollection('presentationRijks').each (slide) ->
        if slide["attributes"]["type"] is "section-title"
          sections.push 
            section: slide["attributes"]["section"], 
            title: slide["attributes"]["title"]
      sections
    pages: ->
      @getCollection('pages').toJSON()
    posts: ->
      @getCollection('posts').toJSON()
    getAsJson: (sth) ->
      c = @getCollection(sth)
      JSON.stringify(c)
    getTopicsAsJSON: ->
      c = @getCollection('learnTopics').map (r) -> 
        r = r.pick('name', 'difficulty_level', 'resources')
        count = 0
        for k,v of r.resources
          count += v.length
        r.resourceCount = count
        r
      JSON.stringify(c)

  collections:
    visionSnippets: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'visionSnippets'},{order_prop: 1})
    peopleProfiles: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'peopleProfiles'},{order_prop: 1})
    presentationThatCamp: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'thatCamp'}, {order_prop: 1})
    presentationRijks: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'rijks'}, {order_prop: 1})
    presentationSoundSignatures: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'soundSignatures'}, {order_prop: 1})
    learnTopics: ->
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
        position: (index) ->
          index * 850
        parameterize: (string) ->
          string.toLowerCase().split(" ").join("-")
      partials:
        menu: "<ul>{{#each this}}<li><a href='.{{url}}'>{{title}}</a></li>{{/each}}</ul>"
        cell: "{{#if this}}<td>{{> linkedTitleOrName}}</td>{{/if}}"
        cellDouble: "{{#if this}}<td colspan='2'>{{> linkedTitleOrName}}</td>{{/if}}"
        linkedTitleOrName: "<a href='{{url}}'>{{> titleOrName}}</a>"
        titleOrName: "{{#if title}}{{title}}{{else}}{{name}}{{/if}}"
        slideSection: "{{#if section}}section{{section}}{{/if}}"

    nodesass:
      neat: true

# Export the DocPad Configuration
module.exports = docpadConfig
