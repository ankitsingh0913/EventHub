import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';
import 'event_details_background.dart';
import 'events_details_content.dart';
class EventDetailsPage extends StatelessWidget {

  final Event event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}
