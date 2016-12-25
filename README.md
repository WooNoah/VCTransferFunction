##iOS正向传值之：构造方法和property的区别

一般iOS中正向传值的时候，可以使用：
1. `property`
2. `initWithXXX`
这两种有什么区别呢？

话不多说。直接上LOG


###构造方法
```
//即initWithXXX 或者自定义的方法名
/**
 *  构造方法中带不带init都是一样的。
 *  convertIntoModelWithDict 方法跟 initWithDict: 方法是一样的。
 */

2016-12-25 13:37:23.059 TransferInfoDemo[19811:1327595] 进入convertIntoModelWithDict方法
2016-12-25 13:37:27.280 TransferInfoDemo[19811:1327595] setName
2016-12-25 13:37:29.931 TransferInfoDemo[19811:1327595] setAge
2016-12-25 13:37:30.466 TransferInfoDemo[19811:1327595] setGender
2016-12-25 13:37:31.698 TransferInfoDemo[19811:1327595] 要跳出convertIntoModelWithDict方法了
2016-12-25 13:37:36.175 TransferInfoDemo[19811:1327595] <SecondModel: 0x7d2421b0>

//==================================================================================

2016-12-25 13:40:13.704 TransferInfoDemo[19904:1332710] 进入initWithDict方法
2016-12-25 13:40:13.704 TransferInfoDemo[19904:1332710] setName
2016-12-25 13:40:13.704 TransferInfoDemo[19904:1332710] setAge
2016-12-25 13:40:13.704 TransferInfoDemo[19904:1332710] setGender
2016-12-25 13:40:13.704 TransferInfoDemo[19904:1332710] 要跳出initWithDict方法了
2016-12-25 13:40:13.705 TransferInfoDemo[19904:1332710] <SecondModel: 0x796498c0>
```

###属性
```
2016-12-25 13:39:03.254 TransferInfoDemo[19872:1330478] 进入init方法
2016-12-25 13:39:03.254 TransferInfoDemo[19872:1330478] 要跳出init方法了
2016-12-25 13:39:10.088 TransferInfoDemo[19872:1330478] setName
2016-12-25 13:39:11.993 TransferInfoDemo[19872:1330478] setAge
2016-12-25 13:39:13.496 TransferInfoDemo[19872:1330478] setGender
2016-12-25 13:39:15.464 TransferInfoDemo[19872:1330478] <SecondModel: 0x79b5c160>
```
###区别：
以字典转模型来说：
***创建构造方法中传入要转换的字典，则会在init作用域内调用属性的setter方法。（我们也可以使用runtime来动态的字典转model：demo中有）***
***而使用property，则只会在的init完成之后，调用setter方法时，给予赋值***


####VC中正向传值(属性传值)
```
2016-12-25 15:49:24.435 TransferInfoDemo[20133:1420624] getter
2016-12-25 15:49:24.435 TransferInfoDemo[20133:1420624] 0
2016-12-25 15:49:24.436 TransferInfoDemo[20133:1420624] getter
2016-12-25 15:49:24.436 TransferInfoDemo[20133:1420624] 0
2016-12-25 15:49:24.436 TransferInfoDemo[20133:1420624] setter
2016-12-25 15:49:24.438 TransferInfoDemo[20133:1420624] loadView
2016-12-25 15:49:24.438 TransferInfoDemo[20133:1420624] viewDidLoad
2016-12-25 15:49:24.438 TransferInfoDemo[20133:1420624] getter
2016-12-25 15:49:24.439 TransferInfoDemo[20133:1420624] 10
```
***如果是ViewController正向传值的话，则可以看出：***
***setter是在init完成之后，loadView之前调用的。***
*所以，初始化的时候，值一直为0，在viewDidLoad中，赋值成功变为10。*
