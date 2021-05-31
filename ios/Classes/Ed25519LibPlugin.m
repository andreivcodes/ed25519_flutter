#import "Ed25519LibPlugin.h"
#if __has_include(<ed25519_lib/ed25519_lib-Swift.h>)
#import <ed25519_lib/ed25519_lib-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ed25519_lib-Swift.h"
#endif

@implementation Ed25519LibPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEd25519LibPlugin registerWithRegistrar:registrar];
}
@end
