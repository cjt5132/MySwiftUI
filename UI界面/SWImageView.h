//
//  SWImageView.h
//  MySwiftinUI
//
//  Created by chenjintao on 2020/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SWImageView : UIImageView
{
    id _target;
    SEL _select;
}

- (void)addtarget:(id)target select:(SEL)select;

@end

NS_ASSUME_NONNULL_END
