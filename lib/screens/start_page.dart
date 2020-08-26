import 'package:flutter/material.dart';
import 'package:mood_diary_app_flutter/models/activity.dart';
import 'package:mood_diary_app_flutter/models/mood.dart';
import 'package:mood_diary_app_flutter/screens/home_page.dart';
import 'package:mood_diary_app_flutter/widgets/activity_icon.dart';
import 'package:mood_diary_app_flutter/widgets/mood_card.dart';
import 'package:mood_diary_app_flutter/widgets/mood_icon.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  MoodCard moodCard;
  String mood;
  String image;
  String datepicked;
  String timepicked;
  String datetime;
  int currentIndex;
  int ontapcount = 0;

  List<Mood> moods = [
    Mood(moodImage: 'assets/happy.png', name: 'Happy', isSelected: false),
    Mood(moodImage: 'assets/sad.png', name: 'Sad', isSelected: false),
    Mood(moodImage: 'assets/bored.png', name: 'Bored', isSelected: false),
    Mood(moodImage: 'assets/angry.png', name: 'Angry', isSelected: false),
    Mood(moodImage: 'assets/shocked.png', name: 'Shock', isSelected: false),
    Mood(moodImage: 'assets/wink.png', name: 'Cool', isSelected: false),
    Mood(moodImage: 'assets/high.png', name: 'High', isSelected: false),
    Mood(moodImage: 'assets/loving.png', name: 'Loving', isSelected: false),
    Mood(moodImage: 'assets/scared.png', name: 'Scared', isSelected: false),
    Mood(moodImage: 'assets/crying.png', name: 'Crying', isSelected: false),
  ];

  List<Activity> act = [
    Activity('assets/sports.png', 'Sports', false),
    Activity('assets/sleep.png', 'Sleep', false),
    Activity('assets/shop.png', 'Shop', false),
    Activity('assets/relax.png', 'Relax', false),
    Activity('assets/reading.png', 'Read', false),
    Activity('assets/movies.png', 'Movies', false),
    Activity('assets/games.png', 'Gaming', false),
    Activity('assets/friends.png', 'Friends', false),
    Activity('assets/family.png', 'Family', false),
    Activity('assets/gym.png', 'Excercise', false),
    Activity('assets/eat.png', 'Eat', false),
    Activity('assets/heart.png', 'Date', false),
    Activity('assets/clean.png', 'Clean', false),
    Activity('assets/school.png', 'School', false),
    Activity('assets/homework.png', 'Homework', false),
  ];

  Color color = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  String dateOnly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOOD Diary',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: [
            FlatButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
              icon: Icon(Icons.dashboard),
              label: Text('Go to Dashboard'),
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                FlatButton.icon(
                  icon: Icon(Icons.date_range),
                  label: Text('Pick a Date'),
                  onPressed: () => showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030),
                  ).then(
                    (date) {
                      setState(() {
                        datepicked = date.day.toString() +
                            '_' +
                            date.month.toString() +
                            '_' +
                            date.year.toString();
                        dateOnly =
                            date.day.toString() + '/' + date.month.toString();
                      });
                    },
                  ),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.timer),
                  label: Text('Pick a Time'),
                  onPressed: () => showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((time) {
                    setState(() {
                      timepicked = time.format(context).toString();
                    });
                  }),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    child: Icon(Icons.done),
                    onPressed: () {
                      setState(() {
                        datetime = datepicked + '   ' + timepicked;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'WHAT YOU FEELING NOW?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 6,
            ),
            Text('(Tap to Select and Tap again to deselect!)'),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: MoodIcon(
                            image: moods[index].moodImage,
                            name: moods[index].name,
                            color: moods[index].isSelected
                                ? Colors.black
                                : Colors.white),
                        onTap: () {
                          if (ontapcount == 0) {
                            setState(() {
                              mood = moods[index].name;
                              image = moods[index].moodImage;
                              moods[index].isSelected = true;
                              ontapcount++;
                              print(mood);
                            });
                          } else if (moods[index].isSelected) {
                            setState(() {
                              moods[index].isSelected = false;
                              ontapcount = 0;
                            });
                          }
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            Text(
              'WHAT HAVE YOU BEEN DOING?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hold on the activity to select, You can choose multiples',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: act.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: ActivityIcon(
                          act[index].image,
                          act[index].name,
                          act[index].selected ? Colors.black : Colors.white,
                        ),
                        onLongPress: () {
                          if (act[index].selected) {
                            setState(() {
                              act[index].selected = false;
                            });
                          } else {
                            setState(() {
                              act[index].selected = true;
                              Provider.of<MoodCard>(context, listen: false)
                                  .add(act[index]);
                            });
                          }
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            FlatButton.icon(
              onPressed: () {
                setState(() {
                  Provider.of<MoodCard>(context, listen: false).addPlace(
                    datetime,
                    mood,
                    image,
                    Provider.of<MoodCard>(context, listen: false)
                        .activityImage
                        .join('_'),
                    Provider.of<MoodCard>(context, listen: false)
                        .activityName
                        .join('_'),
                    dateOnly,
                  );
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              icon: Icon(Icons.send),
              label: Text(
                'SUBMIT',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
