//
//  NSObject+JADTools.m
//  PeasLive
//
//  Created by daixingsi on 16/04/2017.
//  Copyright © 2017 NextStep.Inc. All rights reserved.
//

#import "NSObject+JADTools.h"
#import <objc/runtime.h>


@implementation NSObject (JADTools)


- (NSArray<NSString *> *)getAllSubClasses:(id)parentClass {
    
    NSMutableArray *arrayM = [NSMutableArray array];
    Class *classes = NULL;
    int numClasses = objc_getClassList(NULL, 0);
    
    if (numClasses > 0) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        
        
        for (int i = 0; i < numClasses; ++i) {
            
            Class superClass = classes[i];
            
            if (class_getSuperclass(superClass) == [parentClass class]) {
                
                [arrayM addObject:superClass];
            }
            
        }
        
    }
    
    return [arrayM copy];
}

- (UIViewController *)returnResponderViewController:(UIView *)view {
    
    UIResponder *responder = view.nextResponder;
    UIViewController *viewController = nil;
    if (!responder) {
        return nil;
    }
    
    // Using while loop implement
    //    while (responder) {
    //        if ([responder isKindOfClass:[UIViewController class]]) {
    //            viewController = (UIViewController *)responder;
    //            break;
    //        }
    //        else {
    //
    //            view = view.superview;
    //            responder = view.nextResponder;
    //        }
    //    }
    //
    //        return viewController;
    
    // Using Interation implement
    if ([responder isKindOfClass:[UIViewController class]]) {
        viewController = (UIViewController *)responder;
        return viewController;
    }
    else {
        
        return [self returnResponderViewController:view.superview];
    }
    
}
@end
