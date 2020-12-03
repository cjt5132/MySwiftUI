//
//  SWImageView.m
//  MySwiftinUI
//
//  Created by chenjintao on 2020/12/3.
//

#import "SWImageView.h"

@implementation SWImageView

- (void)addtarget:(id)target select:(SEL)select
{
    _target = target;
    _select = select;
    self.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_target) {
//        [_target performSelector:_select withObject:self];
        [_target performSelector:_select];
    }
}


@end
