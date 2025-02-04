## [0.4.16] - 2025-02-03
* PR #89: If range > 0, the ID was cleared
* PR #91, Issue #90: intl-dependency loosened

## [0.4.15] - 2024-10-04
* Issue #88: The calendar list view now considers the 'locale' parameter

## [0.4.14] - 2024-09-04
* Issue #87: Fixed calculation of multiday events

## [0.4.13] - 2024-09-03
* Some more null checks in reaction to an app crash log possibly related to this package

## [0.4.12] - 2024-08-30
* Issue 86: Updtae of the eventlist now works every time

## [0.4.11] - 2024-08-29
* Automatic scrolling to nearest date from today on loading the event list view
* New callback method parameter onTodayButtonPressed

## [0.4.10] - 2024-08-27
* macos_ui removed as dependency
* Issue #84: Events added after initial load are not displayed in the monthly view
* touch target of the today button enlarded
* event list view now scrolls to today (or closest entry to today's date) when today button is hit
* CalendarTiles text doesn't scale with system settings

## [0.4.9] - 2024-08-14
* Issue #83: Updating the internal data possible again

## [0.4.8] - 2024-08-13
* Issue #82: Top row restructured, so that "Today" button is always centered, even when the date picker icon or the list picker icon is hidden

## [0.4.7] - 2024-08-12
* New parameter showEventListViewIcon to hide the list view icon

## [0.4.6] - 2024-08-12
* New callback for logging

## [0.4.5] - 2024-08-11
* Two new callback functions
  * onListViewStateChanged
  * onEventsUpdated

## [0.4.4] - 2024-08-08
* Individual color values for date picker style exchange against ThemeData objects

## [0.4.3] - 2024-08-07
* Bug-fix for styling today text in top bar

## [0.4.2] - 2024-08-07
* New properties for styling the top bar icons and the datepicker

## [0.4.1] - 2024-08-06
* Issue #78: new property eventCellBuilder for customization of the event list elements

## [0.4.0] - 2024-08-06
CAUTION: as announced in January 2022 the events map to set the calendar entries got finally removed. This can break your app and you might have to adapt it to use the events list.
* Issue #80: Multi Day events have empty metadata
* Issue #79: DatePicker now supports locale settings of the device
* Some refactoring
* Improved README

## [0.3.19+41] - 2024-03-07
* Update dependencies
* Replace deprecated text-styles for Flutter 3.22

## [0.3.18+40] - 2024-03-07
* Issue #74: Avoid exception, when onDateSelected is null
* Build for web and macOS

## [0.3.17+37] - 2024-03-06
* Update the intl package to 'any' in order to avoid problems when using this package

## [0.3.16+36] - 2024-01-09
* Issue #64: onDateSelected now delivers the correct date
* Issue #67: onMonthChanged now also triggers, when using the date picker and the arrow buttons
* Issue #68: eventDoneColor gets used, when isDone is set to true

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
