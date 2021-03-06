---
title: 大整数加法、乘法的JavaScript实现
date: 2017-03-30 17:56:45
tags:
- JavaScript
- algorithm
- 大整数加法
- 大整数乘法
categories:
- 算法
---

> 在某些情况下，我们要处理很大的整数，它无法在计算机硬件能直接表示的范围内进行处理。若用浮点数来表示它，则只能近似地表示它的大小，计算结果中的有效数字也受到限制。若要精确地表示大整数并在计算结果中要求精确地得到所有位数上的数字，就必须用软件的方法来实现大整数的算术运算。

> -- 引用[混沌](https://sites.google.com/a/chaoskey.com/algorithm/02/02)的原话。

<!-- more -->

## 大整数加法

在另一篇文章中已经整理过，在这里再贴一次吧。这不是我自己想出来的方法，这是在网上找的大神写的方法，具体源头我也没找到。至少我找到的算法里面没有比这个更简单的了。

```javascript
// 方法
var bigNumStringAddition = (a, b) => {

    let result = '',
        tempVal = 0,
        arra = a.split(''),
        arrb = b.split('');

    while (arra.length || arrb.length || tempVal) {

        tempVal += ~~arra.pop() + ~~arrb.pop();

        result = tempVal % 10 + result;

        tempVal = tempVal > 9;
    }

    return result.replace(/^0+/, '');

};

// 测试
bigNumStringAddition('87683997878946347862738468726348289374972938479823749872938479234923846237672364732478237492394738748273948789237487238472389478923748782364723647823847283974', '92734897238947832456237489273498723984782365783465782634786287346782638472983749823748357634785278348273498723894792387489327487238478234827389472938748923748235862384782374');

// '92734897238947920140235368219846586723251092131755157607724767170532511411462984747594595307150010826510991118633540661438116724725716707216868396687531288471883686232066348'
```

## 大整数乘法

大整数加法的JavaScript实现和大整数乘法的JavaScript实现是我在两次面试中碰到的问题。大整数加法的算法我找到了上面的算法，各种奇淫技巧，简单得不行。大整数乘法呢我没有找到满意的算法，先把自己写的贴上来吧。

```javascript
// 方法
var bigNumStringMultiply = (a, b) => {

    let arra = a.split('').reverse(),
        arrb = b.split('').reverse(),
        lena = arra.length,
        lenb = arrb.length,
        result = Array(lena + lenb + 1).join('0').split('');

    arra.map((itema, indexa) => {
        arrb.map((itemb, indexb) => {
            result[indexa + indexb] = +result[indexa + indexb] + itema * itemb;
        });
    });

    result.map((item, index) => {
        if (item >= 10) {
            result[index + 1] = ~~result[index + 1] + ~~(result[index] / 10);
            result[index] %= 10;
        }
    });

    return result.reverse().join('').replace(/^0+/, '');
}

// 测试
bigNumStringMultiply('87683997878946347862738468726348289374972938479823749872938479234923846237672364732478237492394738748273948789237487238472389478923748782364723647823847283974', '92734897238947832456237489273498723984782365783465782634786287346782638472983749823748357634785278348273498723894792387489327487238478234827389472938748923748235862384782374');

// '8131366532804209271848777343148089734867540084740313073714626072147803459519225889924153683477346079879903114543791258684883828524130882115379440144725160920757443592354053118047908949159167193991569423470425543890534108742857689635336451466135028613346191424578161286549581455047710048500852396172271754236155746244567328967874276'
```
