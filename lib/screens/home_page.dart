import 'package:flutter/material.dart';
import 'package:mood_diary_app_flutter/helper/db_helper.dart';
import 'package:mood_diary_app_flutter/helper/mood_data.dart';
import 'package:mood_diary_app_flutter/screens/charts_screen.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mood_diary_app_flutter/widgets/mood_card.dart';
import 'package:mood_diary_app_flutter/widgets/mood_day.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    loader = Provider.of<MoodCard>(context, listen: false).isLoading;
    return loader?
    Center(
      child: CircularProgressIndicator(),
    ):
    Scaffold(
      appBar: AppBar(
        title: Text("Your Moods"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
              icon: Icon(Icons.show_chart),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartsScreen()));
              }
          )
        ],
      ),
      body: FutureBuilder<List>(
        future: DBHelper.getData('user_moods'),
        initialData: List(),
        builder: (context, snapshot){
          return snapshot.hasData?
          ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, int position){
              var imagestring = snapshot.data[position]['actimage'];
              List<String> img = imagestring.split('_');
              List<String> name = snapshot.data[position]['actname'].split('_');
              Provider.of<MoodCard>(context, listen: false).actiname.addAll(name);
              Provider.of<MoodCard>(context, listen: false).data.add(
                  MoodData(
                      moodno: snapshot.data[position]['mood'] == 'Happy'? 1 :
                      snapshot.data[position]['mood'] == 'Sad'? 2 :
                      snapshot.data[position]['mood'] == 'Bored'? 3 :
                      snapshot.data[position]['mood'] == 'Angry'? 4 :
                      snapshot.data[position]['mood'] == 'Shock'? 5 :
                      snapshot.data[position]['mood'] == 'Cool'? 6 :
                      snapshot.data[position]['mood'] == 'High'? 7 :
                      snapshot.data[position]['mood'] == 'Loving'? 8 :
                      snapshot.data[position]['mood'] == 'Scared'? 9 :
                      10,
                      date: snapshot.data[position]['date'],
                      barColor: snapshot.data[position]['mood'] == 'Happy'? charts.ColorUtil.fromDartColor(Colors.blue) :
                      snapshot.data[position]['mood'] == 'Sad'? charts.ColorUtil.fromDartColor(Colors.green) :
                      snapshot.data[position]['mood'] == 'Bored'? charts.ColorUtil.fromDartColor(Colors.teal) :
                      snapshot.data[position]['mood'] == 'Angry'? charts.ColorUtil.fromDartColor(Colors.red) :
                      snapshot.data[position]['mood'] == 'Shock'? charts.ColorUtil.fromDartColor(Colors.yellow) :
                      snapshot.data[position]['mood'] == 'Cool'?  charts.ColorUtil.fromDartColor(Colors.deepOrange):
                      snapshot.data[position]['mood'] == 'High'? charts.ColorUtil.fromDartColor(Colors.purple) :
                      snapshot.data[position]['mood'] == 'Loving'? charts.ColorUtil.fromDartColor(Colors.pink) :
                      snapshot.data[position]['mood'] == 'Scared'? charts.ColorUtil.fromDartColor(Colors.black) :
                      10,
                  )
              );
              return MoodDay(snapshot.data[position]['image'], snapshot.data[position]['datetime'], snapshot.data[position]['mood'], img, name);
            },
          ) :
          Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ) ;
  }
}
