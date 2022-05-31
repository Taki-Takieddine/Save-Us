import 'package:applicationmemoire/models/resto.dart';
import 'package:applicationmemoire/models/signalement.dart';

class Livraison {
  Livraison(
      {required this.signalement, required this.resto, required this.dest});

  final Signalement signalement;
  final Resto resto;
  final double dest;

  @override
  String toString() {
    print('${resto.id} ${signalement.id} $dest');
    return super.toString();
  }
}
