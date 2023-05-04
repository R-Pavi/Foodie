// // import 'dart:convert';
// // import 'dart:developer';

// // import 'package:http/http.dart' as http;

// // import 'package:foodie/models/tips.dart';

// // class TipApi {
// //   Future<List<Tip>> getTips() async {
// //     final url = Uri.parse('https://tasty.p.rapidapi.com/tips/list?id=3562&from=0&size=30');

// //     final response = await http.get(
// //       url,
// //       headers: {
// //         'x-rapidapi-key': '8bfbd4eabamsh6042655d9dbc09cp14ad62jsn92d93d57f8df',
// //         'x-rapidapi-host': 'tasty.p.rapidapi.com',
// //       },
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //             log(response.body.toString());

// //       final tipsData = data['results'] as List<dynamic>;
// //       return parseTips(tipsData);
// //     } else {
// //       throw Exception('Failed to fetch tips');
// //     }
// //   }

// //   List<Tip> parseTips(List<dynamic> tipsData) {
// //     final List<Tip> tips = [];

// //     for (final tipData in tipsData) {
// //       final Tip tip = Tip.fromJson(tipData);

// //       tips.add(tip);
// //     }

// //     return tips;
// //   }
// // }

// import 'package:foodie/models/tips.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class TipApi {
//   static const String _baseURL = 'https://tasty.p.rapidapi.com';
//   static const String _apiKey = '8bfbd4eabamsh6042655d9dbc09cp14ad62jsn92d93d57f8df';

//   Future<List<Tip>> getTips() async {
//     final url = Uri.parse('$_baseURL/tips/list?id=3562&from=0&size=30');

//     final response = await http.get(
//       url,
//       headers: {
//         'x-rapidapi-key': _apiKey,
//         'x-rapidapi-host': 'tasty.p.rapidapi.com',
//       },
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final tipsData = data['results'] as List<dynamic>;
//       return parseTips(tipsData);
//     } else {
//       throw Exception('Failed to fetch tips');
//     }
//   }

//   List<Tip> parseTips(List<dynamic> tipsData) {
//     final List<Tip> tips = [];

//     for (final tipData in tipsData) {
//       final Tip tip = Tip.fromJson(tipData);

//       tips.add(tip);
//     }

//     return tips;
//   }
// }

// import 'dart:convert';
// import 'package:foodie/models/tips.dart';
// import 'package:http/http.dart' as http;

// class TipApi {
//   static const _baseUrl = 'https://api.foodie.com/tips';

//   Future<List<Tip>> getTips() async {
//     final response = await http.get(Uri.parse(_baseUrl));

//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       final List<dynamic> results = json['results'];
//       return results.map((json) => Tip.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load tips');
//     }
//   }
// }
