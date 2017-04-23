//
//  NSObject+JADTools.h
//  PeasLive
//
//  Created by daixingsi on 16/04/2017.
//  Copyright © 2017 NextStep.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (JADTools)

/**
 Get the parent Class‘s all subClasses

 @param parentClass parentClass，if parentClass is nil，subClasses return []
 @return subClasses
 */
- (NSArray<NSString *> *)getAllSubClasses:(id)parentClass;

/**
 Return current responder's controller
 If current responder doesn't controller, return nil, else return responder first viewController

 @param view current view
 @return viewController
 */
- (UIViewController *)returnResponderViewController:(UIView *)view;

@end
