import 'package:flutter/widgets.dart';

const breakpoint = Size(393, 852);

//* Responsividade do app (textos, imagens, containers, alturas, larguras e etc)
extension Sizer on num {
  double get width {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    Size sizer = window.physicalSize / window.devicePixelRatio;
    return this * (sizer.width / breakpoint.width);
  }

  double get height {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    Size sizer = window.physicalSize / window.devicePixelRatio;
    return this * (sizer.height / breakpoint.height);
  }

  double get sp {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    Size sizer = window.physicalSize / window.devicePixelRatio;
    return this * (sizer.width / breakpoint.width);
  }
}
