# UIView-DartBoard
This is a simple, minimalistic dartboard view created for practicing UIView.
Will try to improve the design and options.

Functionalities:
-setting number of circles
-scaling
-radius difference between circles
-line width
-back color
-line color
-bullseye color
-size of the point
-color of the point

Gestures:
1) Double tap to mark a point.
2) Swipe up to increase circles.
3) Swipe down to decrease circles.
4) Pinch to scale the rings.

Usage:
1) copy the file to your Xcode project.
2) drag and drop a view to your application.
3) click the view.
3) goto Identity inspector in Utilities section.
4) set the Class: DartsView.

Adding Gestures:
1) copy ViewController.swift file to your project.
2) select the View Controller.
3) select the Identity inspector in Utilities section.
4) set the Class: ViewController.
5) wire up the DartView view outlet to "var dartboard: DartsView" in View Controller. 

Changing properties:
1) click the view.
2) go to Attributes inspector.
3) options are available to change.
