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
    soundsignatures:
      slides: ->
        @getcollection('presentationsoundsignatures').tojson()
      titles: ->
        collection = @getcollection('presentationsoundsignatures')
        gettitles(collection)
    rijksKickOff:
      slides: ->
        @getCollection('presentationRijks').toJSON()
      titles: ->
        collection = @getCollection('presentationRijks')
        getTitles(collection)
