import 'package:flutter/material.dart';

class AddPlantFab extends StatefulWidget {

  final double defaultTopMargin;
  //pixels from top where scaling should start
  final double scaleStart ;
  final ScrollController scrollController;

  AddPlantFab({required this.defaultTopMargin , required this.scaleStart, required this.scrollController});


  @override
  _AddPlantFabState createState() => _AddPlantFabState();
}

class _AddPlantFabState extends State<AddPlantFab> {



  @override
  Widget build(BuildContext context) {



    final double scaleEnd = widget.scaleStart / 2;

    double top = widget.defaultTopMargin;
    double scale = 1.0;
    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;
      top -= offset;
      if (offset < widget.defaultTopMargin - widget.scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < widget.defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (widget.defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }



    return new Positioned(
      top: top,
      right: 16.0,
      child: new Transform(
        transform: new Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: new FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () => {},
          child: new Icon(Icons.add , color: Colors.black,),
        ),
      ),
    );
  }
}
