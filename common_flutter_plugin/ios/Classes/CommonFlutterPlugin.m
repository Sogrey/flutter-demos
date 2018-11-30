#import "CommonFlutterPlugin.h"
#import <common_flutter_plugin/common_flutter_plugin-Swift.h>

@implementation CommonFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCommonFlutterPlugin registerWithRegistrar:registrar];
}
@end
