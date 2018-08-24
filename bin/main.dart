import 'package:protoshaker/protos/protos.pb.dart' as p;

main() {
  var s = p.Sample()..duration=2;
  print(s.duration);
}