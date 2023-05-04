// class TipsDetailsScreen extends StatelessWidget {
//   final String? tipBody;
//   final String? authorAvatarUrl;
//   final String? authorName;

//   TipsDetailsScreen({
//     Key? key,
//     this.tipBody,
//     this.authorAvatarUrl,
//     this.authorName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tip Details'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               tipBody ?? '',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(authorAvatarUrl ?? ''),
//                 ),
//                 SizedBox(width: 16.0),
//                 Text(
//                   authorName ?? '',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
