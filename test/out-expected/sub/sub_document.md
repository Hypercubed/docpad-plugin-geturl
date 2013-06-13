# This is /sub/sub_document.md

## Absolute URLs using @site.url
| Call										| Returned							|
| ---										| ---								|
| @getUrl('/')								| http://localhost:9778/				|
| @getUrl('/test')							| http://localhost:9778/test			|
| @getUrl('/test/')							| http://localhost:9778/test/			|
| @getUrl('/test.html')						| http://localhost:9778/test.html		|

## Relative to current @document.url
| Call										| Returned							|
| ---										| ---								|
| @getUrl('')								| http://localhost:9778/sub/sub_document.md				|
| @getUrl('test.html')						| http://localhost:9778/sub/test.html 		|
| @getUrl('../test.html')					| http://localhost:9778/test.html 	|

## Explicit site url
| Call										| Returned							|
| ---										| ---								|
| @getUrl('//test.com')						| http://test.com/ 			|
| @getUrl('http://test.com')				| http://test.com/		|
| @getUrl('https://test.com')				| https://test.com/		|
| @getUrl('test.html', 'https://test.com')				| https://test.com/test.html		|
| @getUrl('../test.html', 'https://test.com/sub/')				| https://test.com/test.html		|

## Works on objects
| Call										| Returned							|
| ---										| ---								|
| @getUrl(@document)						| http://localhost:9778/sub/sub_document.md				|

## Works on arrays
| Call										| Returned							|
| ---										| ---								|
| @getUrl(['/', '/test', 'test'])	| http://localhost:9778/,http://localhost:9778/test,http://localhost:9778/sub/test	|
| @getBlock('styles').add(@getUrl(@site.styles)).toHTML() | &lt;link  rel=&quot;stylesheet&quot; href=&quot;http://localhost:9778/root_style.css&quot; /&gt;&lt;link  rel=&quot;stylesheet&quot; href=&quot;http://localhost:9778/sub/sub_style.css&quot; /&gt; |

## Works on arrays of objects
| Call										| Returned							|
| ---										| ---								|
| @getUrl(@getCollection('documents'))	| http://localhost:9778/root_document.md,http://localhost:9778/sub/sub_document.md |
