// import 'package:client/models/order_model.dart';
// import 'package:flutter/material.dart';

// customListItemTwo(
//     {context, title, subtitle, author, publishDate, readDuration}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 10.0),
//     child: SizedBox(
//       height: 100,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           AspectRatio(
//             aspectRatio: 1.0,
//             child: Container(
//               decoration: const BoxDecoration(color: Colors.pink),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           '$title',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Padding(padding: EdgeInsets.only(bottom: 2.0)),
//                         Text(
//                           '$subtitle',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 12.0,
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         Text(
//                           '$author',
//                           style: const TextStyle(
//                             fontSize: 12.0,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         Text(
//                           '$publishDate - $readDuration',
//                           style: const TextStyle(
//                             fontSize: 12.0,
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

// /// This is the stateless widget that the main application instantiates.
// class OrderCardWidget extends StatelessWidget {
//   OrderCardWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(10.0),
//       children: <Widget>[
//         customListItemTwo(
//           context,
//           thumbnail: 'pink',
//           title: 'Flutter 1.0 Launch',
//           subtitle: 'Flutter continues to improve and expand its horizons.'
//               'This text should max out at two lines and clip',
//           author: 'Dash',
//           publishDate: 'Dec 28',
//           readDuration: '5 mins',
//         ),
//       ],
//     );
//   }
// }
