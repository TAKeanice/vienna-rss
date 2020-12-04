//
//  ArticleTests.m
//  Vienna
//
//  Copyright © 2016 uk.co.opencommunity. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Article.h"
#import "ArticleView.h"

static NSString * const GUID = @"07f446d2-8d6b-4d99-b488-cebc9eac7c33";
static NSString * const Author = @"Author McAuthorface";
static NSString * const Title = @"Lorem ipsum dolor sit amet";
static NSString * const Link = @"http://www.vienna-rss.com";
static NSString * const Enclosure = @"http://vienna-rss.sourceforge.net/img/vienna_logo.png";
static NSString * const EnclosureFilename = @"vienna_logo.png"; // last path component of Enclosure
static NSString * const Body =
    @"<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus "
    "et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, "
    "ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper."
    "<em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet "
    "est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo "
    "vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, "
    "eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. "
    "<a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>";


@interface ArticleTests : XCTestCase

@property (nonatomic, strong) Article *article;

@end

@implementation ArticleTests

- (void)setUp
{
    [super setUp];

    self.article = [[Article alloc] initWithGuid:GUID];
}

#pragma mark - Test custom setters

- (void)testRandomCompatibilityKeyPath
{
    NSString *randomArticleDataKeyPath = [@"articleData." stringByAppendingString:@"dummyProperty"];

    XCTAssertThrowsSpecificNamed([self.article valueForKeyPath:randomArticleDataKeyPath],
                                 NSException,
                                 NSUndefinedKeyException);
}

- (void)testRandomKeyPath
{
    NSString *randomKeyPath = @"dummyProperty";

    XCTAssertThrowsSpecificNamed([self.article valueForKeyPath:randomKeyPath],
                                 NSException,
                                 NSUndefinedKeyException);
}

@end
