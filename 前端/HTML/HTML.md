

# HTML



## HTML 标签元素

```
<em>刀枪剑戟 斧钺钩叉</em>
```

<em>刀枪剑戟 斧钺钩叉</em>

### 嵌套元素

```html
<p>My cat is <strong>very</strong> grumpy.</p>
```


<p>My cat is <strong>very</strong> grumpy.</p>



### 内联元素

```
这是<em>斜体</em>
这是<a href='www.baidu.com'>百度</a>
```

这是<em>斜体</em>
这是<a href='www.baidu.com'>百度</a>

#### 块级元素

```
<p>一块</p>
<p>二块</p>
<p>三块</p>
```

<p>一块</p>
<p>二块</p>
<p>三块</p>

#### 空元素

```
<img
  src="https://roy-tian.github.io/learning-area/extras/getting-started-web/beginner-html-site/images/firefox-icon.png"
  alt="Firefox 图标" />
```

<img
  src="https://roy-tian.github.io/learning-area/extras/getting-started-web/beginner-html-site/images/firefox-icon.png"
  alt="Firefox 图标" />







### 属性



```
  <p>A link to my favorite <a href="http://106.15.105.212" title="悬停显示内容" target="_blank"> website.</a></p>
```

  <p>A link to my favorite <a href="http://106.15.105.212" title="悬停显示内容" target="_blank"> website.</a></p>

> `target="_blank"` 将在新标签页中显示链接



布尔属性

```html
<div>
 <input type='text'/>   
 <input type='text' enable='disable'/>   
<div>
```


<div>
 <input type='text'/>   
 <input type='text' enable='disable'/>   
<div>



使用""包含属性值



单引号or双引号？







```
<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <title>我的测试站点</title>
  </head>
  <body>
    <p>这是我的页面</p>
  </body>
</html>

```





## [Character references: including special characters in HTML](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Getting_started#character_references_including_special_characters_in_html)

In HTML, the characters `<`, `>`,`"`,`'`, and `&` are special characters. They are parts of the HTML syntax itself. So how do you include one of these special characters in your text? For example, if you want to use an ampersand or less-than sign, and not have it interpreted as code.

You do this with [character references](https://developer.mozilla.org/en-US/docs/Glossary/Character_reference). These are special codes that represent characters, to be used in these exact circumstances. Each character reference starts with an ampersand (&), and ends with a semicolon (;).

| Literal character | Character reference equivalent |
| :---------------- | :----------------------------- |
| <                 | `&lt;`                            |
| >                 | `&gt;`                            |
| "                 | `&quot;`                      |
| '                 | `&apos;`                      |
| &                 | `&amp;`                       |

The character reference equivalent could be easily remembered because the text it uses can be seen as less than for `<`, quotation for `"` and similarly for others. To find more about entity references, see [List of XML and HTML character entity references](https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references) (Wikipedia).

In the example below, there are two paragraphs:

HTMLPlayCopy to Clipboard

```
<p>In HTML, you define a paragraph using the <p> element.</p>

<p>In HTML, you define a paragraph using the &lt;p&gt; element.</p>
```

In the live output below, you can see that the first paragraph has gone wrong. The browser interprets the second instance of `<p>` as starting a new paragraph. The second paragraph looks fine because it has angle brackets with character references.

Play