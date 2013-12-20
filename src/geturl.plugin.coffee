url = require('url')

module.exports = (BasePlugin) ->

	class getUrlPlugin extends BasePlugin
		name: 'geturl'

		# Extend Template Data
		# Inject our helper method
		extendTemplateData: ({templateData}) ->
			dconfig = @docpad.getConfig()
			
			dconfig.plugins or= {}
			config = dconfig.plugins.geturl or= {}
			
			config.url or= dconfig.templateData.site.url
			config.url or= ''
		
			# Apply
			templateData.getUrl = (to, from) ->
				from = from || config.url+@document.url

				if (typeof to == "string")
					if (to[0] == "/" && to[1] != "/")
						to = config.url+to
					return url.resolve(from,to)

				if (typeof to == "object")
					if (typeof to.url == "string")
						return templateData.getUrl(to.url, from)
					if (typeof to.url == "function")
						return templateData.getUrl(to.get?('url'), from)
					if (to.map)
						return to.map((d) ->
							return templateData.getUrl(d,from)
						)

				return to
