import 'package:app_hive/app_hive.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeBodyLeftChild extends StatelessWidget {
  const HomeBodyLeftChild({
    super.key,
    required this.stream,
    //required this.apartmanList,
  });

  final Stream<List<TBLApartment>> stream;
  //final Future<List<TBLApartment>> apartmanList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return StreamBuilder<List<TBLApartment>>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No Data Available');
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth > 600 ? 3 : 1,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ApartmenBodyList(
                      apartment: snapshot.data![index],
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}


// return FutureBuilder(
//           future: apartmanList,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator.adaptive();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Text('No Data Available');
//             } else {
//               return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: constraints.maxWidth > 600 ? 3 : 1,
//                   crossAxisSpacing: 8.0,
//                   mainAxisSpacing: 8.0,
//                 ),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Center(
//                     child: ApartmenBodyList(
//                       apartment: snapshot.data![index],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         );