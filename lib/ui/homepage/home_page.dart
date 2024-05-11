import 'package:flutter/material.dart';
import 'package:local_event/appstate.dart';
import 'package:local_event/style_guide.dart';
import 'package:local_event/ui/event_details/event_details_page.dart';
import 'package:provider/provider.dart';

import '../../model/category.dart';
import '../../model/event.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_page_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackGround(
              screenHeight: MediaQuery.of(context).size.height
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          Text("Local Events", style: fadedTextStyle,),
                          Spacer(),
                          Icon(Icons.person_outline,color: Color(0x99ffffff),size: 30,)
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text("What's Up",style: whiteHeadingTextStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context,appState,_)=>SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              for (final category in categories) CategoryWidget(category: category)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context,appState,_)=>Column(
                            children: <Widget>[
                              for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId)))
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventDetailsPage(event: event),),);
                                  },
                                    child: EventWidget(event: event,))
                            ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
