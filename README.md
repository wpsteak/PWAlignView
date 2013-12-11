PWAlignView
===========
`PWAlignView` is a light-weight class to help you layout some simple views (UIView, UIImageView, UIButton, … ), which need to to be aligned on some direction.

##Usage

```
    PWAlignView *alignView = [[PWAlignView alloc] initWithFrame:self.view.frame];
    alignView.lineHeight = 45.0f;
    alignView.itemSpace = 5.0f;
    alignView.edgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    alignView.alignOption = PWAlignViewAlignOptionLeftToRight;
    [self.view addSubview:alignView];
    
    [alignView appendWithViewArray:array];
```

##Layout Types

####Left To Right (Default)

```
alignView.alignOption = PWAlignViewAlignOptionLeftToRight;
```

####Right To Left

```
alignView.alignOption = PWAlignViewAlignOptionRightToLeft;
```
##CocoaPods

 ```
pod "PWAlignView", "~> 1.0.0"
 ```

## Samples
![Sample](https://raw.github.com/wpsteak/PWAlignView/master/Screenshot.png)

##TODO
1.1.0

vertical alignment top, center, bottom

## MIT License
see license file
