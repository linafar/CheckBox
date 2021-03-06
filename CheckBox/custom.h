//
//  custom.h
//  BlockTest
//
//  Created by imac on 16/8/9.
//  Copyright © 2016年 imac. All rights reserved.
//

#ifndef custom_h
#define custom_h
#define WK(weakSelf) \
__block __weak __typeof(&*self)weakSelf = self;
//resource path
#define __kWidth [[UIScreen mainScreen]bounds].size.width
#define __kHeight [[UIScreen mainScreen]bounds].size.height
#define CGRectOrigin(v)    v.frame.origin
#define CGRectSize(v)      v.frame.size
#define CGRectX(v)         CGRectOrigin(v).x
#define CGRectY(v)         CGRectOrigin(v).y
#define CGRectW(v)         CGRectSize(v).width
#define CGRectH(v)         CGRectSize(v).height

#define CGRectXW(v)         (CGRectSize(v).width+CGRectOrigin(v).x)
#define CGRectYH(v)         (CGRectSize(v).height+CGRectOrigin(v).y)
#define MFont(font)   [UIFont systemFontOfSize:(font)]
#define BFont(font)   [UIFont boldSystemFontOfSize:(font)]
//button
# define BtnNormal            UIControlStateNormal
# define BtnTouchUpInside     UIControlEventTouchUpInside
# define BtnStateSelected     UIControlStateSelected
# define BtnHighlighted       UIControlStateHighlighted

#endif /* custom_h */
