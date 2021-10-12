// import 'package:catatan_keuangan/app/modules/home/controllers/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DragableFloatingButton extends GetView<HomeController> {
//   const DragableFloatingButton({
//     Key? key,
//     required this.child,
//     required this.initialOffset,
//     required this.onPressed,
//   }) : super(key: key);

//   final Widget child;
//   final Offset initialOffset;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       init: Get.put(HomeController()),
//       builder: (_) {
//         return Positioned(
//           left: controller.newOffsetX.value,
//           right: controller.newOffsetY.value,
//           child: Listener(
//             onPointerMove: (event) {
//               controller.updatePosition(event);
//               print(controller.isDragging.value);
//               controller.isDragging.value = true;
//               print(controller.isDragging.value);
//             },
//             onPointerUp: (event) {
//               print('onPointerUp');

//               if (controller.isDragging.value) {
//                 controller.isDragging.value = false;
//               } else {
//                 onPressed;
//               }
//             },
//             child: Container(
//               child: child,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
