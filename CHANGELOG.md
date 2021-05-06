## [0.2.2+10] - 2021-05-06
* Issue #12 was fixed in this release
* Now it's possible to use the parameter `isExpanded`to decide, if the widget should be shown in expanded mode

## [0.2.1+9] - 2021-04-26
* This release fixes a bug, that appeared, if the user selected a day in next month, when this date fell into next year or a day in previous month, when this date fell into previous year
## [0.2.0+8] - 2021-04-12
* Project converted to **null safety**
## [0.1.5+7] - 2021-04-11
* There was a bug in the calculations for the first day of week. This bug was corrected in this release
## [0.1.4+6] - 2021-03-05

* Dependency on date_utils package resolved
* The Utils class is now directly embedded in the package
* This reduces the chance of possible dependency problems

## [0.1.3+5] - Layout of event list improved

* The event list is now built of a Row of Expanded widgets instead of the ListTile

## [0.1.2+4] - Export of NeatCleanCalendarEvent class

* NeatCleanCalendarEvent now is exported, so that the separate import is no longer necessary 

## [0.1.1+3] - Corrected README

* README - style corrected

## [0.1.1+2] - Corrected README

* README - style corrected
## [0.1.0+1] - First public release

* Moved the method to render the event list into the package
* New parameters onEventSelected and eventListBuilder
