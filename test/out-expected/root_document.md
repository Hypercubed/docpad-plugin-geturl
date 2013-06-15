# @document.url = /root_document.md
# @site.url = http://localhost:9778/base

## Absolute URLs using @site.url
| Call										| Returned							|
| ---										| ---								|
| @getUrl('/')								| http://localhost:9778/base/				|
| @getUrl('/test')							| http://localhost:9778/base/test			|
| @getUrl('/test/')							| http://localhost:9778/base/test/			|
| @getUrl('/test.html')						| http://localhost:9778/base/test.html		|

## Relative to current @document.url
| Call										| Returned							|
| ---										| ---								|
| @getUrl('')								| http://localhost:9778/base/root_document.md				|
| @getUrl('test.html')						| http://localhost:9778/base/test.html 		|
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
| @getUrl(@document)						| http://localhost:9778/base/root_document.md				|

## Works on arrays
| Call										| Returned							|
| ---										| ---								|
| @getUrl(['/', '/test', 'test'])	| http://localhost:9778/base/,http://localhost:9778/base/test,http://localhost:9778/base/test	|
| @getBlock('styles').add(@getUrl(@site.styles)).toHTML() | &lt;link  rel=&quot;stylesheet&quot; href=&quot;http://localhost:9778/base/root_style.css&quot; /&gt;&lt;link  rel=&quot;stylesheet&quot; href=&quot;http://localhost:9778/base/sub_style.css&quot; /&gt; |

## Works on arrays of objects
| Call										| Returned							|
| ---										| ---								|
| @getUrl(@getCollection('documents'))	| http://localhost:9778/base/root_document.md,http://localhost:9778/base/sub/sub_document.md |
