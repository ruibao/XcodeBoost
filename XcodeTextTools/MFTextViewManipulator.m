//
//  MFTextViewManipulator.m
//  XcodeTextTools
//
//  Created by Michaël Fortin on 2014-03-20.
//  Copyright (c) 2014 Michaël Fortin. All rights reserved.
//

#import "MFTextViewManipulator.h"
#import "NSString+XcodeTextTools.h"

@implementation MFTextViewManipulator
{
	__unsafe_unretained NSTextView *_textView;
}

#pragma mark Lifetime

- (id)initWithTextView:(NSTextView *)textView
{
	self = [super init];
	if (self)
	{
		_textView = textView;
	}
	return self;
}

#pragma mark Line Manipulation

- (void)cutLine
{
	[[NSAlert alertWithMessageText:@"Cut Line" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
}

- (void)copyLine
{
	[[NSAlert alertWithMessageText:@"Copy Line" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
}

- (void)pasteLine
{
	[[NSAlert alertWithMessageText:@"Paste Line" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
}

- (void)duplicateLine
{
	[[NSAlert alertWithMessageText:@"Duplicate Line" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
}

- (void)deleteLine
{
	[[NSAlert alertWithMessageText:@"Delete Line" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
}

#pragma mark Highlighting

- (void)highlightSelection
{
	NSTextStorage *textStorage = [_textView textStorage];
	
	if (!textStorage)
	{
		[[NSAlert alertWithMessageText:[NSString stringWithFormat:@"No text storage! TV: %@", _textView] defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
		return;
	}
	
	NSColor *color = [NSColor greenColor];
	
	// TODO: Find selected string(s) (selection can have multiple ranges) and highlight
	//       occurences in a different color for each range
	
	// TODO: Use associated objects to store a text tools info instance to store currently
	//       used colors for highlighting on the NSTextView and more!
	
	// TODO: Implement clearing of highlights
	
	NSString *selection = @"NS";
	NSArray *ranges = [[textStorage string] xctt_rangesOfString:selection];
	
	for (NSValue *rangeValue in ranges)
	{
		NSRange range = [rangeValue rangeValue];
		[textStorage addAttribute:NSBackgroundColorAttributeName value:color range:range];
	}
}

- (void)removeHighlighting
{
	NSTextStorage *textStorage = [_textView textStorage];
	NSRange documentRange = NSMakeRange(0, [[textStorage string] length]);
	
	[textStorage enumerateAttribute:NSBackgroundColorAttributeName inRange:documentRange options:0 usingBlock:^(id value, NSRange range, BOOL *stop)
	{
		[textStorage removeAttribute:NSBackgroundColorAttributeName range:range];
	}];
}

#pragma mark Selection

- (void)expandSelection
{
	// TODO: Expand selection by considering [] and {}
	// TODO: Handle the case where the selection contains [ (for example).
	// [[NSAlert alertWithMessage^^^Text:[NSStri^^^ng stringWithFormat:@"No text storage! TV: %@", _textView] defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
	// Should select [NSAlert ... ] because the matching [ from the left of the selection is the one that closes NSAlert.
	
	[[NSAlert alertWithMessageText:@"Expand Selection" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""] runModal];
}

@end