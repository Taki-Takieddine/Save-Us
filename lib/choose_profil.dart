import 'package:flutter/material.dart';

import 'package:applicationmemoire/auth/login.dart';

class ChooseProfil extends StatefulWidget {
  const ChooseProfil({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChooseProfil> createState() => _ChooseProfilState();
}

class _ChooseProfilState extends State<ChooseProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Color.fromARGB(255, 217, 47, 247),
                Color.fromARGB(255, 53, 119, 174),
                Color.fromARGB(255, 109, 189, 112)
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              BouttonProfil(
                icon: Icons.favorite,
              ),
              BouttonProfil(
                icon: Icons.call,
              ),
              BouttonProfil(
                icon: Icons.access_alarm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BouttonProfil extends StatelessWidget {
  final IconData icon;
  const BouttonProfil({Key? key, required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const LogIn())));
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.transparent.withOpacity(0.15),
        ),
        height: 150,
        width: 150,
        child: Icon(
          icon,
          color: Colors.white,
          size: 65,
        ),
      ),
    );
  }
}
