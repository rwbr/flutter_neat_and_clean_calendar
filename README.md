# flutter_neat_and_clean_calendar

![Repo Card](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/github-repo-card.png)

Simple flutter calendar based on [flutter_clean_calendar](https://github.com/pmcarlos/flutter_clean_calendar) package.
This package offers some extra functionality. It introduced a new **NeatCleanCalendarEvent** object, that gets used as the data component transfered the calendar widget as a parameter. So it is possible now to color the dots in the **Calendartiles** with a color corresponding to the event. 

The event list below the calendar view is generated bei the package. Here the extra data of the **NetCleanCalendarEvent** objects again come into play. 

The package is highly customizable.

![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/screen1.png)
![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/screen2.png)
![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/screen3.png)

## Usage

Embed the 'Calendar' widget in a column. Below the calendar (as the second widget in the Column) place a 'ListView.builder' widget for rendereing the list of events.

### Set dependency

```
dependencies:
  flutter_neat_and_clean_calendar: ^0.2.0+8
```

### Install

```
flutter pub get
```

### Import it

```dart
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
```

### Use it

```dart
Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
          events: _events,
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.pink,
          todayColor: Colors.blue,
          // dayBuilder: (BuildContext context, DateTime day) {
          //   return new Text("!");
          // },
          eventListBuilder: (BuildContext context,
              List<NeatCleanCalendarEvent> _selectesdEvents) {
            return new Text("!");
          },
          eventColor: Colors.grey,
          locale: 'de_DE',
          todayButtonText: 'Heute',
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),
      ),
    );
  }
```

For more details see the **example**.
## Properties

```dart
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
/// [events] are of type [Map<DateTime, List<NeatCleanCalendarEvent>>]. This data structure containes the events to display
/// [selctedColor] this is the color, applied to the circle on the selcted day
/// [todayColor] this is the color of the date of today
/// [todayButtonText] is a [String]. With this property you can set the caption of the today icon (button to navigate to today).
///     If left empty, the calendar will use the string "Today".
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
final ValueChanged<DateTime> onDateSelected;
final ValueChanged<DateTime> onMonthChanged;
final ValueChanged<bool> onExpandStateChanged;
final ValueChanged onRangeSelected;
final ValueChanged<NeatCleanCalendarEvent> onEventSelected;
final bool isExpandable;
final DayBuilder dayBuilder;
final EventListBuilder eventListBuilder;
final bool hideArrows;
final bool hideTodayIcon;
final Map<DateTime, List<NeatCleanCalendarEvent>> events;
final Color selectedColor;
final Color todayColor;
final String todayButtonText;
final Color eventColor;
final Color eventDoneColor;
final DateTime initialDate;
final bool isExpanded;
final List<String> weekDays;
final String locale;
final bool startOnMonday;
final bool hideBottomBar;
final TextStyle dayOfWeekStyle;
final TextStyle bottomBarTextStyle;
final Color bottomBarArrowColor;
final Color bottomBarColor;
final String expandableDateFormat;
```

## Sample event data

The syntax of the event map changed due to the introduction of the 'NeatCleanCalendarEvent' class.

```dart
final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      NeatCleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.blue[700]),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      NeatCleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      NeatCleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };

```

## Examples

### Basic wirget with customized colors

Some colors were cutomized in this example:

```dart
Calendar(
  eventDoneColor: Colors.green,
  selectedColor: Colors.pink,
  todayColor: Colors.blue,
  eventColor: Colors.grey,
)
```

![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/usage1.png)

### Expandable calendar view

```dart
Calendar(
  isExpandable: true;
)
```

![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/usage2.png)
![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/usage3.png)

### Custom day builder


```dart
Calendar(
  // A builder function that renders each calendar tile how you'd like.
  dayBuilder: (BuildContext context, DateTime day) {
      return new Text("!");
  },
)
```

![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/usage4.png)

### Custom event list builder


```dart
Calendar(
  // A builder function that renders the event list
  eventListBuilder: (BuildContext context,
      List<NeatCleanCalendarEvent> _selectesdEvents) {
    return new Text("!");
  },
)
```

![Screenshot](https://github.com/rwbr/flutter_neat_and_clean_calendar/blob/main/img/usage5.png)
