_ = require('underscore')
pages = require('./config/pages')()
presentations = require('./config/presentations')()
collections = require('./config/collections')()
handlebars = require('./config/handlebars')()

docpadConfig = 
  templateData:
    site:
      title: "Coding the Humanities"
    presentations: presentations.templateData
    pages: pages.all
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
  collections: collections.all
  plugins:
    handlebars: handlebars
    nodesass:
      neat: true

module.exports = docpadConfig
