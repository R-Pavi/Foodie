// import 'package:flutter/material.dart';
// import 'package:foodie/models/tips.dart';
// import 'package:foodie/models/tips.api.dart';

// class TipsScreen extends StatefulWidget {
//   @override
//   _TipsScreenState createState() => _TipsScreenState();
// }

// class _TipsScreenState extends State<TipsScreen> {
//   late List<Tip> _tips;
//   late bool _isLoading;

//   @override
//   void initState() {
//     super.initState();
//     _isLoading = true;
//     _loadTips();
//   }

//   void _loadTips() async {
//     final api = TipApi();
//     final tips = await api.getTips();

//     setState(() {
//       _tips = tips;
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Tips'),
//         ),
//         body: _isLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView.builder(
//                 itemCount: _tips.length,
//                 itemBuilder: (context, index) {
//                   final Tip = _tips[index];
//                   return ListTile(
//                     title: Text(Tip.tipBody ?? ''),
//                     subtitle: Text(Tip.authorName ?? ''),
//                     onTap: () {
//                       Navigator.pushNamed(
//                         context,
//                         '/tips_details',
//                         arguments: {
//                           'tipBody': Tip.tipBody,
//                           'authorAvatarUrl': Tip.authorAvatarUrl,
//                           'authorName': Tip.authorName,
//                         },
//                       );
//                     },
//                   );
//                 }));
//   }
// }


import 'package:flutter/material.dart';




class TipsDetailsScreen extends StatelessWidget {
  final String tipBody;
  final String authorAvatarUrl;
  final String authorName;

  TipsDetailsScreen({
    required this.tipBody,
    required this.authorAvatarUrl,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              tipBody,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(authorAvatarUrl),
                ),
                SizedBox(width: 8.0),
                Text(authorName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




