// ignore_for_file: deprecated_member_use_from_same_package, deprecated_member_use

library flutter_neat_and_clean_calendar;

import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/date_picker_config.dart';
import 'package:flutter_neat_and_clean_calendar/platform_widgets.dart';
import './date_utils.dart';
import './simple_gesture_detector.dart';
import './calendar_tile.dart';
import './neat_and_clean_calendar_event.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// Export NeatCleanCalendarEvent for using it in the application
export './neat_and_clean_calendar_event.dart';

typedef DayBuilder(BuildContext context, DateTime day);
typedef EventListBuilder(
    BuildContext context, List<NeatCleanCalendarEvent> events);

enum DatePickerType { hidden, year, date }

class Range {
  final DateTime from;
  final DateTime to;
  Range(this.from, this.to);
}

/// Clean Calndar's main class [Calendar]
///
/// This calls is responisble for controlling the look of the calnedar display as well
/// as the action taken, when changing the month or tapping a date. It's higly configurable
/// with its numerous properties.
///
/// [onDateSelected] is of type [ValueChanged<DateTime>] and it containes the callback function
///     extecuted when tapping a date
/// [onMonthChanged] is of type [ValueChanged<DateTime>] and it containes the callback function
///     extecuted when changing to another month
/// [onExpandStateChanged] is of type [ValueChanged<bool>] and it contains a callback function
///     executed when the view changes to expanded or to condensed
/// [onRangeSelected] contains a callback function of type [ValueChanged], that gets called on changes
///     of the range (switch to next or previous week or month)
/// [onEventSelected] is of type [ValueChanged<NeatCleanCalendarEvent>] and it contains a callback function
///     executed when an event of the event list is selected
/// [onEventLongPressed] is of type [ValueChanged<NeatCleanCalendarEvent>] and it contains a callback function
///     executed when an event of the event list is long pressed
/// [datePickerType] defines, if the date picker should get displayed and selects its type
///    Choose between datePickerType.hidden, datePickerType.year, datePickerType.date
/// [isExpandable] is a [bool]. With this parameter you can control, if the view can expand from week view
///     to month view. Default is [false].
/// [dayBuilder] can contain a [Widget]. If this property is not null (!= null), this widget will get used to
///     render the calenar tiles (so you can customize the view)
/// [eventListBuilder] can optionally contain a [Widget] that gets used to render the event list
/// [hideArrows] is a bool. When set to [true] the arrows to navigate to the next or previous week/month in the
///     top bar well get suppressed. Default is [false].
/// [hideTodayIcon] is a bool. When set to [true] the dispaly of the Today-Icon (button to navigate to today) in the
///     top bar well get suppressed. Default is [false].
/// [hideBottomBar] at the moment has no function. Default is [false].
/// [events] are of type [Map<DateTime, List<NeatCleanCalendarEvent>>]. This data structure contains the events to display
/// [defaultDayColor] is the color applied to days in the current month, that are not selected.
/// [defaultOutOfMonthDayColor] is the color applied to days outside the current month.
/// [selectedColor] this is the color, applied to the circle on the selected day
/// [selectedTodayColor] is the color, applied to the circle on the selected day, if it is today
/// [todayColor] this is the color of the date of today
/// [todayButtonText] is a [String]. With this property you can set the caption of the today icon (button to navigate to today).
///     If left empty, the calendar will use the string "Today".
/// [allDayEventText] is a [String]. With this property you can set the caption of the all day event. If left empty, the
///     calendar will use the string "All day".
/// [multiDayEndText] is a [String]. With this property you can set the caption of the end of a multi day event. If left empty, the
///    calendar will use the string "End".
/// [eventColor] lets you optionally specify the color of the event (dot). If the [CleanCaendarEvents] property color is not set, the
///     calendar will use this parameter.
/// [eventDoneColor] with this property you can define the color of "done" events, that is events in the past.
/// [initialDate] is of type [DateTime]. It can contain an optional start date. This is the day, that gets initially selected
///     by the calendar. The default is to not set this parameter. Then the calendar uses [DateTime.now()]
/// [isExpanded] is a bool. If is us set to [true], the calendar gets rendered in month view.
/// [weekDays] contains a [List<String>] defining the names of the week days, so that it is possible to name them according
///     to your current locale.
/// [locale] is a [String]. This setting gets used to format dates according to the current locale.
/// [startOnMonday] is a [bool]. This parameter allows the calendar to determine the first day of the week.
/// [dayOfWeekStyle] is a [TextStyle] for styling the text of the weekday names in the top bar.
/// [bottomBarTextStyle] is a [TextStyle], that sets the style of the text in the bottom bar.
/// [bottomBarArrowColor] can set the [Color] of the arrow to expand/compress the calendar in the bottom bar.
/// [bottomBarColor] sets the [Color] of the bottom bar
/// [expandableDateFormat] defines the formatting of the date in the bottom bar
/// [displayMonthTextStyle] is a [TextStyle] for styling the month name in the top bar.
/// [datePickerConfig] is a [DatePickerConfig] object. It contains the configuration of the date picker, if enabled.
/// [showEvents] is a [bool]. This parameter allows the calender to show listed events. Default value is set to [true], but the user can hide the events entirely by setting it to [false]

// The library internnaly will use a Map<DateTime, List<NeatCleanCalendarEvent>> for the events.

class Calendar extends StatefulWidget {
  final ValueChanged<DateTime>? onDateSelected;
  final ValueChanged<DateTime>? onMonthChanged;
  final ValueChanged<bool>? onExpandStateChanged;
  final ValueChanged? onRangeSelected;
  final ValueChanged<NeatCleanCalendarEvent>? onEventSelected;
  final ValueChanged<NeatCleanCalendarEvent>? onEventLongPressed;
  final bool isExpandable;
  final DayBuilder? dayBuilder;
  final EventListBuilder? eventListBuilder;
  final DatePickerType? datePickerType;
  final bool hideArrows;
  final bool hideTodayIcon;
  @Deprecated(
      'Use `eventsList` instead. Will be removed in NeatAndCleanCalendar 0.4.0')
  final Map<DateTime, List<NeatCleanCalendarEvent>>? events;
  final List<NeatCleanCalendarEvent>? eventsList;
  final Color? defaultDayColor;
  final Color? defaultOutOfMonthDayColor;
  final Color? selectedColor;
  final Color? selectedTodayColor;
  final Color? todayColor;
  final String todayButtonText;
  final String allDayEventText;
  final String multiDayEndText;
  final Color? eventColor;
  final Color? eventDoneColor;
  final DateTime? initialDate;
  final bool isExpanded;
  final List<String> weekDays;
  final String? locale;
  final bool startOnMonday;
  final bool hideBottomBar;
  final TextStyle? dayOfWeekStyle;
  final TextStyle? bottomBarTextStyle;
  final Color? bottomBarArrowColor;
  final Color? bottomBarColor;
  final String? expandableDateFormat;
  final TextStyle? displayMonthTextStyle;
  final DatePickerConfig? datePickerConfig;
  final double? eventTileHeight;
  final bool showEvents;

  /// Configures the date picker if enabled

  Calendar({
    this.onMonthChanged,
    this.onDateSelected,
    this.onRangeSelected,
    this.onExpandStateChanged,
    this.onEventSelected,
    this.onEventLongPressed,
    this.hideBottomBar = false,
    this.isExpandable = false,
    this.events,
    this.eventsList,
    this.dayBuilder,
    this.eventListBuilder,
    this.datePickerType = DatePickerType.hidden,
    this.hideTodayIcon = false,
    this.hideArrows = false,
    this.defaultDayColor,
    this.defaultOutOfMonthDayColor,
    this.selectedColor,
    this.selectedTodayColor,
    this.todayColor,
    this.todayButtonText = 'Today',
    this.allDayEventText = 'All Day',
    this.multiDayEndText = 'End',
    this.eventColor,
    this.eventDoneColor,
    this.initialDate,
    this.isExpanded = false,
    this.weekDays = const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    this.locale = 'en_US',
    this.startOnMonday = false,
    this.dayOfWeekStyle,
    this.bottomBarTextStyle,
    this.bottomBarArrowColor,
    this.bottomBarColor,
    this.expandableDateFormat = 'EEEE MMMM dd, yyyy',
    this.displayMonthTextStyle,
    this.datePickerConfig,
    this.eventTileHeight,
    this.showEvents = true,
  });

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final calendarUtils = Utils();
  late List<DateTime> selectedMonthsDays;
  late Iterable<DateTime> selectedWeekDays;
  late Map<DateTime, List<NeatCleanCalendarEvent>>? eventsMap;
  // selectedDate is the date, that is currently selected. It is highlighted with a circle.
  DateTime _selectedDate = DateTime.now();
  String? currentMonth;
  late bool isExpanded;
  String displayMonth = '';
  DateTime get selectedDate => _selectedDate;
  List<NeatCleanCalendarEvent>? _selectedEvents;

  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;

    _selectedDate = widget.initialDate ?? DateTime.now();
    initializeDateFormatting(widget.locale, null).then((_) => setState(() {
          var monthFormat =
              DateFormat('MMMM yyyy', widget.locale).format(_selectedDate);
          displayMonth =
              '${monthFormat[0].toUpperCase()}${monthFormat.substring(1)}';
        }));
  }

  /// The method [_updateEventsMap] has the purpose to update the eventsMap, when the calendar widget
  /// renders its view. When this method executes, it fills the eventsMap with the contents of the
  /// given eventsList. This can be used to update the events shown by the calendar.
  void _updateEventsMap() {
    eventsMap = widget.events ?? {};
    // If the user provided a list of events, then convert it to a map, but only if there
    // was no map of events provided. To provide the events in form of a map is the way,
    // the library worked before the v0.3.x release. In v0.3.x the possibility to provide
    // the eventsList property was introduced. This simplifies the handaling. In v0.4.0 the
    // property events (the map) will get removed.
    // Here the library checks, if a map was provided. You can not provide a list and a map
    // at the same time. In that case the map will be used, while the list is omitted.
    if (widget.eventsList != null &&
        widget.eventsList!.isNotEmpty &&
        eventsMap!.isEmpty) {
      widget.eventsList!.forEach((event) {
        final int range = event.endTime.difference(event.startTime).inDays;
        // Event starts and ends on the same day.
        if (range == 0) {
          List<NeatCleanCalendarEvent> dateList = eventsMap![DateTime(
                  event.startTime.year,
                  event.startTime.month,
                  event.startTime.day)] ??
              [];
          // Just add the event to the list.
          eventsMap![DateTime(event.startTime.year, event.startTime.month,
              event.startTime.day)] = dateList..add(event);
        } else {
          for (var i = 0; i <= range; i++) {
            List<NeatCleanCalendarEvent> dateList = eventsMap![DateTime(
                    event.startTime.year,
                    event.startTime.month,
                    event.startTime.day + i)] ??
                [];
            // Iteration over the range (diferrence between start and end time in days).
            NeatCleanCalendarEvent newEvent = NeatCleanCalendarEvent(
                event.summary,
                description: event.description,
                location: event.location,
                color: event.color,
                isAllDay: event.isAllDay,
                isDone: event.isDone,
                icon: event.icon,
                // Multi-day events span over several days. They have a start time on the first day
                // and an end time on the last day.  All-day events don't have a start time and end time
                // So if an event ist an all-day event, the multi-day property gets set to false.
                // If the event is not an all-day event, the multi-day property gets set to true, because
                // the difference between
                isMultiDay: event.isAllDay ? false : true,
                // Event spans over several days, but entreis in the list can only cover one
                // day, so the end date of one entry must be on the same day as the start.
                multiDaySegement: MultiDaySegement.first,
                startTime: DateTime(
                    event.startTime.year,
                    event.startTime.month,
                    event.startTime.day + i,
                    event.startTime.hour,
                    event.startTime.minute),
                endTime: DateTime(
                    event.startTime.year,
                    event.startTime.month,
                    event.startTime.day + i,
                    event.endTime.hour,
                    event.endTime.minute));
            if (i == 0) {
              // First day of the event.
              newEvent.multiDaySegement = MultiDaySegement.first;
            } else if (i == range) {
              // Last day of the event.
              newEvent.multiDaySegement = MultiDaySegement.last;
            } else {
              // Middle day of the event.
              newEvent.multiDaySegement = MultiDaySegement.middle;
            }
            eventsMap![DateTime(event.startTime.year, event.startTime.month,
                event.startTime.day + i)] = dateList..add(newEvent);
          }
        }
      });
    }
    selectedMonthsDays = _daysInMonth(_selectedDate);
    selectedWeekDays = Utils.daysInRange(
            _firstDayOfWeek(_selectedDate), _lastDayOfWeek(_selectedDate))
        .toList();

    _selectedEvents = eventsMap?[DateTime(
            _selectedDate.year, _selectedDate.month, _selectedDate.day)] ??
        [];

    print('eventsMap has ${eventsMap?.length} entries');
  }

  Widget get nameAndIconRow {
    var todayIcon;
    var leftArrow;
    var rightArrow;
    var jumpDateIcon;

    if (!widget.hideArrows) {
      leftArrow = PlatformIconButton(
        onPressed: isExpanded ? previousMonth : previousWeek,
        icon: Icon(Icons.chevron_left),
      );
      rightArrow = PlatformIconButton(
        onPressed: isExpanded ? nextMonth : nextWeek,
        icon: Icon(Icons.chevron_right),
      );
    } else {
      leftArrow = Container();
      rightArrow = Container();
    }

    if (!widget.hideTodayIcon) {
      todayIcon = GestureDetector(
        child: Text(widget.todayButtonText),
        onTap: resetToToday,
      );
    } else {
      todayIcon = Container();
    }

    if (widget.datePickerType != null &&
        widget.datePickerType != DatePickerType.hidden) {
      jumpDateIcon = GestureDetector(
        child: Icon(Icons.date_range_outlined),
        onTap: () {
          if (widget.datePickerType == DatePickerType.year) {
            // show year picker
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Select Year"),
                  content: Container(
                    // Need to use container to add size constraint.
                    width: 300,
                    height: 300,
                    child: YearPicker(
                      firstDate: widget.datePickerConfig?.firstDate ??
                          DateTime(DateTime.now().year - 100, 1),
                      lastDate: widget.datePickerConfig?.lastDate ??
                          DateTime(DateTime.now().year + 100, 1),
                      initialDate: widget.datePickerConfig?.initialDate ??
                          DateTime.now(),
                      // save the selected date to _selectedDate DateTime variable.
                      // It's used to set the previous selected date when
                      // re-showing the dialog.
                      selectedDate: _selectedDate,
                      onChanged: (DateTime dateTime) {
                        // close the dialog when year is selected.
                        onJumpToDateSelected(dateTime);
                        Navigator.pop(context);

                        // Do something with the dateTime selected.
                        // Remember that you need to use dateTime.year to get the year
                      },
                    ),
                  ),
                );
              },
            );
          } else if (widget.datePickerType == DatePickerType.date) {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            ).then((date) {
              if (date != null) {
                setState(() {
                  _selectedDate = date;
                  selectedMonthsDays = _daysInMonth(_selectedDate);
                  selectedWeekDays = Utils.daysInRange(
                          _firstDayOfWeek(_selectedDate),
                          _lastDayOfWeek(_selectedDate))
                      .toList();
                  var monthFormat = DateFormat('MMMM yyyy', widget.locale)
                      .format(_selectedDate);
                  displayMonth =
                      '${monthFormat[0].toUpperCase()}${monthFormat.substring(1)}';
                  _selectedEvents = eventsMap?[DateTime(_selectedDate.year,
                          _selectedDate.month, _selectedDate.day)] ??
                      [];
                });
                print('Date chosen: ${_selectedDate.toIso8601String()}');
                onJumpToDateSelected(_selectedDate);
              }
            });
          }
        },
      );
    } else {
      jumpDateIcon = Container();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftArrow ?? Container(),
        Expanded(
          child: Column(
            children: <Widget>[
              todayIcon ?? Container(),
              Text(
                displayMonth,
                style: widget.displayMonthTextStyle ??
                    TextStyle(
                      fontSize: 20.0,
                    ),
              ),
            ],
          ),
        ),
        jumpDateIcon ?? Container(),
        rightArrow ?? Container(),
      ],
    );
  }

  Widget get calendarGridView {
    return Container(
      child: SimpleGestureDetector(
        onSwipeUp: _onSwipeUp,
        onSwipeDown: _onSwipeDown,
        onSwipeLeft: _onSwipeLeft,
        onSwipeRight: _onSwipeRight,
        swipeConfig: SimpleSwipeConfig(
          verticalThreshold: 10.0,
          horizontalThreshold: 40.0,
          swipeDetectionMoment: SwipeDetectionMoment.onUpdate,
        ),
        child: Column(
          children: <Widget>[
            GridView.count(
              childAspectRatio: 1.5,
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 7,
              padding: EdgeInsets.only(bottom: 0.0),
              children: calendarBuilder(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> calendarBuilder() {
    List<Widget> dayWidgets = [];
    List<DateTime> calendarDays =
        isExpanded ? selectedMonthsDays : selectedWeekDays as List<DateTime>;
    widget.weekDays.forEach(
      (day) {
        dayWidgets.add(
          NeatCleanCalendarTile(
            defaultDayColor: widget.defaultDayColor,
            defaultOutOfMonthDayColor: widget.defaultOutOfMonthDayColor,
            selectedColor: widget.selectedColor,
            selectedTodayColor: widget.selectedTodayColor,
            todayColor: widget.todayColor,
            eventColor: widget.eventColor,
            eventDoneColor: widget.eventDoneColor,
            events: eventsMap![day],
            isDayOfWeek: true,
            dayOfWeek: day,
            dayOfWeekStyle: widget.dayOfWeekStyle ??
                TextStyle(
                  color: widget.selectedColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
          ),
        );
      },
    );

    bool monthStarted = false;
    bool monthEnded = false;

    calendarDays.forEach(
      (day) {
        if (day.hour > 0) {
          day = DateFormat("yyyy-MM-dd HH:mm:ssZZZ")
              .parse(day.toString())
              .toLocal();
          day = day.subtract(new Duration(hours: day.hour));
        }

        if (monthStarted && day.day == 01) {
          monthEnded = true;
        }

        if (Utils.isFirstDayOfMonth(day)) {
          monthStarted = true;
        }

        if (this.widget.dayBuilder != null) {
          // Use the dayBuilder widget passed as parameter to render the date tile
          dayWidgets.add(
            NeatCleanCalendarTile(
              defaultDayColor: widget.defaultDayColor,
              defaultOutOfMonthDayColor: widget.defaultOutOfMonthDayColor,
              selectedColor: widget.selectedColor,
              selectedTodayColor: widget.selectedTodayColor,
              todayColor: widget.todayColor,
              eventColor: widget.eventColor,
              eventDoneColor: widget.eventDoneColor,
              events: eventsMap![day],
              child: widget.dayBuilder!(context, day),
              date: day,
              onDateSelected: () => handleSelectedDateAndUserCallback(day),
            ),
          );
        } else {
          dayWidgets.add(
            NeatCleanCalendarTile(
                defaultDayColor: widget.defaultDayColor,
                defaultOutOfMonthDayColor: widget.defaultOutOfMonthDayColor,
                selectedColor: widget.selectedColor,
                selectedTodayColor: widget.selectedTodayColor,
                todayColor: widget.todayColor,
                eventColor: widget.eventColor,
                eventDoneColor: widget.eventDoneColor,
                events: eventsMap![day],
                onDateSelected: () => handleSelectedDateAndUserCallback(day),
                date: day,
                dateStyles: configureDateStyle(monthStarted, monthEnded),
                isSelected: Utils.isSameDay(selectedDate, day),
                inMonth: day.month == selectedDate.month),
          );
        }
      },
    );
    return dayWidgets;
  }

  TextStyle? configureDateStyle(monthStarted, monthEnded) {
    TextStyle? dateStyles;
    final TextStyle? body1Style = Theme.of(context).textTheme.bodyText2;

    if (isExpanded) {
      final TextStyle body1StyleDisabled = body1Style!.copyWith(
          color: Color.fromARGB(
        100,
        body1Style.color!.red,
        body1Style.color!.green,
        body1Style.color!.blue,
      ));

      dateStyles =
          monthStarted && !monthEnded ? body1Style : body1StyleDisabled;
    } else {
      dateStyles = body1Style;
    }
    return dateStyles;
  }

  Widget get expansionButtonRow {
    if (widget.isExpandable) {
      return GestureDetector(
        onTap: toggleExpanded,
        child: Container(
          color: widget.bottomBarColor ?? Color.fromRGBO(200, 200, 200, 0.2),
          height: 40,
          margin: EdgeInsets.only(top: 8.0),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 40.0),
              Text(
                DateFormat(widget.expandableDateFormat, widget.locale)
                    .format(_selectedDate),
                style: widget.bottomBarTextStyle ?? TextStyle(fontSize: 13),
              ),
              PlatformIconButton(
                onPressed: toggleExpanded,
                iconSize: 25.0,
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                icon: isExpanded
                    ? Icon(
                        Icons.arrow_drop_up,
                        color: widget.bottomBarArrowColor ?? Colors.black,
                      )
                    : Icon(
                        Icons.arrow_drop_down,
                        color: widget.bottomBarArrowColor ?? Colors.black,
                      ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget get eventList {
    // If eventListBuilder is provided, use it to build the list of events to show.
    // Otherwise use the default list of events.
    if (widget.eventListBuilder == null) {
      return Expanded(
        child: _selectedEvents != null && _selectedEvents!.isNotEmpty
            // Create a list of events that are occurring on the currently selected day, if there are
            // any. Otherwise, display an empty Container.
            ? ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemBuilder: (BuildContext context, int index) {
                  final NeatCleanCalendarEvent event = _selectedEvents![index];
                  final String start =
                      DateFormat('HH:mm').format(event.startTime).toString();
                  final String end =
                      DateFormat('HH:mm').format(event.endTime).toString();
                  return Container(
                    height: widget.eventTileHeight ??
                        MediaQuery.of(context).size.height * 0.08,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (widget.onEventSelected != null) {
                          widget.onEventSelected!(event);
                        }
                      },
                      onLongPress: () {
                        if (widget.onEventLongPressed != null) {
                          widget.onEventLongPressed!(event);
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: event.wide != null && event.wide! == true
                                ? 25
                                : 5,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: event.color,
                                  borderRadius: BorderRadius.circular(10),
                                  image: event.icon != '' && event.icon != null
                                      ? DecorationImage(
                                          fit: BoxFit.cover,
                                          image: providerImage(event.icon!),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Expanded(
                            flex: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(event.summary,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    event.description,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                          // This Expanded widget gets used to display the start and end time of the
                          // event.
                          Expanded(
                            flex: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // If the event is all day, then display the word "All day" with no time.
                              child: event.isAllDay || event.isMultiDay
                                  ? allOrMultiDayDayTimeWidget(event)
                                  : singleDayTimeWidget(start, end),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _selectedEvents!.length,
              )
            : Container(),
      );
    } else {
      // eventListBuilder is not null
      return widget.eventListBuilder!(context, _selectedEvents!);
    }
  }

  Column singleDayTimeWidget(String start, String end) {
    print('SingleDayEvent');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(start, style: Theme.of(context).textTheme.bodyText1),
        Text(end, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }

  Column allOrMultiDayDayTimeWidget(NeatCleanCalendarEvent event) {
    print('=== Summary: ${event.summary}');
    String start = DateFormat('HH:mm').format(event.startTime).toString();
    String end = DateFormat('HH:mm').format(event.endTime).toString();
    if (event.isAllDay) {
      print('AllDayEvent - ${event.summary}');
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.allDayEventText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      );
    }
    if (event.multiDaySegement == MultiDaySegement.first) {
      // The event begins on the selcted day.
      // Just show the start time, no end time.
      print('MultiDayEvent: start - ${event.summary}');
      end = '';
    } else if (event.multiDaySegement == MultiDaySegement.last) {
      // The event ends on the selcted day.
      // Just show the end time, no start time.
      print('MultiDayEvent: end - ${event.summary}');
      start = widget.multiDayEndText;
    } else {
      // The event spans multiple days.
      print('MultiDayEvent: middle - ${event.summary}');
      start = widget.allDayEventText;
      end = '';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(start, style: Theme.of(context).textTheme.bodyText1),
        Text(end, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _updateEventsMap();

    // If _selectedEvents is not null, then we sort the events by isAllDay propeerty, so that
    // all day events are displayed at the top of the list.
    // Slightly inexxficient, to do this sort each time, the widget builds.
    if (_selectedEvents?.isNotEmpty == true) {
      _selectedEvents!.sort((a, b) {
        if (a.isAllDay == b.isAllDay) {
          return 0;
        }
        if (a.isAllDay) {
          return -1;
        }
        return 1;
      });
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          nameAndIconRow,
          ExpansionCrossFade(
            collapsed: calendarGridView,
            expanded: calendarGridView,
            isExpanded: isExpanded,
          ),
          expansionButtonRow,
          if (widget.showEvents) eventList
        ],
      ),
    );
  }

  /// The function [resetToToday] is called on tap on the Today button in the top
  /// position of the screen. It re-caclulates the range of dates, so that the
  /// month view or week view changes to a range containing the current day.
  void resetToToday() {
    onJumpToDateSelected(DateTime.now());
  }

  /// The function [nextMonth] sets _selectedDate to the first day of the next month.
  void nextMonth() {
    setState(() {
      _selectedDate = Utils.nextMonth(_selectedDate);
      var firstDateOfNewMonth = Utils.firstDayOfMonth(_selectedDate);
      var lastDateOfNewMonth = Utils.lastDayOfMonth(_selectedDate);
      updateSelectedRange(firstDateOfNewMonth, lastDateOfNewMonth);
      selectedMonthsDays = _daysInMonth(_selectedDate);
      var monthFormat =
          DateFormat('MMMM yyyy', widget.locale).format(_selectedDate);
      displayMonth =
          '${monthFormat[0].toUpperCase()}${monthFormat.substring(1)}';
      _selectedEvents = eventsMap?[DateTime(
              _selectedDate.year, _selectedDate.month, _selectedDate.day)] ??
          [];
    });
  }

  /// The function [nextMonth] sets _selectedDate to the first day of the previous month.
  void previousMonth() {
    setState(() {
      _selectedDate = Utils.previousMonth(_selectedDate);
      var firstDateOfNewMonth = Utils.firstDayOfMonth(_selectedDate);
      var lastDateOfNewMonth = Utils.lastDayOfMonth(_selectedDate);
      updateSelectedRange(firstDateOfNewMonth, lastDateOfNewMonth);
      selectedMonthsDays = _daysInMonth(_selectedDate);
      var monthFormat =
          DateFormat('MMMM yyyy', widget.locale).format(_selectedDate);
      displayMonth =
          '${monthFormat[0].toUpperCase()}${monthFormat.substring(1)}';
      _selectedEvents = eventsMap?[DateTime(
              _selectedDate.year, _selectedDate.month, _selectedDate.day)] ??
          [];
    });
  }

  void nextWeek() {
    setState(() {
      _selectedDate = Utils.nextWeek(_selectedDate);
      var firstDayOfCurrentWeek = _firstDayOfWeek(_selectedDate);
      var lastDayOfCurrentWeek = _lastDayOfWeek(_selectedDate);
      updateSelectedRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek);
      selectedWeekDays =
          Utils.daysInRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek)
              .toList();
      var monthFormat =
          DateFormat('MMMM yyyy', widget.locale).format(_selectedDate);
      displayMonth =
          '${monthFormat[0].toUpperCase()}${monthFormat.substring(1)}';
      _selectedEvents = eventsMap?[DateTime(
              _selectedDate.year, _selectedDate.month, _selectedDate.day)] ??
          [];
    });
  }

  void previousWeek() {
    setState(() {
      _selectedDate = Utils.previousWeek(_selectedDate);
      var firstDayOfCurrentWeek = _firstDayOfWeek(_selectedDate);
      var lastDayOfCurrentWeek = _lastDayOfWeek(_selectedDate);
      updateSelectedRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek);
      selectedWeekDays =
          Utils.daysInRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek)
              .toList();
      var monthFormat =
          DateFormat('MMMM yyyy', widget.locale).format(_selectedDate);
      displayMonth =
          '${monthFormat[0].toUpperCase()}${monthFormat.substring(1)}';
      _selectedEvents = eventsMap?[DateTime(
              _selectedDate.year, _selectedDate.month, _selectedDate.day)] ??
          [];
    });
  }

  void updateSelectedRange(DateTime start, DateTime end) {
    Range _rangeSelected = Range(start, end);
    if (widget.onRangeSelected != null) {
      widget.onRangeSelected!(_rangeSelected);
    }
  }

  void onJumpToDateSelected(DateTime day) {
    // Fire onDateSelected callback and onMonthChanged callback.
    _launchDateSelectionCallback(day);

    _selectedDate = day;
    var firstDayOfCurrentWeek = _firstDayOfWeek(_selectedDate);
    var lastDayOfCurrentWeek = _lastDayOfWeek(_selectedDate);

    setState(() {
      selectedWeekDays =
          Utils.daysInRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek)
              .toList();
      selectedMonthsDays = _daysInMonth(_selectedDate);
      var monthFormat =
          DateFormat('MMMM yyyy', widget.locale).format(_selectedDate);
      displayMonth =
          '${monthFormat[0].toUpperCase()}${monthFormat.substring(1)}';
      _selectedEvents = eventsMap?[DateTime(
              _selectedDate.year, _selectedDate.month, _selectedDate.day)] ??
          [];
    });

  }

  void _onSwipeUp() {
    if (isExpanded) toggleExpanded();
  }

  void _onSwipeDown() {
    if (!isExpanded) toggleExpanded();
  }

  void _onSwipeRight() {
    if (isExpanded) {
      previousMonth();
    } else {
      previousWeek();
    }
  }

  void _onSwipeLeft() {
    if (isExpanded) {
      nextMonth();
    } else {
      nextWeek();
    }
  }

  void toggleExpanded() {
    if (widget.isExpandable) {
      setState(() => isExpanded = !isExpanded);
      if (widget.onExpandStateChanged != null)
        widget.onExpandStateChanged!(isExpanded);
    }
  }

  void handleSelectedDateAndUserCallback(DateTime day) {
    print('daySelected: $day');
    // Fire onDateSelected callback and onMonthChanged callback.
    _launchDateSelectionCallback(day);

    var firstDayOfCurrentWeek = _firstDayOfWeek(day);
    var lastDayOfCurrentWeek = _lastDayOfWeek(day);
    // Check if the selected day falls into the next month. If this is the case,
    // then we need to additionaly check, if a day in next year was selected.
    if (_selectedDate.month > day.month) {
      // Day in next year selected? Switch to next month.
      if (_selectedDate.year < day.year) {
        nextMonth();
      } else {
        previousMonth();
      }
    }
    // Check if the selected day falls into the last month. If this is the case,
    // then we need to additionaly check, if a day in last year was selected.
    if (_selectedDate.month < day.month) {
      // Day in next last selected? Switch to next month.
      if (_selectedDate.year > day.year) {
        previousMonth();
      } else {
        nextMonth();
      }
    }
    setState(() {
      _selectedDate = day;
      selectedWeekDays =
          Utils.daysInRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek)
              .toList();
      selectedMonthsDays = _daysInMonth(day);
      _selectedEvents = eventsMap?[_selectedDate] ?? [];
    });
  }

  void _launchDateSelectionCallback(DateTime day) {
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(day);
    }
    // Additional conditions: Only if month or year changed, then call the callback.
    // This avoids double executing the callback when selecting a date in the same month.
    if (widget.onMonthChanged != null && day.month != _selectedDate.month ||
        day.year != _selectedDate.year) {
      widget.onMonthChanged!(day);
    }
  }

  _firstDayOfWeek(DateTime date) {
    var day = DateTime.utc(
        _selectedDate.year, _selectedDate.month, _selectedDate.day, 12);
    if (widget.startOnMonday == true) {
      day = day.subtract(Duration(days: day.weekday - 1));
    } else {
      // if the selected day is a Sunday, then it is already the first day of week
      day = day.weekday == 7 ? day : day.subtract(Duration(days: day.weekday));
    }
    return day;
  }

  _lastDayOfWeek(DateTime date) {
    return _firstDayOfWeek(date).add(new Duration(days: 7));
  }

  /// The function [_daysInMonth] takes the parameter [month] (which is of type [DateTime])
  /// and calculates then all the days to be displayed in month view based on it. It returns
  /// all that days in a [List<DateTime].
  List<DateTime> _daysInMonth(DateTime month) {
    var first = Utils.firstDayOfMonth(month);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(
        new Duration(days: daysBefore - (widget.startOnMonday ? 1 : 0)));
    var last = Utils.lastDayOfMonth(month);

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    // Adding an extra day necessary (if week starts on Monday).
    // Otherwise the week with days in next month would always end on Saturdays.
    var lastToDisplay = last
        .add(new Duration(days: daysAfter + (widget.startOnMonday ? 1 : 0)));
    return Utils.daysInRange(firstToDisplay, lastToDisplay).toList();
  }
}

class ExpansionCrossFade extends StatelessWidget {
  final Widget collapsed;
  final Widget expanded;
  final bool isExpanded;

  ExpansionCrossFade(
      {required this.collapsed,
      required this.expanded,
      required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: collapsed,
      secondChild: expanded,
      firstCurve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.decelerate,
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
