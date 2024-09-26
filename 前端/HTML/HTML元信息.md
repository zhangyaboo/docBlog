# What's in the head? Metadata in HTML



Metadata in HTML is called `元数据` in Chinese。

### What’s in the head?

```
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>My test page</title>
  </head>
  <body>
    <p>This is my page</p>
  </body>
</html>

```

<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>My test page</title>
  </head>
  <body>
    <p>This is my page</p>
  </body>
</html>



The HTML head is the contents of the [`title`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head) element. Unlike the contents of the [`title`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/body) element (which are displayed on the page when loaded in a browser), the head's content is not displayed on the page. Instead, the head's job is to contain [metadata](https://developer.mozilla.org/en-US/docs/Glossary/Metadata) about the document. In the above example, the head is quite small:

```
<head>
  <meta charset="utf-8" />
  <title>My test page</title>
</head>

```



### add title

We've already seen the [`title`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title) element in action — this can be used to add a title to the document. This however can get confused with the [h1](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) element, which is used to add a top level heading to your body content — this is also sometimes referred to as the page title. But they are different things!

- The [h1](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements) element appears on the page when loaded in the browser — generally this should be used once per page, to mark up the title of your page content (the story title, or news headline, or whatever is appropriate to your usage.)
- The [`title`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title) element is metadata that represents the title of the overall HTML document (not the document's content.)

## [Metadata: the `<mate>` element](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML#metadata_the_meta_element)

Metadata is data that describes data, and HTML has an "official" way of adding metadata to a document — the [``](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta) element. Of course, the other stuff we are talking about in this article could also be thought of as metadata too. There are a lot of different types of `<meta>` elements that can be included in your page's `<head>`, but we won't try to explain them all at this stage, as it would just get too confusing. Instead, we'll explain a few things that you might commonly see, just to give you an idea.

### [Specifying your document's character encoding](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML#specifying_your_documents_character_encoding)

In the example we saw above, this line was included:

HTMLCopy to Clipboard
![img.png](img.png)
```
<meta charset="utf-8" />
```

This element specifies the document's character encoding — the character set that the document is permitted to use. `utf-8` is a universal character set that includes pretty much any character from any human language. This means that your web page will be able to handle displaying any language; it's therefore a good idea to set this on every web page you create! For example, your page could handle English and Japanese just fine:

