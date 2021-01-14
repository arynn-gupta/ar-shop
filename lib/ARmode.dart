import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'database.dart';

class ARmode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return arMode();
  }
}

class arMode extends StatefulWidget {
  @override
  _arModeState createState() => _arModeState();
}

class _arModeState extends State<arMode> {
  ArCoreController arCoreController;
  ArCoreNode node;

  void dispose() {
    super.dispose();
    arCoreController.dispose();
  }

  _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addToon(arCoreController);
  }

  _addToon(ArCoreController controller) {
    final node = ArCoreReferenceNode(
      name: product_name[current_product],
      object3DFileName: product_name[current_product]+'.sfb',
      scale: vector.Vector3(.5, .5, .5),
      position: vector.Vector3(0, -1, -1),
      rotation: vector.Vector4(0, 0, 0, 0),
    );
    controller.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableUpdateListener: true,
      ),
    );
  }
}
