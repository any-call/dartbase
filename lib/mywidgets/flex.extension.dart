import 'package:flutter/material.dart';

extension MyFlex on Flex {
  Expanded SetExpand({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }
}
