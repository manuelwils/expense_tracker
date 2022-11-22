import 'package:flutter/cupertino.dart';

class Helper {
  final BuildContext _context;

  Helper(this._context);

  Size getSize() {
    return MediaQuery.of(_context).size;
  }

  bool isLandscape() {
    return MediaQuery.of(_context).orientation == Orientation.landscape;
  }

  bool isPortrait() {
    return MediaQuery.of(_context).orientation == Orientation.portrait;
  }
}
