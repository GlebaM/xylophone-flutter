import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Xylophone')),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonPlay(note: '1', color: Colors.red),
              ButtonPlay(note: '2', color: Colors.orange),
              ButtonPlay(note: '3', color: Colors.yellow),
              ButtonPlay(note: '4', color: Colors.green),
              ButtonPlay(note: '5', color: Colors.blue),
              ButtonPlay(note: '6', color: Colors.indigo),
              ButtonPlay(note: '7', color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonPlay extends StatelessWidget {
  const ButtonPlay({
    super.key,
    required this.note,
    required this.color,
  });

  final String note;
  final Color color;

  void playNote() async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$note.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          )),
        ),
        onPressed: playNote,
        child: SizedBox.shrink(),
      ),
    );
  }
}
