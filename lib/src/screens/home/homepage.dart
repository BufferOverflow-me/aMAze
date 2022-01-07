import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/src/screens/home/components/line_chart.dart';
import 'package:fitness_app/src/theme/values/global_vals.dart';
import 'package:flutter/material.dart';
import 'components/user_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference workouts =
        FirebaseFirestore.instance.collection('list');

    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          decoration: BoxDecoration(
            gradient: myGradient(context),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(150),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UserAppBar(
                  onPressed: () {
                    Navigator.restorablePushNamed(context, '/settings');
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  // TODO: If user clicks this chart, then navigate to the chart page
                  child: RepaintBoundary(
                    child: MyLineChart(),
                  ),
                ),
              ],
            ),
          ),
        ),
        // TODO: A list goes here
        // Here the list will be fetched from the firestore database
        // Db will have data in sub collections
        // Each sub collection will have a list of data
        // Task: Fetch the collections and then fetch the data from the sub collections
        // and then display the data in a list
        const SizedBox(
          height: 16,
        ),
        FutureBuilder<DocumentSnapshot>(
          future: workouts.doc('workout_list').get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            var data = snapshot.data!;
            if (snapshot.connectionState == ConnectionState.done) {
              return Workouts(
                  size: size,
                  workoutNames: data.get('Push')[0]['title'],
                  imageUrl: data.get('Push')[0]['imageUrl'].toString());
            }
            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class Workouts extends StatelessWidget {
  const Workouts({
    Key? key,
    required this.size,
    required this.workoutNames,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;
  final String? workoutNames;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.2),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black,
            ),
            height: size.height * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    workoutNames!,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  height: size.height * 0.12,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                      // image: CachedNetworkImageProvider(imageUrl!),
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
