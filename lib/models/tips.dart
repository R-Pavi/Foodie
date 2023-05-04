// // class Tip {
// //   final int id;
// //   final String title;
// //   final String description;

// //   Tip({required this.id, required this.title, required this.description});

// //   factory Tip.fromJson(dynamic json) {
// //     return Tip(
// //       id: json['id'],
// //       title: json['title'] as String,
// //       description: json['description'] as String,
// //     );
// //   }

// //   @override
// //   String toString() {
// //     return 'Tip {id: $id, title: $title, description: $description}';
// //   }
// // }

// class Tip {
//   int? count;
//   List<Results>? results;

//   Tip({this.count, this.results});

//   Tip.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add(new Results.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Results {
//   String? authorAvatarUrl;
//   String? authorName;
//   int? authorRating;
//   int? authorUserId;
//   String? authorUsername;
//   int? authorIsVerified;
//   bool? isFlagged;
//   int? recipeId;
//   int? statusId;
//   int? commentId;
//   int? commentCount;
//   String? tipBody;
//   int? tipId;
//   TipPhoto? tipPhoto;
//   int? updatedAt;
//   int? upvotesTotal;

//   Results(
//       {this.authorAvatarUrl,
//       this.authorName,
//       this.authorRating,
//       this.authorUserId,
//       this.authorUsername,
//       this.authorIsVerified,
//       this.isFlagged,
//       this.recipeId,
//       this.statusId,
//       this.commentId,
//       this.commentCount,
//       this.tipBody,
//       this.tipId,
//       this.tipPhoto,
//       this.updatedAt,
//       this.upvotesTotal});

//   Results.fromJson(Map<String, dynamic> json) {
//     authorAvatarUrl = json['author_avatar_url'];
//     authorName = json['author_name'];
//     authorRating = json['author_rating'];
//     authorUserId = json['author_user_id'];
//     authorUsername = json['author_username'];
//     authorIsVerified = json['author_is_verified'];
//     isFlagged = json['is_flagged'];
//     recipeId = json['recipe_id'];
//     statusId = json['status_id'];
//     commentId = json['comment_id'];
//     commentCount = json['comment_count'];
//     tipBody = json['tip_body'];
//     tipId = json['tip_id'];
//     tipPhoto = json['tip_photo'] != null
//         ? new TipPhoto.fromJson(json['tip_photo'])
//         : null;
//     updatedAt = json['updated_at'];
//     upvotesTotal = json['upvotes_total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['author_avatar_url'] = this.authorAvatarUrl;
//     data['author_name'] = this.authorName;
//     data['author_rating'] = this.authorRating;
//     data['author_user_id'] = this.authorUserId;
//     data['author_username'] = this.authorUsername;
//     data['author_is_verified'] = this.authorIsVerified;
//     data['is_flagged'] = this.isFlagged;
//     data['recipe_id'] = this.recipeId;
//     data['status_id'] = this.statusId;
//     data['comment_id'] = this.commentId;
//     data['comment_count'] = this.commentCount;
//     data['tip_body'] = this.tipBody;
//     data['tip_id'] = this.tipId;
//     if (this.tipPhoto != null) {
//       data['tip_photo'] = this.tipPhoto!.toJson();
//     }
//     data['updated_at'] = this.updatedAt;
//     data['upvotes_total'] = this.upvotesTotal;
//     return data;
//   }
// }

// class TipPhoto {
//   int? height;
//   String? url;
//   int? width;

//   TipPhoto({this.height, this.url, this.width});

//   TipPhoto.fromJson(Map<String, dynamic> json) {
//     height = json['height'];
//     url = json['url'];
//     width = json['width'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['height'] = this.height;
//     data['url'] = this.url;
//     data['width'] = this.width;
//     return data;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:foodie/models/tips.api.dart';
// import 'package:foodie/views/tips_detail.dart';

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
//       appBar: AppBar(
//         title: Text('Tips'),
//       ),
//       body: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: _tips.length,
//               itemBuilder: (context, index) {
//                 final Tip = _tips[index];
//                 return ListTile(
//                   title: Text(Tip.tipBody!),
//                   subtitle: Text(Tip.results![0].authorName!),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => TipsDetailsScreen(
//                           tipBody: Tip.tipBody!,
//                           authorAvatarUrl: Tip.results![0].authorAvatarUrl!,
//                           authorName: Tip.results![0].authorName!,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }

