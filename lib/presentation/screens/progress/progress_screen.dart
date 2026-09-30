import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
           SizedBox(height: 40),
          Text("circular progress indicator"),
           SizedBox(height: 20),
           CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black38,
          ),
           SizedBox(height: 20),
           Text("Controled Progress indicator"), 

           _ControledProgressIndicator()
        ],  
      ),
    );
  }
}

class _ControledProgressIndicator extends StatelessWidget {
  const _ControledProgressIndicator ();

  @override
  Widget build(BuildContext context) {
    // steambuilder emite valores cada cierto tiempo
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 100), (value) {
        return (value * 2)/100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final double progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45, value: progressValue,),
              Expanded(
                child: LinearProgressIndicator(value: progressValue),
              ),
            ],
            
          ),
        );
      }
    );
  }
}