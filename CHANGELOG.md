## [0.3.15+35] - 2023-12-08
* Issue #61: onMonthChanged now correctly triggers

## [0.3.14+32] - 2023-07-24
* Pre-release state removed

## [0.3.14-dev.2] - 2023-07-20
* new property 'wide' for controlling the width of the image
* property 'icon' now optional

## [0.3.14-dev.1] - 2023-07-19
* Publishing as Pre-Release becaus of the depencency of
  a package with beta status

## [0.3.14+29] - 2023-07-19
* PR #52: New parameter for setting the icon of a NeatCleanCalendarEvent
* Updated dependency of macos_ui, now building with Flutter 3.10.6

## [0.3.13+28] - 2023-01-18
* PR #51: New parameter for a callback handling long pressing events
## [0.3.12+27] - 2022-12-3ß
* PR #50: Upgrade of the version of the intl package dependenxy

## [0.3.11+26] - 2022-12-27
* Issue #37: Addition to handle issues with timezones and conversion to local time

## [0.3.11+25] - 2022-12-26
* Issue #41: fixes Selecting new date calls onMonthChanged

## [0.3.10+24] - 2022-12-26
* PR #47: fixes a bug, where onEventSelected event was only triggered, when the user tapped on the text widgets

## [0.3.9+23] - 2022-10-01
* PR #42: extend event class & add event tile height

## [0.3.8+22] - 2022-08-14
* Adjusting for bigger screens

## [0.3.7+21] - 2022-06-30
* Example updated for macOS build

## [0.3.7+20] - 2022-06-30
* Support for macOS widgets

## [0.3.6+19] - 2022-06-03
* Issue #37 closed

## [0.3.5+18] - 2022-05-04
* Option to change color of selected day when same date as today

## [0.3.4+17] - 2022-03-23
* Issue #34 closed
* Properties for default day text colors

## [0.3.3+16] - 2022-03-23
* Issue #32 closed
* Option startOnMonday wasn't working correctly for the month view

## [0.3.2+15] - 2022-02-13
* New additionaly parameter to set the initial date of the DatePicker, if enabled

## [0.3.1+14] - 2022-02-07
* Introduction of a new parameter displayMonthTextStyle to manipulate the text style of the month name in the top bar
## [0.3.0+13] - 2022-01-16
CAUTION: from v0.3.0 on the preferred way to set the calendar events is to provide a list. You can still
use a map to do this, but this functionality is DEPRECATED and will get removed from v0.4.0 on.
* New property multiDayEndText can be used to mark the end of a multi-day event
* New parameter eventsList simplifies the process of defining the events to be shown. The list is just an unordered collection of NeatAndCleanCalendarEvents. On init the library analyzes the list and builds the eventsMap from its content. While doing this, the library now correctly shows all-day and multi-day events.
* For multi-day events it is necessary for the UI to know, if the event is the beginning, meddle part or end of the event.
* New API option: datePickerType select between hidden, year picker and date picker
* Now the calendar handles all-day-events differently.
* all-day-events have the property isAllDay set to true
* then these events get displayed at the top of the events list instead of start and end time a string will be shown
* this string can be defines with the allDayEventText property
* if this property is left empty, the calendar will show "All day"
## [0.2.3+11] - 2021-08-17
* Extended example to illustrate how to add events to the list and update the view
* This is a reaction on issue #13

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
