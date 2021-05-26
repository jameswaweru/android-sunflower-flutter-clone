import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetToolBarText extends StatefulWidget {
  final ScrollController scrollController;

  GetToolBarText(this.scrollController);

  @override
  _GetToolBarTextState createState() => _GetToolBarTextState();
}

class _GetToolBarTextState extends State<GetToolBarText> {

  double _offset = 0;

  @override
  initState() {
    super.initState();
    _offset = widget.scrollController.offset;
    widget.scrollController.addListener(_setOffset);
  }

  @override
  dispose() {
    widget.scrollController.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    setState(() {
      _offset = widget.scrollController.offset;
    });
  }


  @override
  Widget build(BuildContext context) {

    //print("zero offset:"+widget.zeroOpacityOffset)
    //print("Heey , check offset:"+_offset.toString());

    return Text("");
  }
}
