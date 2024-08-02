# JS基础语法

> 参考：[JavaScript教程 - 廖雪峰的官方网站 (liaoxuefeng.com)](https://www.liaoxuefeng.com/wiki/1022910821149312)





#### 判断父页面是否有这个方法

JS中如何判断父页面是否有这个方法，如果有执行，如果没有就不执行，以便放置异常出现

在JavaScript中，可以通过判断父页面是否存在某个方法来决定是否执行该方法。这可以通过使用`typeof`操作符来实现，因为`typeof`对于未定义的变量会返回`"undefined"`，而对于函数会返回`"function"`。以下是一个基本的实现示例：

```javascript
// 假设我们要检查的方法名为'exampleMethod'
var parentMethodExists = typeof window.parent.exampleMethod !== "undefined";

if (parentMethodExists) {
    // 如果父页面中有这个方法，就执行它
    window.parent.exampleMethod();
} else {
    // 如果父页面中没有这个方法，就不执行，或者执行其他操作
    console.log("父页面没有这个方法");
}
```

这段代码首先检查`window.parent.exampleMethod`是否为`undefined`，如果不是，则表示父页面有这个方法，那么就执行这个方法。如果为`undefined`，则表示父页面没有这个方法，那么就不执行，或者你可以选择在控制台输出一条消息。

需要注意的是，`window.parent`是一个对父窗口的引用，如果你的页面是在同一个窗口（或标签页）中，即没有打开一个新的窗口或标签页，那么`window.parent`会指向自己，即`window`。在使用`window.parent`访问父页面的方法时，要确保你的页面确实是在一个子窗口中，否则可能会引发异常。





#### 页面不加载JS代码

之前以为是写的有bug导致不显示，其实不是，原因是因为JS代码没有加载，在控制台存在的情况下重新刷新页面即可。

# 使用JS获取当前页面的URL(网址信息)

```
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script>
			var url;
 
			url = window.location.href; /* 获取完整URL */
			alert(url); /* http://127.0.0.1:8020/Test/index.html#test?name=test */
 
			url = window.location.pathname; /* 获取文件路径（文件地址） */
			alert(url); /* /Test/index.html */
 
			url = window.location.protocol; /* 获取协议 */
			alert(url); /* http */
 
			url = window.location.host; /* 获取主机地址和端口号 */
			alert(url); /* http://127.0.0.1:8020/ */
 
			url = window.location.hostname; /* 获取主机地址 */
			alert(url); /* http://127.0.0.1/ */
 
			url = window.location.port; /* 获取端口号 */
			alert(url); /* 8020 */
 
			url = window.location.hash; /* 获取锚点（“#”后面的分段） */
			alert(url); /* #test?name=test */
 
			url = window.location.search; /* 获取属性（“?”后面的分段） */
			alert(url);
 
			/* 如果需要URL中的某一部分，可以自己进行处理 */
			url = window.location.pathname;
			url = url.substring(url.lastIndexOf('/') + 1, url.length);
			alert(url); /* /index.html */
 
			/* 
			 * 如果页面使用了框架（frameset）
			 * 要获取到指定页面的URL
			 * 只要把window换成指定的页面即可
			 */
			/* 'frame'为指定页面的class名 */
			var url = window.parent.frames['frame'].location.href;
			/* 获取当前地址栏中显示的URL */
			var url = window.parent.location.href;
			/* window parent 可互换 */
			var url = parent.window.location.href;
		</script>
	</head>
	<body>
	</body>
</html>

```

