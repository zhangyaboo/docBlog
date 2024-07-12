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



