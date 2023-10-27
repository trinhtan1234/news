import 'package:flutter/material.dart';

class ScreenYourNews extends StatefulWidget {
  const ScreenYourNews({super.key});

  @override
  State<ScreenYourNews> createState() => _ScreenYourNewsState();
}

class _ScreenYourNewsState extends State<ScreenYourNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tin tiếng việt'),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:news/home/bloc/news_bloc.dart';
// import 'package:news/home/networking/models/model_yournews.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:skeletons/skeletons.dart';

// class ScreenYourNews extends StatefulWidget {
//   const ScreenYourNews({Key? key}) : super(key: key);

//   @override
//   State<ScreenYourNews> createState() => _ScreenYourNewsState();
// }

// class _ScreenYourNewsState extends State<ScreenYourNews> {
//   final NewsBloc _newBloc = NewsBloc();
//   final RefreshController _refreshController =
//       RefreshController(initialRefresh: false);
//   @override
//   void initState() {
//     loadData();
//     super.initState();
//   }

//   void loadData() async {
//     _newBloc.getListYourNew();
//   }

//   void _onRefresh() {
//     Future.delayed(const Duration(milliseconds: 1000));
//     _refreshController.refreshCompleted();
//   }

//   void _onLoading() {
//     Future.delayed(const Duration(milliseconds: 1000));
//   }

//   @override
//   void dispose() {
//     _newBloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextButton(
//           onPressed: () {},
//           child: const Text(
//             'Tin tiếng việt',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.newspaper_outlined),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: const Row(
//               children: [
//                 Text('Tuỳ chọn'),
//                 Icon(Icons.menu_sharp),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Center(
//           child: StreamBuilder<List<ModelYourNews>?>(
//             stream: _newBloc.newsYourStream,
//             // initialData: initialData,
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Column(
//                   children: [
//                     SkeletonLine(
//                       style: SkeletonLineStyle(height: 20, width: 160),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     SkeletonLine(
//                       style: SkeletonLineStyle(height: 150),
//                     ),
//                     SkeletonLine(
//                       style: SkeletonLineStyle(height: 40),
//                     )
//                   ],
//                 );
//               }
//               final newsData = snapshot.data;
//               final listNews = newsData ?? [];
//               return SmartRefresher(
//                 enablePullDown: true,
//                 enablePullUp: true,
//                 header: const ClassicHeader(
//                   idleText: '',
//                   releaseText: '',
//                   refreshingText: '',
//                   completeText: '',
//                 ),
//                 controller: _refreshController,
//                 onRefresh: _onRefresh,
//                 onLoading: _onLoading,
//                 child: ListView.builder(
//                   itemCount: listNews.length,
//                   itemBuilder: ((context, index) {
//                     String? imageURL = listNews[index].imageTieuDe;
//                     return Column(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(right: 10, left: 10),
//                           child: Column(
//                             children: [
//                               const Divider(),
//                               Row(
//                                 children: [
//                                   // Flexible(
//                                   //   child: Text(
//                                   //     '${listNews[index].tieuDe}',
//                                   //     style: const TextStyle(
//                                   //       fontWeight: FontWeight.bold,
//                                   //       fontSize: 20,
//                                   //     ),
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                               const Padding(padding: EdgeInsets.only(top: 10)),
//                               Row(
//                                 children: [
//                                   // Flexible(
//                                   //   child: Text.rich(
//                                   //     TextSpan(
//                                   //       children: <InlineSpan>[
//                                   //         TextSpan(
//                                   //           text:
//                                   //               '${listNews[index].tinhThanhPho}: ',
//                                   //         ),
//                                   //         TextSpan(
//                                   //           text: '${listNews[index].content}',
//                                   //         ),
//                                   //       ],
//                                   //     ),
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                               const Padding(padding: EdgeInsets.only(top: 10)),
//                               if (imageURL != null && imageURL.isNotEmpty)
//                                 // SizedBox(
//                                 //   width: MediaQuery.of(context).size.width - 20,
//                                 //   child: ClipRect(
//                                 //     child: AspectRatio(
//                                 //       aspectRatio: 16 / 9,
//                                 //       child: Image(
//                                 //         image: NetworkImage(imageURL),
//                                 //         fit: BoxFit.cover,
//                                 //         // width: MediaQuery.of(context).size -20,
//                                 //       ),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 Row(
//                                   children: [
//                                     // Expanded(
//                                     //   child: Row(
//                                     //     children: [
//                                     //       TextButton(
//                                     //         onPressed: () {},
//                                     //         child: Text(
//                                     //             listNews[index].thoiGian ?? ''),
//                                     //       ),
//                                     //       TextButton(
//                                     //         onPressed: () {},
//                                     //         child:
//                                     //             Text(listNews[index].chuDe ?? ''),
//                                     //       )
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                     Row(
//                                       children: [
//                                         // IconButton(
//                                         //   onPressed: () {},
//                                         //   icon: Row(
//                                         //     children: [
//                                         //       const Icon(Icons.message_outlined),
//                                         //       const Padding(
//                                         //           padding:
//                                         //               EdgeInsets.only(right: 5)),
//                                         //       Text(
//                                         //         listNews[index].soNguoiDaDoc ??
//                                         //             '',
//                                         //         style: const TextStyle(
//                                         //           color: Colors.red,
//                                         //         ),
//                                         //       )
//                                         //     ],
//                                         //   ),
//                                         // ),
//                                         // IconButton(
//                                         //   onPressed: () {},
//                                         //   icon: const Icon(
//                                         //       Icons.watch_later_outlined),
//                                         // )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
