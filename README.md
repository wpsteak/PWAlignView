PWAlignView
===========

Align and arrange collection of view (UIView, UIImageView, UIButton, … ) on different direction

`PWAlignView` is a light-weight class to help you layout some simple view, which need to align on some direction.

##Usage

```
   #import "PWAlignView.h"
```


```
    PWAlignView *alignView = [[PWAlignView alloc] initWithFrame:self.view.frame];
    alignView.lineHeight = 45.0f;
    alignView.itemSpace = 5.0f;
    alignView.edgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    alignView.alignOption = PWAlignViewAlignOptionLeftToRight;
    [self.view addSubview:alignView];
    
```


```
    [alignView appendWithViewArray:array];
```

##Layout Types
Align views on different directions

####Left To Right (Default)

```
	alignView.alignOption = PWAlignViewAlignOptionLeftToRight;
```

####Right To Left

```
	alignView.alignOption = PWAlignViewAlignOptionRightToLeft;
```

####Top To Bottom
todo
####Bottom To Top
todo

## Sample
![Sample](https://raw.github.com/wpsteak/PWAlignView/master/Screenshot.png)



## MIT License
see license file
