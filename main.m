#import <Foundation/NSFileHandle.h>
#import <AppKit/NSPasteboard.h>

int main() {
    NSFileHandle *stdin = [NSFileHandle fileHandleWithStandardInput];
    NSString *text = [[NSString alloc] initWithData:[stdin readDataToEndOfFile] encoding:NSUTF8StringEncoding];

    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:text forType:NSPasteboardTypeString];
    [[NSPasteboard generalPasteboard] setString:@"" forType:@"org.nspasteboard.ConcealedType"];
}
