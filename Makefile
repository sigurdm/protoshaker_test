DART_SDK=${HOME}/projects/dart-sdk/sdk
GEN_KERNEL=${DART_SDK}/pkg/vm/bin/gen_kernel.dart
DUMP_KERNEL=${DART_SDK}/pkg/vm/bin/dump_kernel.dart
TRANSFORM=${DART_SDK}/pkg/kernel/bin/transform.dart
VM_PLATFORM=${DART_SDK}/tools/sdks/dart-sdk/lib/_internal/vm_platform_strong.dill

lib/protos/protos.pb.dart: protos/protos.proto ../dart-protoc-plugin/**
	protoc --dart_out=lib/ $< 

out/main.dart.dill : bin/main.dart lib/protos/protos.pb.dart .packages
	dart ${GEN_KERNEL} --packages=.packages  --platform=${VM_PLATFORM} --output=$@ $<

%.transformed.dill : %.dill
	dart ${TRANSFORM} -f bin -t treeshake -o $@ $<

%.dill.txt : %.dill
	dart ${DUMP_KERNEL} $< $@
