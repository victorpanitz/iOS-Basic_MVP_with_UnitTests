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
