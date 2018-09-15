# iOS Basic MVP template with Unit Tests
A Basic MVP Template based on TDD using XCTest*

## The MVP architecture

The MVP Architecture follows few principles. First you need to understand how it layers communicates each self.

### View <-> Presenter <-> Model

The main concepts to understand the core of that approach is to keep in mind that:

* View is dummy
* Presenter do not know UIKit

With these two ideias, it's a little bit hard to figure out how to implement the navigation, since our view is dummy and we can't have a UIViewController reference (UIKit) in the Presenter.

Therefore, there are some approaches to follow. I've used what I think it's the simplest one (not the best one), creating a router and, of course, applying tests to it too.

## Tests

##### Attatching the view
Create tests is usually the first step when developing a user story. I've use to start creating the context when the view is being attatched. So, at this point we need to create situation to set some values of our components and verify if we are passing the correct value to the correct method.

##### UserActions
The second point from here is to verify users actions. So, verify if your app is working as it should when some action is called.

## Layout

As not a huge fan of Interface Builder, I usually prefer to keep a programatically layout, but keep on your mind it's not a bullet proof or something like that.
