module.exports = ->
  getTitles = (collection) ->
    sections = []
    collection.each (slide) ->
      if slide["attributes"]["type"] is "section-title"
        sections.push 
          section: slide["attributes"]["section"], 
          title: slide["attributes"]["title"]
    sections

  templateData:
    all: ->
      @getCollection('presentations').toJSON()
    thatCamp:
      slides: ->
        @getCollection('presentationThatCamp').toJSON()
    soundSignatures:
      slides: ->
        @getCollection('presentationSoundSignatures').toJSON()
      titles: ->
        collection = @getCollection('presentationSoundSignatures')
        getTitles(collection)
    rijksKickOff:
      slides: ->
        @getCollection('presentationRijks').toJSON()
      titles: ->
        collection = @getCollection('presentationRijks')
        getTitles(collection)
    benjamedia:
      slides: ->
        @getCollection('presentationBenjamedia').toJSON()
      titles: ->
        collection = @getCollection('presentationBenjamedia')
        getTitles(collection)
    darkHorse:
      slides: ->
        @getCollection('presentationDarkHorse').toJSON()
      titles: ->
        collection = @getCollection('presentationDarkHorse')
        getTitles(collection)
