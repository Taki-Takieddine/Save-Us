import 'package:applicationmemoire/models/admin.dart';
import 'package:applicationmemoire/models/resto.dart';
import 'package:applicationmemoire/models/user.dart';
import 'package:applicationmemoire/models/livreur.dart';
import 'package:applicationmemoire/screen/admin.dart';
import 'package:applicationmemoire/screen/livreur.dart';
import 'package:applicationmemoire/screen/restaurent.dart';
import 'package:applicationmemoire/services/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late final Future userstram;
  late final AuthUser authUser;
  @override
  void initState() {
    authUser = context.read<AuthUser>();
    userstram = getUsersInfo();
    super.initState();
  }

  getUsersInfo() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('idUser', isEqualTo: authUser.uid)
        .get();
    // ignore: unnecessary_null_comparison
    if (snapshot == null) {
      print("error $snapshot");
    } else {
      if (snapshot.docs[0]['type'] == 0) {
        return Admins.fromMap({
          'email': snapshot.docs[0]['email'],
          'type': snapshot.docs[0]['type'],
          'name': snapshot.docs[0]['name'],
          'phoneNumber': snapshot.docs[0]['phoneNumber'],
          'idUser': snapshot.docs[0]['idUser'],
          'wilaya': snapshot.docs[0]['wilaya'],
        }, snapshot.docs[0].id);
      } else if (snapshot.docs[0]['type'] == 1) {
        return Resto.fromMap({
          'email': snapshot.docs[0]['email'],
          'type': snapshot.docs[0]['type'],
          'name': snapshot.docs[0]['name'],
          'phoneNumber': snapshot.docs[0]['phoneNumber'],
          'idUser': snapshot.docs[0]['idUser'],
          'wilaya': snapshot.docs[0]['wilaya'],
          'stars': snapshot.docs[0]['stars'],
          'nomresto': snapshot.docs[0]['nomresto'],
          'nombreDonationTotal': snapshot.docs[0]['nombreDonationTotal'],
          'nombreDonation': snapshot.docs[0]['nombreDonation'],
        }, snapshot.docs[0].id);
      } else if (snapshot.docs[0]['type'] == 2) {
        return Livreurs.fromMap({
          'email': snapshot.docs[0]['email'],
          'type': snapshot.docs[0]['type'],
          'name': snapshot.docs[0]['name'],
          'phoneNumber': snapshot.docs[0]['phoneNumber'],
          'idUser': snapshot.docs[0]['idUser'],
          'wilaya': snapshot.docs[0]['wilaya'],
        }, snapshot.docs[0].id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userstram,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot);

        if (snapshot.hasData && (snapshot.data != null)) {
          if (snapshot.data! is Admins) {
            final Admins admin = snapshot.data! as Admins;

            return Provider<Users>.value(
              value: admin,
              child: Provider.value(
                value: admin,
                child: WillPopScope(
                  onWillPop: () async {
                    final bool a = !await navigatorKey.currentState!.maybePop();
                    return a;
                  },
                  child: Navigator(
                    key: navigatorKey,
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => const Admin(
                          title: '',
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
          if (snapshot.data! is Users) {
            final Users user = snapshot.data! as Users;
            print('current user ${user.id}');
            return Provider<Users>.value(
              value: user,
              child: Provider.value(
                value: user,
                child: WillPopScope(
                  onWillPop: () async {
                    final bool a = !await navigatorKey.currentState!.maybePop();
                    return a;
                  },
                  child: Navigator(
                    key: navigatorKey,
                    onGenerateRoute: (routeSettings) {
                      if (user.type == 1) {
                        return MaterialPageRoute(
                          builder: (context) => const Restaurent(
                            title: '',
                          ),
                        );
                      }
                      if (user.type == 2) {
                        return MaterialPageRoute(
                          builder: (context) => const Livreur(
                            title: '',
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Text('error ${snapshot.error}');
          }
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
