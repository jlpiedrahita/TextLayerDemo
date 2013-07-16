//
//  JLViewController.m
//  TextLayerDemo
//
//  Created by Jose Luis Piedrahita on 7/16/13.
//  Copyright (c) 2013 Jose Luis Piedrahita. All rights reserved.
//

#import "JLViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

#define JL_TEXT @"Vuelo de ida: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris adipiscing sem sed nulla rutrum, id fringilla risus sollicitudin. Vivamus pellentesque faucibus congue. Suspendisse leo urna, interdum ac orci sit amet, accumsan dignissim nunc. Morbi mi risus, interdum ac tempus eget, faucibus id metus. Sed mollis tempor justo faucibus dictum. Sed nulla neque, lobortis ac felis eget, vestibulum placerat erat. Ut tempus enim non mauris euismod, at rutrum justo aliquam. Aliquam erat volutpat."
#define JL_TEXT_MARGIN 20

@implementation JLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// capa
	CATextLayer *textLayer = [CATextLayer layer];
	textLayer.wrapped = YES;
	textLayer.frame = CGRectInset(self.view.bounds, JL_TEXT_MARGIN, JL_TEXT_MARGIN);
	textLayer.contentsScale = [[UIScreen mainScreen] scale];
	
	// atributos
	CTFontRef fontFace = CTFontCreateWithName((__bridge CFStringRef)(@"Helvetica-Bold"), 12.0, NULL);
	NSMutableDictionary *attributes = [@{} mutableCopy];
	attributes[(NSString*)kCTFontAttributeName] = (__bridge id) fontFace;

	// cadena
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:JL_TEXT];
	[string setAttributes:attributes range:NSMakeRange(0, 12)];
	textLayer.string = string;
	
	// bingo
	[self.view.layer addSublayer:textLayer];
}

@end
