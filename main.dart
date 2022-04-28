// Pick User tap location using gesture detector
return GestureDetector(){
  onTapUp: (TapUpDetails details) =>
                          onTapDown(context, details),
  onTapDown: (TapDownDetails details,) =>
                          onTapDown(context, details),
  //child:.....
};

void onTapDown(BuildContext context, details) {
    print('${details.globalPosition}');
    final RenderObject? box = context.findRenderObject();
    if (box is RenderBox) {
      final Offset localOffset = box.globalToLocal(details.globalPosition);
      setState(() {
        posx = localOffset.dx;
        posy = localOffset.dy;
      });
      print('offset= $localOffset');
      print(posx);
      print(posy);
    }
  }

  //Perform Taps using your code without user interaction

  WidgetsBinding.instance!.handlePointerEvent( PointerDownEvent(
                                    pointer: 0, position: Offset(posx, posy)))
  WidgetsBinding.instance!.handlePointerEvent(PointerUpEvent(
                              pointer: 0, position: Offset(posx, posy),