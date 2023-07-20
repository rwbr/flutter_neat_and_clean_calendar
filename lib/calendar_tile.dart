
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/platform_widgets.dart';
import './date_utils.dart';
import './neat_and_clean_calendar_event.dart';
import "package:intl/intl.dart";

/// [NeatCleanCalendarTile] is responsible for displaying one calendar event entry below
/// the week view or the month view. The events are displayed in a list of [NeatCleanCalendarTile].
///
/// Each [NeatCleanCalendarTile] has a set of properties:
///
/// [onDateSelected] is the callback function that gets invoked on tapping a date in the
/// calendar view. It has the type [VoidCallback]
/// [date] containes the current date to be rendered as [DateTime] type
/// [dayOfWeek] Contains the name of the weekday to be shown in the header row
/// [isDayOfWeek] is a [bool], that gets used to deiced, if the tile shoulöd display a weekday or a date
/// [isSelected] is a [bool], that contains the information, if the current tile ist the selected day
/// [inMonth] is a [bool], that contains the information, if the current day belongs to the selected month
/// [events] contains a [List<CleanCalendarEvents>] of the events to display
/// [dayOfWeekStyle] this property allows to set a text style for the week days in the header row
/// [dateStyles] this property alloes to set a text style for the date tiles
/// [child] can contain a [Widget] that can be displayed. If tihs property is [null], the
///     method [renderDateOrDayOfWeek] gets called, so the [child] property has priority.
/// [defaultDayColor] is the color applied to days in the current month, that are not selected.
/// [defaultOutOfMonthDayColor] is the color applied to days outside the current month.
/// [selectedColor] is a [Color] used for displaying the selected tile
/// [todayColor] is a [Color] object used to display the tile for today
/// [eventColor] can be used to color the dots in the calendar tile representing an event. The color, that
///     is set in the properties of the [CleanCalendarEvent]  has priority over this parameter
/// [eventDoneColor] a [Color] object für displaying "done" events (events in the past)
class NeatCleanCalendarTile extends StatelessWidget {
  final VoidCallback? onDateSelected;
  final DateTime? date;
  final String? dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final bool inMonth;
  final List<NeatCleanCalendarEvent>? events;
  final TextStyle? dayOfWeekStyle;
  final TextStyle? dateStyles;
  final Widget? child;
  final Color? defaultDayColor;
  final Color? defaultOutOfMonthDayColor;
  final Color? selectedColor;
  final Color? selectedTodayColor;
  final Color? todayColor;
  final Color? eventColor;
  final Color? eventDoneColor;

  NeatCleanCalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyle,
    this.isDayOfWeek = false,
    this.isSelected = false,
    this.inMonth = true,
    this.events,
    this.defaultDayColor,
    this.defaultOutOfMonthDayColor,
    this.selectedColor,
    this.selectedTodayColor,
    this.todayColor,
    this.eventColor,
    this.eventDoneColor,
  });

  /// This function [renderDateOrDayOfWeek] renders the week view or the month view. It is
  /// responsible for displaying a calendar tile. This can be a day (i.e. "Mon", "Tue" ...) in
  /// the header row or a date tile for each day of a week or a month. The property [isDayOfWeek]
  /// of the [NeatCleanCalendarTile] decides, if the rendered item should be a day or a date tile.
  Widget renderDateOrDayOfWeek(BuildContext context) {
    // We decide, if this calendar tile should display a day name in the header row. If this is the
    // case, we return a widget, that contains a text widget with style property [dayOfWeekStyle]
    if (isDayOfWeek) {
      return new GestureDetector(
        child: new Container(
          alignment: Alignment.center,
          child: Text(
            dayOfWeek ?? '',
            style: dayOfWeekStyle,
          ),
        ),
      );
    } else {
      // Here the date tiles get rendered. Initially eventCount is set to 0.
      // Every date tile can show up to three dots representing an event.
      int eventCount = 0;
      return GestureDetector(
        onTap: onDateSelected, // react on tapping
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            // If this tile is the selected date, draw a colored circle on it. The circle is filled with
            // the color passed with the selectedColor parameter or red color.
            decoration: isSelected && date != null
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedColor != null
                        ? Utils.isSameDay(this.date!, DateTime.now())
                            ? selectedTodayColor != null
                                ? selectedTodayColor
                                : Colors.red
                            : selectedColor
                        : Theme.of(context).primaryColor,
                    image: events != null && events!.isNotEmpty
                        ? icon != '' && icon != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: providerImage(icon!),
                              )
                            : null
                        : null,
                  )
                : events == null
                    ? BoxDecoration()
                    : events!.isNotEmpty
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            image: icon != '' && icon != null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: providerImage(icon!),
                                  )
                                : null,
                          )
                        : BoxDecoration(), // no decoration when not selected
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Date display
                Text(
                  date != null ? DateFormat("d").format(date!) : '',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: isSelected && this.date != null
                        ? Colors.white
                        : Utils.isSameDay(this.date!, DateTime.now())
                            ? todayColor
                            : inMonth
                                ? defaultDayColor != null
                                    ? defaultDayColor
                                    : events != null &&
                                            events!.isNotEmpty &&
                                            icon != ''
                                        ? Colors.white
                                        : Colors.black
                                : (defaultOutOfMonthDayColor != null
                                    ? defaultOutOfMonthDayColor
                                    : Colors.grey),
                  ),
                  // Grey color for previous or next months dates
                ),
                // Dots for the events
                events != null && events!.length > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: events!.map((event) {
                          eventCount++;
                          // Show a maximum of 3 dots.
                          if (eventCount > 3) return Container();
                          return Container(
                            margin: EdgeInsets.only(
                                left: 2.0, right: 2.0, top: 1.0),
                            width: 5.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // If event is done (isDone == true) set the color of the dots to
                              // the eventDoneColor (if given) otherwise use the primary color of
                              // the theme
                              // If the event is not done yet, we use the given eventColor or the
                              // color property of the NeatCleanCalendarEvent. If both aren't set, then
                              // the accent color of the theme get used.
                              color: (() {
                                if (isSelected) return Colors.white;
                                // If eventColor property was not set, the color defined for the event
                                // gets used.
                                return eventColor ??
                                    event.color ??
                                    Theme.of(context).colorScheme.secondary;
                              }()),
                            ),
                          );
                        }).toList(),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      );
    }
  }

  String? get icon => events!
      .firstWhere(
        (element) => Utils.isSameDay(this.date!, element.startTime),
        orElse: () => NeatCleanCalendarEvent(
          '',
          startTime: this.date!,
          endTime: this.date!,
        ),
      )
      .icon;



  @override
  Widget build(BuildContext context) {
    // If a child widget was passed as parameter, this widget gets used to
    // be rendered to display weekday or date
    if (child != null) {
      return GestureDetector(
        child: child,
        onTap: onDateSelected,
      );
    }
    return Container(
      child: renderDateOrDayOfWeek(context),
    );
  }
}
