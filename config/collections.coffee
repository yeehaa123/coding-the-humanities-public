module.exports = ->
  all:
    visionSnippets: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'visionSnippets'},{order_prop: 1})
    peopleProfiles: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'peopleProfiles'},{order_prop: 1})
    presentationThatCamp: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'thatCamp'}, {order_prop: 1})
    presentationRijks: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'rijks'}, {order_prop: 1})
    presentationBenjamedia: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'benjamedia'}, {order_prop: 1})
    presentationDarkHorse: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'towards-a-platform'}, {order_prop: 1})
    presentationSoundSignatures: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'soundSignatures'}, {order_prop: 1})
    learnTopics: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'learnResources'},{difficulty_level: 1})
    posts: ->
      @getCollection("html").findAllLive({relativeOutDirPath: 'posts'})
    pages: ->
      @getCollection("html").findAllLive({isPage: true})
    presentations: ->
      @getCollection("html").findAllLive({isPresentation: true}, {date: -1})
