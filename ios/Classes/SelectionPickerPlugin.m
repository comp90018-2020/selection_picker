#import "SelectionPickerPlugin.h"
#if __has_include(<selection_picker/selection_picker-Swift.h>)
#import <selection_picker/selection_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "selection_picker-Swift.h"
#endif

@implementation SelectionPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSelectionPickerPlugin registerWithRegistrar:registrar];
}
@end
