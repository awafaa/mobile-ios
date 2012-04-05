//
//  SHKCustomFormFieldCell.m
//  ShareKit
//
//  Created by Nathan Weiner on 6/28/10.

//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//

#import "SHKCustomFormFieldCell.h"


@implementation SHKCustomFormFieldCell

// See http://getsharekit.com/customize/ for additional information on customizing

- (UITextField *)getTextField
{
    UITextField *text = [super getTextField];
    text.textColor = UIColorFromRGB(0xE6501E);
	return text;
}

- (void)layoutSubviews 
{
	[super layoutSubviews];	
    if (settings.type == SHKFormFieldTypeSwitch){
        if([self.toggle respondsToSelector:@selector(setOnTintColor:)]){
            //iOS 5.0
            [self.toggle setOnTintColor:[UIColor redColor]];
        }
	}
}

@end
