url = require('url')

module.exports = (BasePlugin) ->

	class getUrlPlugin extends BasePlugin
		name: 'geturl'

		# Extend Template Data
		# Inject our partial methods
		extendTemplateData: ({templateData}) ->
		
			# Apply
			templateData.getUrl = (to, from) ->
				from = from || url.resolve(@site.url, @document.url)

				if (typeof to == "string")
					return url.resolve(from,to)

				if (typeof to == "object")
					if (typeof to.url == "string")
						return url.resolve(from, to.url)
					if (typeof to.url == "function")
						return url.resolve(from, to.get?('url'))
					if (to.map)
						return to.map((d) ->
							return templateData.getUrl(d,from)
						)

				return to
