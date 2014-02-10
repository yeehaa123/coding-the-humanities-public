module.exports = ->
  all:
    all: ->
      @getCollection('pages').toJSON()
    data: 
      visionSnippets: ->
        @getCollection('visionSnippets').toJSON()
      peopleProfiles: ->
        @getCollection('peopleProfiles').toJSON()
      learnTopics: ->
        @getCollection('learnTopics').toJSON()
      posts: ->
        @getCollection('posts').toJSON()
    
