# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = 
  templateData:
    site:
      title: "Coding the Humanities"
  plugins:
    consolidate:
      handlebars: true
    handlebars:
      helpers:
        getBlock: (type, additional...) ->
          additional.pop()
          @getBlock(type).add(additional).toHTML()
        pagesMenu: ()->
          c = @getCollection("html").findAll({isPage: true}).toJSON()
          out = "<ul>"
          m = c.map (page) ->
            "<li><a href='#{page.url}'>#{page.title}</a></li>"
          out += m.join("\n")
          out += "</ul>"
          out
    nodesass:
      neat: true

# Export the DocPad Configuration
module.exports = docpadConfig
