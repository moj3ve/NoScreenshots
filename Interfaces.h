//
//  Interfaces.h
//  FixPhotos
//
//  Created by Tanner Bennett on 2020-04-27
//  Copyright © 2020 Tanner Bennett. All rights reserved.
//

#pragma mark Imports

#import <Photos/Photos.h>

#pragma mark Interfaces

@interface FLEXManager : NSObject
- (void)showExplorer;
- (void)hideExplorer;
- (void)toggleExplorer;
@end

@interface FLEXObjectExplorerFactory : NSObject
+ (UIViewController *)explorerViewControllerForObject:(id)object;
@end

@interface PUOneUpBarsController : NSObject
- (void)_handleTapGestureRecognizer:(id)gesture;
@end

@interface PUOneUpViewController : UIViewController
@property (readonly) PUOneUpBarsController *_barsController;
@end


#pragma mark Macros



#define Alert(TITLE,MSG) [[[UIAlertView alloc] initWithTitle:(TITLE) \
message:(MSG) \
delegate:nil \
cancelButtonTitle:@"OK" \
otherButtonTitles:nil] show];

#define UIAlertController(title, msg) [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:1]
#define UIAlertControllerAddAction(alert, title, stl, code...) [alert addAction:[UIAlertAction actionWithTitle:title style:stl handler:^(id action) code]];
#define UIAlertControllerAddCancel(alert) [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]
#define ShowAlertController(alert, from) [from presentViewController:alert animated:YES completion:nil];
