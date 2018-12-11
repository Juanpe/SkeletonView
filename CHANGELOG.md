# Change Log
All notable changes to this project will be documented in this file

## Next version

### New
- Adding swift news to mentioned section (thanks @osterbergmarcus).
- Allow updating skeleton layers without recreating them (thanks @eduardbosch).

## [Debug (1.4)](https://github.com/Juanpe/SkeletonView/releases/tag/1.4)

### New

- Create `skeletonDescription` print a skeleton representation of the view.
- Create `SKELETON_DEBUG` environment variable, in order to print the view hierarchy when the skeleton appears.

### Improvements
- Add two new methods to `SkeletonFlowDelegate` protocol. Now you can know when the skeleton did show and when it did hide.
- `Recursive` protocol

### Bug fixes
- Solved issue [#86](https://github.com/Juanpe/SkeletonView/issues/86) (thanks @reececomo)

## [Custom defaults (1.3)](https://github.com/Juanpe/SkeletonView/releases/tag/1.3)

### New

- Default values customizables. Now you can set the default values of Skeleton appearance.(thanks @reececomo)
  - issues: [[#50](https://github.com/Juanpe/SkeletonView/issues/50), [#83](https://github.com/Juanpe/SkeletonView/issues/83)]

### Bug fixes
- Solved issue [#41](https://github.com/Juanpe/SkeletonView/issues/41). Now, Skeleton works if UICollectionView cell's Nib is registered in code. (thanks @kjoneandrei)

## [Typo (1.2.3)](https://github.com/Juanpe/SkeletonView/releases/tag/1.2.3)

### Fixes

- Fix typo in `SkeletonTableViewDataSource` protocol

### Improvements

- Now it takes in account the `UIStackView` to calculate the `SkeletonLayer` bounds (thanks @giantramen)

## [New face (1.2.2)](https://github.com/Juanpe/SkeletonView/releases/tag/1.2.2)

### New

- Rebranding

### Bug fixes
- Solved issue [#23](https://github.com/Juanpe/SkeletonView/issues/23). Problem with UIStackView. (thanks @giantramen)

## [State (1.2.1)](https://github.com/Juanpe/SkeletonView/releases/tag/1.2.1)

### New

- You can set the corner radius multiline elements (thanks @B4V4-G)
- Save view state when skeleton appears and recovery when it is hidden (@juanpe)

### Bug fixes
- Solved issue [#51](https://github.com/Juanpe/SkeletonView/issues/51). Support inspectable properties when using Carthage. (thanks @eduardbosch)

## [On TV (1.2)](https://github.com/Juanpe/SkeletonView/releases/tag/1.2)

### New
- Now ```SkeletonView``` is **tvOS** compatible! 🎉.  (thanks @mihai8804858)

### Bug fixes
- Solved issue [#46](https://github.com/Juanpe/SkeletonView/issues/46). It crashes the application when tap on it, didSelect called and crash.


## [Hotfix (1.1.1)](https://github.com/Juanpe/SkeletonView/releases/tag/1.1.1)

### Bug fixes
- Now yes, solved issue [#39](https://github.com/Juanpe/SkeletonView/issues/39)

## [Needed (1.1)](https://github.com/Juanpe/SkeletonView/releases/tag/1.1)

### New
- Now ```SkeletonView```supports **UICollectionViews**! 🎉.  (thanks @Renatdz)

### Bug fixes
- Solved issue [#39](https://github.com/Juanpe/SkeletonView/issues/39). Gradient animation did not work when app becomes active.


## [Resizable (1.0.5)](https://github.com/Juanpe/SkeletonView/releases/tag/1.0.5)

### New
- Now you can use table views with resizable cells.

### Bug fixes
- Solved issues.
 [#17](https://github.com/Juanpe/SkeletonView/issues/17),
 [#30](https://github.com/Juanpe/SkeletonView/issues/30),
 [#34](https://github.com/Juanpe/SkeletonView/issues/34).

## [Filled or not (1.0.4)](https://github.com/Juanpe/SkeletonView/releases/tag/1.0.4)

### New
- You can set the filling percent of the last line in multiline elements (thanks @jontelang!)

### Bug fixes
- Solved issue [#14](https://github.com/Juanpe/SkeletonView/issues/14). You could edit text views with skeleton active.

## [In all directions (1.0.3)](https://github.com/Juanpe/SkeletonView/releases/tag/1.0.3)

### New
- Create ```SkeletonAnimationBuilder```, to facilitate the creation of layer animations.
```GradientDirection``` enum.

## [Retro (1.0.2)](https://github.com/Juanpe/SkeletonView/releases/tag/1.0.2)

### New
- Change some private keywords, to be Swift 3 compatible

## [Early bird bug (1.0.1)](https://github.com/Juanpe/SkeletonView/releases/tag/1.0.2)

### Bug fixes
- It was not removing the skeleton layer

## [Starter (1.0)](https://github.com/Juanpe/SkeletonView/releases/tag/1.0)

- First release
