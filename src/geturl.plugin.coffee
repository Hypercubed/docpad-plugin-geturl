url = require('url')

module.exports = (BasePlugin) ->

	class getUrlPlugin extends BasePlugin
		name: 'geturl'

		# Extend Template Data
		# Inject our helper method
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
						_getUrl = arguments.callee
						return to.map((d) ->
							return _getUrl(d,from)
						)

				return to
