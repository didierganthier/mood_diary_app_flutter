import 'package:flutter/material.dart';
import 'package:mood_diary_app_flutter/helper/db_helper.dart';
import 'package:mood_diary_app_flutter/helper/mood_data.dart';
import 'package:mood_diary_app_flutter/models/activity.dart';

class MoodCard extends ChangeNotifier {
  String datetime;
  String mood;
  List<String> activityName = [];
  List<String> activityImage = [];
  String image;
  String actimage;
  String actname;

  MoodCard({this.actimage, this.actname, this.datetime, this.image, this.mood});

  List items;
  List<MoodData> data = [];
  String date;
  bool isLoading = false;
  List<String> actiname = [];

  void add(Activity act){
    activityImage.add(act.image);
    activityName.add(act.name);
  }

  notifyListeners();

  Future<void> addPlace(
      String datetime,
      String mood,
      String image,
      String actimage,
      String actname,
      String date
      ) async {
        DBHelper.insert('user_moods', {
          'datetime': datetime,
          'mood': mood,
          'image': image,
          'actimage': actimage,
          'actname': actname,
          'date': date
        });
        notifyListeners();
  }

  Future<void> deletePlaces(String datetime) async {
    DBHelper.delete(datetime);
    notifyListeners();
  }
}