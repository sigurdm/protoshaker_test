import 'package:protoshaker/protos/protos.pb.dart' as p;


class G {
  int a = 0;

  copyWith(void Function(G) updates) {
    print("${updates.runtimeType}");
    updates(this);
    updates(new G());
  }
}

class C extends G {
  int b =0;
  @override
  copyWith(void Function(C) updates) {
    print("C: ${updates.runtimeType}");
    return super.copyWith((g) => updates(g));
  }

}

main() {
  var s = p.Response()..request=p.Request();
  print(s.request);

  C c1 = new C()..copyWith((C c) => c.b++);
  print("${c1.a} ${c1.b}");
}