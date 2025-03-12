import 'package:flutter/material.dart';
void main() {
  runApp(PointsCounterApp());
}
class PointsCounterApp extends StatefulWidget {
  @override
  _PointsCounterAppState createState() => _PointsCounterAppState();
}
class _PointsCounterAppState extends State<PointsCounterApp> {
  int teamAScore = 0;
  int teamBScore = 0;
  void addPoints(int points, String team) {
    setState(() {
      if (team == "A") {
        teamAScore += points;
      } else {
        teamBScore += points;
      }
    });
  }
  void resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Points Counter"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTeamColumn("Team A", teamAScore, "A"),
                buildTeamColumn("Team B", teamBScore, "B"),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: resetScores,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text("Reset", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTeamColumn(String teamName, int score, String team) {
    return Column(
      children: [
        Text(teamName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("$score", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        buildPointButton("Add 1 Point", 1, team),
        buildPointButton("Add 2 Point", 2, team),
        buildPointButton("Add 3 Point", 3, team),
      ],
    );
  }
  Widget buildPointButton(String label, int points, String team) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () => addPoints(points, team),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(label, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
