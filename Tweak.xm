//
//  Tweak.xm
//  NoScreenshots
//
//  Created by Tanner Bennett on 2020-04-27
//  Copyright © 2020 Tanner Bennett. All rights reserved.
//

#import "Interfaces.h"

#define PHAssetCollectionSubtypeAllPhotosTab 1000000205
#define PHAssetMediaSubtypeVideoScreenRecording 0x80000

%hook PUOneUpViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;
    [self._barsController _handleTapGestureRecognizer:nil];
}
%end

// Whether the given collection should be filtered
#define PHCollectionShouldFilter(collection) ( \
    collection.assetCollectionSubtype == PHAssetCollectionSubtypeAllPhotosTab \
)

void PHHookFetch(SEL _cmd, PHAssetCollection *assetCollection, PHFetchOptions *options) {
    if (PHCollectionShouldFilter(assetCollection)) {
        // Build predicate to exclude screenshots and screen recordings
        NSPredicate *filterSmartTypes = [NSPredicate predicateWithFormat:
            @"(mediaSubtypes & %d) == 0 AND (mediaSubtypes & %d) == 0",
            PHAssetMediaSubtypePhotoScreenshot, PHAssetMediaSubtypeVideoScreenRecording
        ];

        // AND our predicate with any existing predicate
        options.predicate = !options.predicate ? filterSmartTypes : [NSCompoundPredicate
            andPredicateWithSubpredicates:@[options.predicate, filterSmartTypes]
        ];
    }
}

%hook PHAsset

+ (PHFetchResult<PHAsset *> *)fetchAssetsInAssetCollection:(PHAssetCollection *)assetCollection
                                                   options:(PHFetchOptions *)options {
    PHHookFetch(_cmd, assetCollection, options);
    return %orig;
}

+ (PHFetchResult<PHAsset *> *)fetchKeyAssetsInAssetCollection:(PHAssetCollection *)assetCollection
                                                      options:(PHFetchOptions *)options {
    PHHookFetch(_cmd, assetCollection, options);
    return %orig;
}

%end
