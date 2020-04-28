#line 1 "Tweak.xm"

#import "../includes/BlockDescription.h"
#import "Interfaces.h"

@interface PUOneUpBarsController : NSObject
- (void)_handleTapGestureRecognizer:(id)gesture;
@end

@interface PUOneUpViewController : UIViewController
@property(readonly) PUOneUpBarsController *_barsController;
@end

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class PUOneUpViewController;
@class PXAssetFetcher;
static void (*_logos_orig$_ungrouped$PUOneUpViewController$viewDidAppear$)(
    _LOGOS_SELF_TYPE_NORMAL PUOneUpViewController *_LOGOS_SELF_CONST, SEL,
    BOOL);
static void _logos_method$_ungrouped$PUOneUpViewController$viewDidAppear$(
    _LOGOS_SELF_TYPE_NORMAL PUOneUpViewController *_LOGOS_SELF_CONST, SEL,
    BOOL);
static id (
    *_logos_orig$_ungrouped$PXAssetFetcher$fetchAssetsInAssetCollection$withFilterPredicate$inclusionPredicate$fetchLimit$sortDescriptors$reverseSortOrder$hideHiddenAssets$fetchPropertySets$)(
    _LOGOS_SELF_TYPE_NORMAL PXAssetFetcher *_LOGOS_SELF_CONST, SEL, id, id, id,
    NSUInteger, id, BOOL, BOOL, id);
static id
_logos_method$_ungrouped$PXAssetFetcher$fetchAssetsInAssetCollection$withFilterPredicate$inclusionPredicate$fetchLimit$sortDescriptors$reverseSortOrder$hideHiddenAssets$fetchPropertySets$(
    _LOGOS_SELF_TYPE_NORMAL PXAssetFetcher *_LOGOS_SELF_CONST, SEL, id, id, id,
    NSUInteger, id, BOOL, BOOL, id);

#line 20 "Tweak.xm"

static void _logos_method$_ungrouped$PUOneUpViewController$viewDidAppear$(
    _LOGOS_SELF_TYPE_NORMAL PUOneUpViewController *_LOGOS_SELF_CONST __unused
        self,
    SEL __unused _cmd, BOOL animated) {
  _logos_orig$_ungrouped$PUOneUpViewController$viewDidAppear$(self, _cmd,
                                                              animated);
  [self._barsController _handleTapGestureRecognizer:nil];
}

static id
_logos_method$_ungrouped$PXAssetFetcher$fetchAssetsInAssetCollection$withFilterPredicate$inclusionPredicate$fetchLimit$sortDescriptors$reverseSortOrder$hideHiddenAssets$fetchPropertySets$(
    _LOGOS_SELF_TYPE_NORMAL PXAssetFetcher *_LOGOS_SELF_CONST __unused self,
    SEL __unused _cmd, id c, id filter, id include, NSUInteger limit, id sort,
    BOOL reverse, BOOL hide, id fetch) {
  NSString *message =
      [NSString stringWithFormat:@"%@\n\n%@\n\n%@", @(hide),
                                 [BlockDescription describing:filter],
                                 [BlockDescription describing:include]];
  Alert(@"fetchAssetsInAssetCollection::::", message);
  return _logos_orig$_ungrouped$PXAssetFetcher$fetchAssetsInAssetCollection$withFilterPredicate$inclusionPredicate$fetchLimit$sortDescriptors$reverseSortOrder$hideHiddenAssets$fetchPropertySets$(
      self, _cmd, c, filter, include, limit, sort, reverse, hide, fetch);
}

static __attribute__((constructor)) void _logosLocalInit() {
  {
    Class _logos_class$_ungrouped$PUOneUpViewController =
        objc_getClass("PUOneUpViewController");
    {
      MSHookMessageEx(
          _logos_class$_ungrouped$PUOneUpViewController,
          @selector(viewDidAppear:),
          (IMP)&_logos_method$_ungrouped$PUOneUpViewController$viewDidAppear$,
          (IMP *)&_logos_orig$_ungrouped$PUOneUpViewController$viewDidAppear$);
    }
    Class _logos_class$_ungrouped$PXAssetFetcher =
        objc_getClass("PXAssetFetcher");
    {
      MSHookMessageEx(
          _logos_class$_ungrouped$PXAssetFetcher,
          @selector
          (fetchAssetsInAssetCollection:withFilterPredicate:inclusionPredicate
                                          :fetchLimit:sortDescriptors
                                          :reverseSortOrder:hideHiddenAssets
                                          :fetchPropertySets:),
          (IMP)&_logos_method$_ungrouped$PXAssetFetcher$fetchAssetsInAssetCollection$withFilterPredicate$inclusionPredicate$fetchLimit$sortDescriptors$reverseSortOrder$hideHiddenAssets$fetchPropertySets$,
          (IMP *)&_logos_orig$_ungrouped$PXAssetFetcher$fetchAssetsInAssetCollection$withFilterPredicate$inclusionPredicate$fetchLimit$sortDescriptors$reverseSortOrder$hideHiddenAssets$fetchPropertySets$);
    }
  }
}
#line 38 "Tweak.xm"
