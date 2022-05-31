import 'package:applicationmemoire/models/resto.dart';
import 'package:applicationmemoire/models/sac.dart';
import 'package:applicationmemoire/models/signalement.dart';

class Livraison {
  Livraison({
    required this.signalement,
    required this.resto,
    required this.sacList,
    required this.dest,
  });

  final Signalement signalement;
  final Resto resto;
  final double dest;
  final List<Sac> sacList;
  @override
  String toString() {
    print('${resto.id} ${signalement.id} $dest ${signalement.sdfNumber} ${sacList.length}');
    return super.toString();
  }
}
