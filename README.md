PWAlignView
===========
`PWAlignView` is a light-weight class to help you layout some simple views (UIView, UIImageView, UIButton, … ), which need to to be aligned on some direction.

## What's new in 1.0.1
- fix layout problem in PWAlignViewAlignOptionStrategyLR when view is out of alignView's frame

- code refactor

- refine example UI

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
pod "PWAlignView"
 ```

## Samples
![Sample](https://raw.github.com/wpsteak/PWAlignView/master/Screenshot.png)

## MIT License
see license file
