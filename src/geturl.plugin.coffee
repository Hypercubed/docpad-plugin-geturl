module.exports = (BasePlugin) ->

	class getUrlPlugin extends BasePlugin
		name: 'geturl'

		# Extend Template Data
		# Inject our partial methods
		extendTemplateData: ({templateData}) ->
		
			# Apply
			templateData.getUrl = (_, site) ->
				site = site || @site.url

				if (typeof _ == "string")
					if (_[0] == "/" && _[1] != "/")
						return site+_
					return _

				if (typeof _ == "object")
					if (_.url)
						return @getUrl(_.url,site)
					if (_.map)
						_getUrl = arguments.callee
						return _.map((d) ->
							return _getUrl(d,site)
						)

				return _
