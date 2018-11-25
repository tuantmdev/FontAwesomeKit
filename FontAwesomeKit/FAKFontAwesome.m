#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FAKFontAwesome.h"

@interface FAKFontAwesome ()

@property (strong, nonatomic) NSMutableAttributedString *mutableAttributedString;

@end

@implementation FAKFontAwesome

+ (NSString *)fontNameForStyle:(FAKFontAwesomeStyle)style {
    NSString *fontName = @"";
    switch (style) {
        case FAKFontAwesomeStyleRegular:
            fontName = @"FontAwesome5ProRegular";
            break;
        case FAKFontAwesomeStyleLight:
            fontName = @"FontAwesome5ProLight";
            break;
        case FAKFontAwesomeStyleBrands:
            fontName = @"FontAwesome5BrandsRegular";
            break;
        default:
            fontName = @"FontAwesome5ProSolid";
            break;
    }
    return fontName;
}

+ (void)loadFonts {
    [self registerIconFontWithURL:[[NSBundle mainBundle] URLForResource:@"Font Awesome 5 Pro-Solid-900" withExtension:@"otf"]];
    [self registerIconFontWithURL:[[NSBundle mainBundle] URLForResource:@"Font Awesome 5 Pro-Regular-400" withExtension:@"otf"]];
    [self registerIconFontWithURL:[[NSBundle mainBundle] URLForResource:@"Font Awesome 5 Brands-Regular-400" withExtension:@"otf"]];
    [self registerIconFontWithURL:[[NSBundle mainBundle] URLForResource:@"Font Awesome 5 Pro-Light-300" withExtension:@"otf"]];
}

+ (FAKFontAwesomeStyle)styleFromCode:(NSString *)code {
    code = [code lowercaseString];
    if ([code isEqualToString:@"fab"]) {
        return FAKFontAwesomeStyleBrands;
    } else if ([code isEqualToString:@"fal"]) {
        return FAKFontAwesomeStyleLight;
    } else if ([code isEqualToString:@"far"]) {
        return FAKFontAwesomeStyleRegular;
    } else {
        return FAKFontAwesomeStyleSolid;
    }
}

+ (UIFont *)iconFontWithSize:(CGFloat)size {
#ifndef DISABLE_FONTAWESOME_AUTO_REGISTRATION
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self loadFonts];
    });
#endif
    
    UIFont *font = [UIFont fontWithName:@"FontAwesome5ProSolid" size:size];
    NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    return font;
}

+ (UIFont *)iconFontWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style {
#ifndef DISABLE_FONTAWESOME_AUTO_REGISTRATION
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self loadFonts];
    });
#endif
    
    NSString *fontName = [self fontNameForStyle:style];
    UIFont *font = [UIFont fontWithName:fontName size:size];
    NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    return font;
}

+ (instancetype)iconWithCode:(NSString *)code size:(CGFloat)size {
    return [self iconWithCode:code size:size style:FAKFontAwesomeStyleSolid];
}

+ (instancetype)iconWithCode:(NSString *)code size:(CGFloat)size style:(FAKFontAwesomeStyle)style {
    FAKFontAwesome *icon = [[self alloc] init];
    icon.mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:code
                                                                          attributes:@{NSFontAttributeName: [self iconFontWithSize:size
                                                                                                                             style:style]}];
    return icon;
}

+ (instancetype)iconWithIdentifier:(NSString *)identifier size:(CGFloat)size error:(NSError **)error {
    
    // Check if identifier is Font Awesome 5.0.0 format ("fab fa-pinterest")
    NSArray *styles = [identifier componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // Set default values
    NSString *code = identifier;
    FAKFontAwesomeStyle style = FAKFontAwesomeStyleSolid;
    
    if (styles.count == 2) {
        // Font Awesome 5.0.0 format
        style = [self styleFromCode:styles[0]];
        code = styles[1];
    }
    
    NSString *iconCode = [[self allIcons] objectForKey:code];
    
    // If iconCode does not exist, return an error
    if (!iconCode) {
        if (error) {
            NSDictionary *errorDetail = @{ NSLocalizedDescriptionKey: @"Invalid identifier." };
            *error = [NSError errorWithDomain:@"FontAwesomeKit"
                                         code:-100
                                     userInfo:errorDetail];
        }
        return nil;
    }
    return [self iconWithCode:iconCode size:size style:style];
}

// Generated Code
+ (instancetype)fivehundredpxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf26e" size:size style:style]; }
+ (instancetype)abacusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf640" size:size style:style]; }
+ (instancetype)accessibleIconIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf368" size:size style:style]; }
+ (instancetype)accusoftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf369" size:size style:style]; }
+ (instancetype)acornIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ae" size:size style:style]; }
+ (instancetype)acquisitionsIncorporatedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6af" size:size style:style]; }
+ (instancetype)adIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf641" size:size style:style]; }
+ (instancetype)addressBookIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b9" size:size style:style]; }
+ (instancetype)addressCardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2bb" size:size style:style]; }
+ (instancetype)adjustIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf042" size:size style:style]; }
+ (instancetype)adnIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf170" size:size style:style]; }
+ (instancetype)adversalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf36a" size:size style:style]; }
+ (instancetype)affiliatethemeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf36b" size:size style:style]; }
+ (instancetype)airFreshenerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d0" size:size style:style]; }
+ (instancetype)alarmClockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf34e" size:size style:style]; }
+ (instancetype)algoliaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf36c" size:size style:style]; }
+ (instancetype)alicornIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b0" size:size style:style]; }
+ (instancetype)alignCenterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf037" size:size style:style]; }
+ (instancetype)alignJustifyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf039" size:size style:style]; }
+ (instancetype)alignLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf036" size:size style:style]; }
+ (instancetype)alignRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf038" size:size style:style]; }
+ (instancetype)alipayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf642" size:size style:style]; }
+ (instancetype)allergiesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf461" size:size style:style]; }
+ (instancetype)amazonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf270" size:size style:style]; }
+ (instancetype)amazonPayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf42c" size:size style:style]; }
+ (instancetype)ambulanceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0f9" size:size style:style]; }
+ (instancetype)americanSignLanguageInterpretingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a3" size:size style:style]; }
+ (instancetype)amiliaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf36d" size:size style:style]; }
+ (instancetype)analyticsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf643" size:size style:style]; }
+ (instancetype)anchorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf13d" size:size style:style]; }
+ (instancetype)androidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf17b" size:size style:style]; }
+ (instancetype)angellistIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf209" size:size style:style]; }
+ (instancetype)angleDoubleDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf103" size:size style:style]; }
+ (instancetype)angleDoubleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf100" size:size style:style]; }
+ (instancetype)angleDoubleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf101" size:size style:style]; }
+ (instancetype)angleDoubleUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf102" size:size style:style]; }
+ (instancetype)angleDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf107" size:size style:style]; }
+ (instancetype)angleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf104" size:size style:style]; }
+ (instancetype)angleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf105" size:size style:style]; }
+ (instancetype)angleUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf106" size:size style:style]; }
+ (instancetype)angryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf556" size:size style:style]; }
+ (instancetype)angrycreativeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf36e" size:size style:style]; }
+ (instancetype)angularIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf420" size:size style:style]; }
+ (instancetype)ankhIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf644" size:size style:style]; }
+ (instancetype)appStoreIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf36f" size:size style:style]; }
+ (instancetype)appStoreIosIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf370" size:size style:style]; }
+ (instancetype)apperIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf371" size:size style:style]; }
+ (instancetype)appleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf179" size:size style:style]; }
+ (instancetype)appleAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d1" size:size style:style]; }
+ (instancetype)appleCrateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b1" size:size style:style]; }
+ (instancetype)applePayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf415" size:size style:style]; }
+ (instancetype)archiveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf187" size:size style:style]; }
+ (instancetype)archwayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf557" size:size style:style]; }
+ (instancetype)arrowAltCircleDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf358" size:size style:style]; }
+ (instancetype)arrowAltCircleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf359" size:size style:style]; }
+ (instancetype)arrowAltCircleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf35a" size:size style:style]; }
+ (instancetype)arrowAltCircleUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf35b" size:size style:style]; }
+ (instancetype)arrowAltDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf354" size:size style:style]; }
+ (instancetype)arrowAltFromBottomIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf346" size:size style:style]; }
+ (instancetype)arrowAltFromLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf347" size:size style:style]; }
+ (instancetype)arrowAltFromRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf348" size:size style:style]; }
+ (instancetype)arrowAltFromTopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf349" size:size style:style]; }
+ (instancetype)arrowAltLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf355" size:size style:style]; }
+ (instancetype)arrowAltRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf356" size:size style:style]; }
+ (instancetype)arrowAltSquareDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf350" size:size style:style]; }
+ (instancetype)arrowAltSquareLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf351" size:size style:style]; }
+ (instancetype)arrowAltSquareRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf352" size:size style:style]; }
+ (instancetype)arrowAltSquareUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf353" size:size style:style]; }
+ (instancetype)arrowAltToBottomIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf34a" size:size style:style]; }
+ (instancetype)arrowAltToLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf34b" size:size style:style]; }
+ (instancetype)arrowAltToRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf34c" size:size style:style]; }
+ (instancetype)arrowAltToTopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf34d" size:size style:style]; }
+ (instancetype)arrowAltUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf357" size:size style:style]; }
+ (instancetype)arrowCircleDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ab" size:size style:style]; }
+ (instancetype)arrowCircleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a8" size:size style:style]; }
+ (instancetype)arrowCircleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a9" size:size style:style]; }
+ (instancetype)arrowCircleUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0aa" size:size style:style]; }
+ (instancetype)arrowDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf063" size:size style:style]; }
+ (instancetype)arrowFromBottomIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf342" size:size style:style]; }
+ (instancetype)arrowFromLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf343" size:size style:style]; }
+ (instancetype)arrowFromRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf344" size:size style:style]; }
+ (instancetype)arrowFromTopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf345" size:size style:style]; }
+ (instancetype)arrowLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf060" size:size style:style]; }
+ (instancetype)arrowRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf061" size:size style:style]; }
+ (instancetype)arrowSquareDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf339" size:size style:style]; }
+ (instancetype)arrowSquareLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf33a" size:size style:style]; }
+ (instancetype)arrowSquareRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf33b" size:size style:style]; }
+ (instancetype)arrowSquareUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf33c" size:size style:style]; }
+ (instancetype)arrowToBottomIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf33d" size:size style:style]; }
+ (instancetype)arrowToLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf33e" size:size style:style]; }
+ (instancetype)arrowToRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf340" size:size style:style]; }
+ (instancetype)arrowToTopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf341" size:size style:style]; }
+ (instancetype)arrowUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf062" size:size style:style]; }
+ (instancetype)arrowsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf047" size:size style:style]; }
+ (instancetype)arrowsAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0b2" size:size style:style]; }
+ (instancetype)arrowsAltHIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf337" size:size style:style]; }
+ (instancetype)arrowsAltVIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf338" size:size style:style]; }
+ (instancetype)arrowsHIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf07e" size:size style:style]; }
+ (instancetype)arrowsVIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf07d" size:size style:style]; }
+ (instancetype)assistiveListeningSystemsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a2" size:size style:style]; }
+ (instancetype)asteriskIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf069" size:size style:style]; }
+ (instancetype)asymmetrikIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf372" size:size style:style]; }
+ (instancetype)atIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1fa" size:size style:style]; }
+ (instancetype)atlasIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf558" size:size style:style]; }
+ (instancetype)atomIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d2" size:size style:style]; }
+ (instancetype)atomAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d3" size:size style:style]; }
+ (instancetype)audibleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf373" size:size style:style]; }
+ (instancetype)audioDescriptionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf29e" size:size style:style]; }
+ (instancetype)autoprefixerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf41c" size:size style:style]; }
+ (instancetype)avianexIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf374" size:size style:style]; }
+ (instancetype)aviatoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf421" size:size style:style]; }
+ (instancetype)awardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf559" size:size style:style]; }
+ (instancetype)awsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf375" size:size style:style]; }
+ (instancetype)axeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b2" size:size style:style]; }
+ (instancetype)axeBattleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b3" size:size style:style]; }
+ (instancetype)backpackIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d4" size:size style:style]; }
+ (instancetype)backspaceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf55a" size:size style:style]; }
+ (instancetype)backwardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf04a" size:size style:style]; }
+ (instancetype)badgeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf335" size:size style:style]; }
+ (instancetype)badgeCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf336" size:size style:style]; }
+ (instancetype)badgeDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf645" size:size style:style]; }
+ (instancetype)badgePercentIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf646" size:size style:style]; }
+ (instancetype)badgerHoneyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b4" size:size style:style]; }
+ (instancetype)balanceScaleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf24e" size:size style:style]; }
+ (instancetype)balanceScaleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf515" size:size style:style]; }
+ (instancetype)balanceScaleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf516" size:size style:style]; }
+ (instancetype)ballotIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf732" size:size style:style]; }
+ (instancetype)ballotCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf733" size:size style:style]; }
+ (instancetype)banIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf05e" size:size style:style]; }
+ (instancetype)bandAidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf462" size:size style:style]; }
+ (instancetype)bandcampIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d5" size:size style:style]; }
+ (instancetype)barcodeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf02a" size:size style:style]; }
+ (instancetype)barcodeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf463" size:size style:style]; }
+ (instancetype)barcodeReadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf464" size:size style:style]; }
+ (instancetype)barcodeScanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf465" size:size style:style]; }
+ (instancetype)barsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c9" size:size style:style]; }
+ (instancetype)baseballIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf432" size:size style:style]; }
+ (instancetype)baseballBallIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf433" size:size style:style]; }
+ (instancetype)basketballBallIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf434" size:size style:style]; }
+ (instancetype)basketballHoopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf435" size:size style:style]; }
+ (instancetype)batIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b5" size:size style:style]; }
+ (instancetype)bathIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2cd" size:size style:style]; }
+ (instancetype)batteryBoltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf376" size:size style:style]; }
+ (instancetype)batteryEmptyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf244" size:size style:style]; }
+ (instancetype)batteryFullIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf240" size:size style:style]; }
+ (instancetype)batteryHalfIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf242" size:size style:style]; }
+ (instancetype)batteryQuarterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf243" size:size style:style]; }
+ (instancetype)batterySlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf377" size:size style:style]; }
+ (instancetype)batteryThreeQuartersIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf241" size:size style:style]; }
+ (instancetype)bedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf236" size:size style:style]; }
+ (instancetype)beerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0fc" size:size style:style]; }
+ (instancetype)behanceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b4" size:size style:style]; }
+ (instancetype)behanceSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b5" size:size style:style]; }
+ (instancetype)bellIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0f3" size:size style:style]; }
+ (instancetype)bellSchoolIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d5" size:size style:style]; }
+ (instancetype)bellSchoolSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d6" size:size style:style]; }
+ (instancetype)bellSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f6" size:size style:style]; }
+ (instancetype)bezierCurveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf55b" size:size style:style]; }
+ (instancetype)bibleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf647" size:size style:style]; }
+ (instancetype)bicycleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf206" size:size style:style]; }
+ (instancetype)bimobjectIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf378" size:size style:style]; }
+ (instancetype)binocularsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e5" size:size style:style]; }
+ (instancetype)birthdayCakeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1fd" size:size style:style]; }
+ (instancetype)bitbucketIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf171" size:size style:style]; }
+ (instancetype)bitcoinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf379" size:size style:style]; }
+ (instancetype)bityIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf37a" size:size style:style]; }
+ (instancetype)blackTieIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf27e" size:size style:style]; }
+ (instancetype)blackberryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf37b" size:size style:style]; }
+ (instancetype)blanketIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf498" size:size style:style]; }
+ (instancetype)blenderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf517" size:size style:style]; }
+ (instancetype)blenderPhoneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b6" size:size style:style]; }
+ (instancetype)blindIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf29d" size:size style:style]; }
+ (instancetype)bloggerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf37c" size:size style:style]; }
+ (instancetype)bloggerBIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf37d" size:size style:style]; }
+ (instancetype)bluetoothIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf293" size:size style:style]; }
+ (instancetype)bluetoothBIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf294" size:size style:style]; }
+ (instancetype)boldIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf032" size:size style:style]; }
+ (instancetype)boltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e7" size:size style:style]; }
+ (instancetype)bombIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e2" size:size style:style]; }
+ (instancetype)boneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d7" size:size style:style]; }
+ (instancetype)boneBreakIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d8" size:size style:style]; }
+ (instancetype)bongIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf55c" size:size style:style]; }
+ (instancetype)bookIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf02d" size:size style:style]; }
+ (instancetype)bookAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5d9" size:size style:style]; }
+ (instancetype)bookDeadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b7" size:size style:style]; }
+ (instancetype)bookHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf499" size:size style:style]; }
+ (instancetype)bookOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf518" size:size style:style]; }
+ (instancetype)bookReaderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5da" size:size style:style]; }
+ (instancetype)bookSpellsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b8" size:size style:style]; }
+ (instancetype)bookmarkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf02e" size:size style:style]; }
+ (instancetype)booksIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5db" size:size style:style]; }
+ (instancetype)boothCurtainIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf734" size:size style:style]; }
+ (instancetype)bowArrowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6b9" size:size style:style]; }
+ (instancetype)bowlingBallIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf436" size:size style:style]; }
+ (instancetype)bowlingPinsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf437" size:size style:style]; }
+ (instancetype)boxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf466" size:size style:style]; }
+ (instancetype)boxAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf49a" size:size style:style]; }
+ (instancetype)boxBallotIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf735" size:size style:style]; }
+ (instancetype)boxCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf467" size:size style:style]; }
+ (instancetype)boxFragileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf49b" size:size style:style]; }
+ (instancetype)boxFullIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf49c" size:size style:style]; }
+ (instancetype)boxHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf49d" size:size style:style]; }
+ (instancetype)boxOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf49e" size:size style:style]; }
+ (instancetype)boxUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf49f" size:size style:style]; }
+ (instancetype)boxUsdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a0" size:size style:style]; }
+ (instancetype)boxesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf468" size:size style:style]; }
+ (instancetype)boxesAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a1" size:size style:style]; }
+ (instancetype)boxingGloveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf438" size:size style:style]; }
+ (instancetype)brailleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a1" size:size style:style]; }
+ (instancetype)brainIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5dc" size:size style:style]; }
+ (instancetype)briefcaseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0b1" size:size style:style]; }
+ (instancetype)briefcaseMedicalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf469" size:size style:style]; }
+ (instancetype)broadcastTowerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf519" size:size style:style]; }
+ (instancetype)broomIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf51a" size:size style:style]; }
+ (instancetype)browserIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf37e" size:size style:style]; }
+ (instancetype)brushIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf55d" size:size style:style]; }
+ (instancetype)btcIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf15a" size:size style:style]; }
+ (instancetype)bugIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf188" size:size style:style]; }
+ (instancetype)buildingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ad" size:size style:style]; }
+ (instancetype)bullhornIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a1" size:size style:style]; }
+ (instancetype)bullseyeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf140" size:size style:style]; }
+ (instancetype)bullseyeArrowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf648" size:size style:style]; }
+ (instancetype)bullseyePointerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf649" size:size style:style]; }
+ (instancetype)burnIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf46a" size:size style:style]; }
+ (instancetype)buromobelexperteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf37f" size:size style:style]; }
+ (instancetype)busIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf207" size:size style:style]; }
+ (instancetype)busAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf55e" size:size style:style]; }
+ (instancetype)busSchoolIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5dd" size:size style:style]; }
+ (instancetype)businessTimeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf64a" size:size style:style]; }
+ (instancetype)buyselladsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf20d" size:size style:style]; }
+ (instancetype)cabinetFilingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf64b" size:size style:style]; }
+ (instancetype)calculatorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ec" size:size style:style]; }
+ (instancetype)calculatorAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf64c" size:size style:style]; }
+ (instancetype)calendarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf133" size:size style:style]; }
+ (instancetype)calendarAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf073" size:size style:style]; }
+ (instancetype)calendarCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf274" size:size style:style]; }
+ (instancetype)calendarEditIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf333" size:size style:style]; }
+ (instancetype)calendarExclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf334" size:size style:style]; }
+ (instancetype)calendarMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf272" size:size style:style]; }
+ (instancetype)calendarPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf271" size:size style:style]; }
+ (instancetype)calendarStarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf736" size:size style:style]; }
+ (instancetype)calendarTimesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf273" size:size style:style]; }
+ (instancetype)cameraIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf030" size:size style:style]; }
+ (instancetype)cameraAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf332" size:size style:style]; }
+ (instancetype)cameraRetroIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf083" size:size style:style]; }
+ (instancetype)campfireIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ba" size:size style:style]; }
+ (instancetype)campgroundIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6bb" size:size style:style]; }
+ (instancetype)candleHolderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6bc" size:size style:style]; }
+ (instancetype)candyCornIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6bd" size:size style:style]; }
+ (instancetype)cannabisIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf55f" size:size style:style]; }
+ (instancetype)capsulesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf46b" size:size style:style]; }
+ (instancetype)carIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b9" size:size style:style]; }
+ (instancetype)carAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5de" size:size style:style]; }
+ (instancetype)carBatteryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5df" size:size style:style]; }
+ (instancetype)carBumpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e0" size:size style:style]; }
+ (instancetype)carCrashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e1" size:size style:style]; }
+ (instancetype)carGarageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e2" size:size style:style]; }
+ (instancetype)carMechanicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e3" size:size style:style]; }
+ (instancetype)carSideIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e4" size:size style:style]; }
+ (instancetype)carTiltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e5" size:size style:style]; }
+ (instancetype)carWashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e6" size:size style:style]; }
+ (instancetype)caretCircleDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf32d" size:size style:style]; }
+ (instancetype)caretCircleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf32e" size:size style:style]; }
+ (instancetype)caretCircleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf330" size:size style:style]; }
+ (instancetype)caretCircleUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf331" size:size style:style]; }
+ (instancetype)caretDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d7" size:size style:style]; }
+ (instancetype)caretLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d9" size:size style:style]; }
+ (instancetype)caretRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0da" size:size style:style]; }
+ (instancetype)caretSquareDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf150" size:size style:style]; }
+ (instancetype)caretSquareLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf191" size:size style:style]; }
+ (instancetype)caretSquareRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf152" size:size style:style]; }
+ (instancetype)caretSquareUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf151" size:size style:style]; }
+ (instancetype)caretUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d8" size:size style:style]; }
+ (instancetype)cartArrowDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf218" size:size style:style]; }
+ (instancetype)cartPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf217" size:size style:style]; }
+ (instancetype)catIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6be" size:size style:style]; }
+ (instancetype)cauldronIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6bf" size:size style:style]; }
+ (instancetype)ccAmazonPayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf42d" size:size style:style]; }
+ (instancetype)ccAmexIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f3" size:size style:style]; }
+ (instancetype)ccApplePayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf416" size:size style:style]; }
+ (instancetype)ccDinersClubIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf24c" size:size style:style]; }
+ (instancetype)ccDiscoverIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f2" size:size style:style]; }
+ (instancetype)ccJcbIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf24b" size:size style:style]; }
+ (instancetype)ccMastercardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f1" size:size style:style]; }
+ (instancetype)ccPaypalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f4" size:size style:style]; }
+ (instancetype)ccStripeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f5" size:size style:style]; }
+ (instancetype)ccVisaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f0" size:size style:style]; }
+ (instancetype)centercodeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf380" size:size style:style]; }
+ (instancetype)certificateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a3" size:size style:style]; }
+ (instancetype)chairIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c0" size:size style:style]; }
+ (instancetype)chairOfficeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c1" size:size style:style]; }
+ (instancetype)chalkboardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf51b" size:size style:style]; }
+ (instancetype)chalkboardTeacherIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf51c" size:size style:style]; }
+ (instancetype)chargingStationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e7" size:size style:style]; }
+ (instancetype)chartAreaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1fe" size:size style:style]; }
+ (instancetype)chartBarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf080" size:size style:style]; }
+ (instancetype)chartLineIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf201" size:size style:style]; }
+ (instancetype)chartLineDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf64d" size:size style:style]; }
+ (instancetype)chartPieIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf200" size:size style:style]; }
+ (instancetype)chartPieAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf64e" size:size style:style]; }
+ (instancetype)checkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf00c" size:size style:style]; }
+ (instancetype)checkCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf058" size:size style:style]; }
+ (instancetype)checkDoubleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf560" size:size style:style]; }
+ (instancetype)checkSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf14a" size:size style:style]; }
+ (instancetype)chessIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf439" size:size style:style]; }
+ (instancetype)chessBishopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf43a" size:size style:style]; }
+ (instancetype)chessBishopAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf43b" size:size style:style]; }
+ (instancetype)chessBoardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf43c" size:size style:style]; }
+ (instancetype)chessClockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf43d" size:size style:style]; }
+ (instancetype)chessClockAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf43e" size:size style:style]; }
+ (instancetype)chessKingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf43f" size:size style:style]; }
+ (instancetype)chessKingAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf440" size:size style:style]; }
+ (instancetype)chessKnightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf441" size:size style:style]; }
+ (instancetype)chessKnightAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf442" size:size style:style]; }
+ (instancetype)chessPawnIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf443" size:size style:style]; }
+ (instancetype)chessPawnAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf444" size:size style:style]; }
+ (instancetype)chessQueenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf445" size:size style:style]; }
+ (instancetype)chessQueenAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf446" size:size style:style]; }
+ (instancetype)chessRookIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf447" size:size style:style]; }
+ (instancetype)chessRookAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf448" size:size style:style]; }
+ (instancetype)chevronCircleDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf13a" size:size style:style]; }
+ (instancetype)chevronCircleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf137" size:size style:style]; }
+ (instancetype)chevronCircleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf138" size:size style:style]; }
+ (instancetype)chevronCircleUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf139" size:size style:style]; }
+ (instancetype)chevronDoubleDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf322" size:size style:style]; }
+ (instancetype)chevronDoubleLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf323" size:size style:style]; }
+ (instancetype)chevronDoubleRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf324" size:size style:style]; }
+ (instancetype)chevronDoubleUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf325" size:size style:style]; }
+ (instancetype)chevronDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf078" size:size style:style]; }
+ (instancetype)chevronLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf053" size:size style:style]; }
+ (instancetype)chevronRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf054" size:size style:style]; }
+ (instancetype)chevronSquareDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf329" size:size style:style]; }
+ (instancetype)chevronSquareLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf32a" size:size style:style]; }
+ (instancetype)chevronSquareRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf32b" size:size style:style]; }
+ (instancetype)chevronSquareUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf32c" size:size style:style]; }
+ (instancetype)chevronUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf077" size:size style:style]; }
+ (instancetype)childIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ae" size:size style:style]; }
+ (instancetype)chromeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf268" size:size style:style]; }
+ (instancetype)churchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf51d" size:size style:style]; }
+ (instancetype)circleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf111" size:size style:style]; }
+ (instancetype)circleNotchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ce" size:size style:style]; }
+ (instancetype)cityIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf64f" size:size style:style]; }
+ (instancetype)clawMarksIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c2" size:size style:style]; }
+ (instancetype)clipboardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf328" size:size style:style]; }
+ (instancetype)clipboardCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf46c" size:size style:style]; }
+ (instancetype)clipboardListIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf46d" size:size style:style]; }
+ (instancetype)clipboardListCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf737" size:size style:style]; }
+ (instancetype)clipboardPrescriptionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e8" size:size style:style]; }
+ (instancetype)clockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf017" size:size style:style]; }
+ (instancetype)cloneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf24d" size:size style:style]; }
+ (instancetype)closedCaptioningIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf20a" size:size style:style]; }
+ (instancetype)cloudIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c2" size:size style:style]; }
+ (instancetype)cloudDownloadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ed" size:size style:style]; }
+ (instancetype)cloudDownloadAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf381" size:size style:style]; }
+ (instancetype)cloudDrizzleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf738" size:size style:style]; }
+ (instancetype)cloudHailIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf739" size:size style:style]; }
+ (instancetype)cloudHailMixedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf73a" size:size style:style]; }
+ (instancetype)cloudMeatballIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf73b" size:size style:style]; }
+ (instancetype)cloudMoonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c3" size:size style:style]; }
+ (instancetype)cloudMoonRainIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf73c" size:size style:style]; }
+ (instancetype)cloudRainIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf73d" size:size style:style]; }
+ (instancetype)cloudRainbowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf73e" size:size style:style]; }
+ (instancetype)cloudShowersIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf73f" size:size style:style]; }
+ (instancetype)cloudShowersHeavyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf740" size:size style:style]; }
+ (instancetype)cloudSleetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf741" size:size style:style]; }
+ (instancetype)cloudSnowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf742" size:size style:style]; }
+ (instancetype)cloudSunIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c4" size:size style:style]; }
+ (instancetype)cloudSunRainIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf743" size:size style:style]; }
+ (instancetype)cloudUploadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ee" size:size style:style]; }
+ (instancetype)cloudUploadAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf382" size:size style:style]; }
+ (instancetype)cloudsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf744" size:size style:style]; }
+ (instancetype)cloudsMoonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf745" size:size style:style]; }
+ (instancetype)cloudsSunIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf746" size:size style:style]; }
+ (instancetype)cloudscaleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf383" size:size style:style]; }
+ (instancetype)cloudsmithIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf384" size:size style:style]; }
+ (instancetype)cloudversifyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf385" size:size style:style]; }
+ (instancetype)clubIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf327" size:size style:style]; }
+ (instancetype)cocktailIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf561" size:size style:style]; }
+ (instancetype)codeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf121" size:size style:style]; }
+ (instancetype)codeBranchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf126" size:size style:style]; }
+ (instancetype)codeCommitIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf386" size:size style:style]; }
+ (instancetype)codeMergeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf387" size:size style:style]; }
+ (instancetype)codepenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1cb" size:size style:style]; }
+ (instancetype)codiepieIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf284" size:size style:style]; }
+ (instancetype)coffeeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0f4" size:size style:style]; }
+ (instancetype)coffeeTogoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c5" size:size style:style]; }
+ (instancetype)coffinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c6" size:size style:style]; }
+ (instancetype)cogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf013" size:size style:style]; }
+ (instancetype)cogsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf085" size:size style:style]; }
+ (instancetype)coinsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf51e" size:size style:style]; }
+ (instancetype)columnsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0db" size:size style:style]; }
+ (instancetype)commentIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf075" size:size style:style]; }
+ (instancetype)commentAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf27a" size:size style:style]; }
+ (instancetype)commentAltCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a2" size:size style:style]; }
+ (instancetype)commentAltDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf650" size:size style:style]; }
+ (instancetype)commentAltDotsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a3" size:size style:style]; }
+ (instancetype)commentAltEditIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a4" size:size style:style]; }
+ (instancetype)commentAltExclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a5" size:size style:style]; }
+ (instancetype)commentAltLinesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a6" size:size style:style]; }
+ (instancetype)commentAltMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a7" size:size style:style]; }
+ (instancetype)commentAltPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a8" size:size style:style]; }
+ (instancetype)commentAltSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4a9" size:size style:style]; }
+ (instancetype)commentAltSmileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4aa" size:size style:style]; }
+ (instancetype)commentAltTimesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ab" size:size style:style]; }
+ (instancetype)commentCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ac" size:size style:style]; }
+ (instancetype)commentDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf651" size:size style:style]; }
+ (instancetype)commentDotsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ad" size:size style:style]; }
+ (instancetype)commentEditIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ae" size:size style:style]; }
+ (instancetype)commentExclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4af" size:size style:style]; }
+ (instancetype)commentLinesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b0" size:size style:style]; }
+ (instancetype)commentMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b1" size:size style:style]; }
+ (instancetype)commentPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b2" size:size style:style]; }
+ (instancetype)commentSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b3" size:size style:style]; }
+ (instancetype)commentSmileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b4" size:size style:style]; }
+ (instancetype)commentTimesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b5" size:size style:style]; }
+ (instancetype)commentsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf086" size:size style:style]; }
+ (instancetype)commentsAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b6" size:size style:style]; }
+ (instancetype)commentsAltDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf652" size:size style:style]; }
+ (instancetype)commentsDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf653" size:size style:style]; }
+ (instancetype)compactDiscIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf51f" size:size style:style]; }
+ (instancetype)compassIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf14e" size:size style:style]; }
+ (instancetype)compassSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5e9" size:size style:style]; }
+ (instancetype)compressIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf066" size:size style:style]; }
+ (instancetype)compressAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf422" size:size style:style]; }
+ (instancetype)compressWideIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf326" size:size style:style]; }
+ (instancetype)conciergeBellIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf562" size:size style:style]; }
+ (instancetype)connectdevelopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf20e" size:size style:style]; }
+ (instancetype)containerStorageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b7" size:size style:style]; }
+ (instancetype)contaoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf26d" size:size style:style]; }
+ (instancetype)conveyorBeltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf46e" size:size style:style]; }
+ (instancetype)conveyorBeltAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf46f" size:size style:style]; }
+ (instancetype)cookieIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf563" size:size style:style]; }
+ (instancetype)cookieBiteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf564" size:size style:style]; }
+ (instancetype)copyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c5" size:size style:style]; }
+ (instancetype)copyrightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f9" size:size style:style]; }
+ (instancetype)cornIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c7" size:size style:style]; }
+ (instancetype)couchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b8" size:size style:style]; }
+ (instancetype)cowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c8" size:size style:style]; }
+ (instancetype)cpanelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf388" size:size style:style]; }
+ (instancetype)creativeCommonsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf25e" size:size style:style]; }
+ (instancetype)creativeCommonsByIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e7" size:size style:style]; }
+ (instancetype)creativeCommonsNcIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e8" size:size style:style]; }
+ (instancetype)creativeCommonsNcEuIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e9" size:size style:style]; }
+ (instancetype)creativeCommonsNcJpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ea" size:size style:style]; }
+ (instancetype)creativeCommonsNdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4eb" size:size style:style]; }
+ (instancetype)creativeCommonsPdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ec" size:size style:style]; }
+ (instancetype)creativeCommonsPdAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ed" size:size style:style]; }
+ (instancetype)creativeCommonsRemixIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ee" size:size style:style]; }
+ (instancetype)creativeCommonsSaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ef" size:size style:style]; }
+ (instancetype)creativeCommonsSamplingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f0" size:size style:style]; }
+ (instancetype)creativeCommonsSamplingPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f1" size:size style:style]; }
+ (instancetype)creativeCommonsShareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f2" size:size style:style]; }
+ (instancetype)creativeCommonsZeroIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f3" size:size style:style]; }
+ (instancetype)creditCardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf09d" size:size style:style]; }
+ (instancetype)creditCardBlankIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf389" size:size style:style]; }
+ (instancetype)creditCardFrontIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf38a" size:size style:style]; }
+ (instancetype)cricketIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf449" size:size style:style]; }
+ (instancetype)criticalRoleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6c9" size:size style:style]; }
+ (instancetype)cropIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf125" size:size style:style]; }
+ (instancetype)cropAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf565" size:size style:style]; }
+ (instancetype)crossIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf654" size:size style:style]; }
+ (instancetype)crosshairsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf05b" size:size style:style]; }
+ (instancetype)crowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf520" size:size style:style]; }
+ (instancetype)crownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf521" size:size style:style]; }
+ (instancetype)css3IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf13c" size:size style:style]; }
+ (instancetype)css3AltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf38b" size:size style:style]; }
+ (instancetype)cubeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b2" size:size style:style]; }
+ (instancetype)cubesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b3" size:size style:style]; }
+ (instancetype)curlingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf44a" size:size style:style]; }
+ (instancetype)cutIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c4" size:size style:style]; }
+ (instancetype)cuttlefishIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf38c" size:size style:style]; }
+ (instancetype)dAndDIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf38d" size:size style:style]; }
+ (instancetype)dAndDBeyondIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ca" size:size style:style]; }
+ (instancetype)daggerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6cb" size:size style:style]; }
+ (instancetype)dashcubeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf210" size:size style:style]; }
+ (instancetype)databaseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c0" size:size style:style]; }
+ (instancetype)deafIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a4" size:size style:style]; }
+ (instancetype)deliciousIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a5" size:size style:style]; }
+ (instancetype)democratIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf747" size:size style:style]; }
+ (instancetype)deploydogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf38e" size:size style:style]; }
+ (instancetype)deskproIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf38f" size:size style:style]; }
+ (instancetype)desktopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf108" size:size style:style]; }
+ (instancetype)desktopAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf390" size:size style:style]; }
+ (instancetype)devIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6cc" size:size style:style]; }
+ (instancetype)deviantartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1bd" size:size style:style]; }
+ (instancetype)dewpointIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf748" size:size style:style]; }
+ (instancetype)dharmachakraIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf655" size:size style:style]; }
+ (instancetype)diagnosesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf470" size:size style:style]; }
+ (instancetype)diamondIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf219" size:size style:style]; }
+ (instancetype)diceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf522" size:size style:style]; }
+ (instancetype)diceD10IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6cd" size:size style:style]; }
+ (instancetype)diceD12IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ce" size:size style:style]; }
+ (instancetype)diceD20IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6cf" size:size style:style]; }
+ (instancetype)diceD4IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d0" size:size style:style]; }
+ (instancetype)diceD6IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d1" size:size style:style]; }
+ (instancetype)diceD8IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d2" size:size style:style]; }
+ (instancetype)diceFiveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf523" size:size style:style]; }
+ (instancetype)diceFourIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf524" size:size style:style]; }
+ (instancetype)diceOneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf525" size:size style:style]; }
+ (instancetype)diceSixIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf526" size:size style:style]; }
+ (instancetype)diceThreeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf527" size:size style:style]; }
+ (instancetype)diceTwoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf528" size:size style:style]; }
+ (instancetype)diggIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a6" size:size style:style]; }
+ (instancetype)digitalOceanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf391" size:size style:style]; }
+ (instancetype)digitalTachographIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf566" size:size style:style]; }
+ (instancetype)diplomaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ea" size:size style:style]; }
+ (instancetype)directionsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5eb" size:size style:style]; }
+ (instancetype)discordIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf392" size:size style:style]; }
+ (instancetype)discourseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf393" size:size style:style]; }
+ (instancetype)divideIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf529" size:size style:style]; }
+ (instancetype)dizzyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf567" size:size style:style]; }
+ (instancetype)dnaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf471" size:size style:style]; }
+ (instancetype)doNotEnterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ec" size:size style:style]; }
+ (instancetype)dochubIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf394" size:size style:style]; }
+ (instancetype)dockerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf395" size:size style:style]; }
+ (instancetype)dogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d3" size:size style:style]; }
+ (instancetype)dogLeashedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d4" size:size style:style]; }
+ (instancetype)dollarSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf155" size:size style:style]; }
+ (instancetype)dollyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf472" size:size style:style]; }
+ (instancetype)dollyEmptyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf473" size:size style:style]; }
+ (instancetype)dollyFlatbedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf474" size:size style:style]; }
+ (instancetype)dollyFlatbedAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf475" size:size style:style]; }
+ (instancetype)dollyFlatbedEmptyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf476" size:size style:style]; }
+ (instancetype)donateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4b9" size:size style:style]; }
+ (instancetype)doorClosedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf52a" size:size style:style]; }
+ (instancetype)doorOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf52b" size:size style:style]; }
+ (instancetype)dotCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf192" size:size style:style]; }
+ (instancetype)doveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ba" size:size style:style]; }
+ (instancetype)downloadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf019" size:size style:style]; }
+ (instancetype)draft2digitalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf396" size:size style:style]; }
+ (instancetype)draftingCompassIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf568" size:size style:style]; }
+ (instancetype)dragonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d5" size:size style:style]; }
+ (instancetype)drawCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ed" size:size style:style]; }
+ (instancetype)drawPolygonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ee" size:size style:style]; }
+ (instancetype)drawSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ef" size:size style:style]; }
+ (instancetype)dribbbleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf17d" size:size style:style]; }
+ (instancetype)dribbbleSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf397" size:size style:style]; }
+ (instancetype)dropboxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf16b" size:size style:style]; }
+ (instancetype)drumIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf569" size:size style:style]; }
+ (instancetype)drumSteelpanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf56a" size:size style:style]; }
+ (instancetype)drumstickIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d6" size:size style:style]; }
+ (instancetype)drumstickBiteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d7" size:size style:style]; }
+ (instancetype)drupalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a9" size:size style:style]; }
+ (instancetype)duckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d8" size:size style:style]; }
+ (instancetype)dumbbellIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf44b" size:size style:style]; }
+ (instancetype)dungeonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6d9" size:size style:style]; }
+ (instancetype)dyalogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf399" size:size style:style]; }
+ (instancetype)earIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f0" size:size style:style]; }
+ (instancetype)earlybirdsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf39a" size:size style:style]; }
+ (instancetype)ebayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f4" size:size style:style]; }
+ (instancetype)eclipseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf749" size:size style:style]; }
+ (instancetype)eclipseAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf74a" size:size style:style]; }
+ (instancetype)edgeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf282" size:size style:style]; }
+ (instancetype)editIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf044" size:size style:style]; }
+ (instancetype)ejectIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf052" size:size style:style]; }
+ (instancetype)elementorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf430" size:size style:style]; }
+ (instancetype)elephantIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6da" size:size style:style]; }
+ (instancetype)ellipsisHIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf141" size:size style:style]; }
+ (instancetype)ellipsisHAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf39b" size:size style:style]; }
+ (instancetype)ellipsisVIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf142" size:size style:style]; }
+ (instancetype)ellipsisVAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf39c" size:size style:style]; }
+ (instancetype)elloIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f1" size:size style:style]; }
+ (instancetype)emberIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf423" size:size style:style]; }
+ (instancetype)empireIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d1" size:size style:style]; }
+ (instancetype)emptySetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf656" size:size style:style]; }
+ (instancetype)engineWarningIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f2" size:size style:style]; }
+ (instancetype)envelopeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e0" size:size style:style]; }
+ (instancetype)envelopeOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b6" size:size style:style]; }
+ (instancetype)envelopeOpenDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf657" size:size style:style]; }
+ (instancetype)envelopeOpenTextIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf658" size:size style:style]; }
+ (instancetype)envelopeSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf199" size:size style:style]; }
+ (instancetype)enviraIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf299" size:size style:style]; }
+ (instancetype)equalsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf52c" size:size style:style]; }
+ (instancetype)eraserIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf12d" size:size style:style]; }
+ (instancetype)erlangIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf39d" size:size style:style]; }
+ (instancetype)ethereumIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf42e" size:size style:style]; }
+ (instancetype)etsyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d7" size:size style:style]; }
+ (instancetype)euroSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf153" size:size style:style]; }
+ (instancetype)exchangeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ec" size:size style:style]; }
+ (instancetype)exchangeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf362" size:size style:style]; }
+ (instancetype)exclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf12a" size:size style:style]; }
+ (instancetype)exclamationCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf06a" size:size style:style]; }
+ (instancetype)exclamationSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf321" size:size style:style]; }
+ (instancetype)exclamationTriangleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf071" size:size style:style]; }
+ (instancetype)expandIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf065" size:size style:style]; }
+ (instancetype)expandAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf424" size:size style:style]; }
+ (instancetype)expandArrowsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf31d" size:size style:style]; }
+ (instancetype)expandArrowsAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf31e" size:size style:style]; }
+ (instancetype)expandWideIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf320" size:size style:style]; }
+ (instancetype)expeditedsslIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf23e" size:size style:style]; }
+ (instancetype)externalLinkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf08e" size:size style:style]; }
+ (instancetype)externalLinkAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf35d" size:size style:style]; }
+ (instancetype)externalLinkSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf14c" size:size style:style]; }
+ (instancetype)externalLinkSquareAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf360" size:size style:style]; }
+ (instancetype)eyeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf06e" size:size style:style]; }
+ (instancetype)eyeDropperIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1fb" size:size style:style]; }
+ (instancetype)eyeEvilIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6db" size:size style:style]; }
+ (instancetype)eyeSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf070" size:size style:style]; }
+ (instancetype)facebookIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf09a" size:size style:style]; }
+ (instancetype)facebookFIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf39e" size:size style:style]; }
+ (instancetype)facebookMessengerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf39f" size:size style:style]; }
+ (instancetype)facebookSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf082" size:size style:style]; }
+ (instancetype)fantasyFlightGamesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6dc" size:size style:style]; }
+ (instancetype)fastBackwardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf049" size:size style:style]; }
+ (instancetype)fastForwardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf050" size:size style:style]; }
+ (instancetype)faxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ac" size:size style:style]; }
+ (instancetype)featherIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf52d" size:size style:style]; }
+ (instancetype)featherAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf56b" size:size style:style]; }
+ (instancetype)femaleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf182" size:size style:style]; }
+ (instancetype)fieldHockeyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf44c" size:size style:style]; }
+ (instancetype)fighterJetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0fb" size:size style:style]; }
+ (instancetype)fileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf15b" size:size style:style]; }
+ (instancetype)fileAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf15c" size:size style:style]; }
+ (instancetype)fileArchiveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c6" size:size style:style]; }
+ (instancetype)fileAudioIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c7" size:size style:style]; }
+ (instancetype)fileCertificateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f3" size:size style:style]; }
+ (instancetype)fileChartLineIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf659" size:size style:style]; }
+ (instancetype)fileChartPieIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf65a" size:size style:style]; }
+ (instancetype)fileCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf316" size:size style:style]; }
+ (instancetype)fileCodeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c9" size:size style:style]; }
+ (instancetype)fileContractIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf56c" size:size style:style]; }
+ (instancetype)fileCsvIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6dd" size:size style:style]; }
+ (instancetype)fileDownloadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf56d" size:size style:style]; }
+ (instancetype)fileEditIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf31c" size:size style:style]; }
+ (instancetype)fileExcelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c3" size:size style:style]; }
+ (instancetype)fileExclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf31a" size:size style:style]; }
+ (instancetype)fileExportIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf56e" size:size style:style]; }
+ (instancetype)fileImageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c5" size:size style:style]; }
+ (instancetype)fileImportIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf56f" size:size style:style]; }
+ (instancetype)fileInvoiceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf570" size:size style:style]; }
+ (instancetype)fileInvoiceDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf571" size:size style:style]; }
+ (instancetype)fileMedicalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf477" size:size style:style]; }
+ (instancetype)fileMedicalAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf478" size:size style:style]; }
+ (instancetype)fileMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf318" size:size style:style]; }
+ (instancetype)filePdfIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c1" size:size style:style]; }
+ (instancetype)filePlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf319" size:size style:style]; }
+ (instancetype)filePowerpointIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c4" size:size style:style]; }
+ (instancetype)filePrescriptionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf572" size:size style:style]; }
+ (instancetype)fileSignatureIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf573" size:size style:style]; }
+ (instancetype)fileSpreadsheetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf65b" size:size style:style]; }
+ (instancetype)fileTimesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf317" size:size style:style]; }
+ (instancetype)fileUploadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf574" size:size style:style]; }
+ (instancetype)fileUserIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf65c" size:size style:style]; }
+ (instancetype)fileVideoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c8" size:size style:style]; }
+ (instancetype)fileWordIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1c2" size:size style:style]; }
+ (instancetype)fillIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf575" size:size style:style]; }
+ (instancetype)fillDripIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf576" size:size style:style]; }
+ (instancetype)filmIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf008" size:size style:style]; }
+ (instancetype)filmAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a0" size:size style:style]; }
+ (instancetype)filterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0b0" size:size style:style]; }
+ (instancetype)fingerprintIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf577" size:size style:style]; }
+ (instancetype)fireIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf06d" size:size style:style]; }
+ (instancetype)fireExtinguisherIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf134" size:size style:style]; }
+ (instancetype)fireSmokeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf74b" size:size style:style]; }
+ (instancetype)firefoxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf269" size:size style:style]; }
+ (instancetype)firstAidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf479" size:size style:style]; }
+ (instancetype)firstOrderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b0" size:size style:style]; }
+ (instancetype)firstOrderAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf50a" size:size style:style]; }
+ (instancetype)firstdraftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a1" size:size style:style]; }
+ (instancetype)fishIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf578" size:size style:style]; }
+ (instancetype)fistRaisedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6de" size:size style:style]; }
+ (instancetype)flagIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf024" size:size style:style]; }
+ (instancetype)flagAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf74c" size:size style:style]; }
+ (instancetype)flagCheckeredIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf11e" size:size style:style]; }
+ (instancetype)flagUsaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf74d" size:size style:style]; }
+ (instancetype)flameIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6df" size:size style:style]; }
+ (instancetype)flaskIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c3" size:size style:style]; }
+ (instancetype)flaskPoisonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e0" size:size style:style]; }
+ (instancetype)flaskPotionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e1" size:size style:style]; }
+ (instancetype)flickrIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf16e" size:size style:style]; }
+ (instancetype)flipboardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf44d" size:size style:style]; }
+ (instancetype)flushedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf579" size:size style:style]; }
+ (instancetype)flyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf417" size:size style:style]; }
+ (instancetype)fogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf74e" size:size style:style]; }
+ (instancetype)folderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf07b" size:size style:style]; }
+ (instancetype)folderMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf65d" size:size style:style]; }
+ (instancetype)folderOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf07c" size:size style:style]; }
+ (instancetype)folderPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf65e" size:size style:style]; }
+ (instancetype)folderTimesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf65f" size:size style:style]; }
+ (instancetype)foldersIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf660" size:size style:style]; }
+ (instancetype)fontIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf031" size:size style:style]; }
+ (instancetype)fontAwesomeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b4" size:size style:style]; }
+ (instancetype)fontAwesomeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf35c" size:size style:style]; }
+ (instancetype)fontAwesomeFlagIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf425" size:size style:style]; }
+ (instancetype)fontAwesomeLogoFullIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e6" size:size style:style]; }
+ (instancetype)fonticonsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf280" size:size style:style]; }
+ (instancetype)fonticonsFiIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a2" size:size style:style]; }
+ (instancetype)footballBallIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf44e" size:size style:style]; }
+ (instancetype)footballHelmetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf44f" size:size style:style]; }
+ (instancetype)forkliftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf47a" size:size style:style]; }
+ (instancetype)fortAwesomeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf286" size:size style:style]; }
+ (instancetype)fortAwesomeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a3" size:size style:style]; }
+ (instancetype)forumbeeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf211" size:size style:style]; }
+ (instancetype)forwardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf04e" size:size style:style]; }
+ (instancetype)foursquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf180" size:size style:style]; }
+ (instancetype)fragileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4bb" size:size style:style]; }
+ (instancetype)freeCodeCampIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c5" size:size style:style]; }
+ (instancetype)freebsdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a4" size:size style:style]; }
+ (instancetype)frogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf52e" size:size style:style]; }
+ (instancetype)frownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf119" size:size style:style]; }
+ (instancetype)frownOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf57a" size:size style:style]; }
+ (instancetype)fulcrumIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf50b" size:size style:style]; }
+ (instancetype)functionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf661" size:size style:style]; }
+ (instancetype)funnelDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf662" size:size style:style]; }
+ (instancetype)futbolIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e3" size:size style:style]; }
+ (instancetype)galacticRepublicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf50c" size:size style:style]; }
+ (instancetype)galacticSenateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf50d" size:size style:style]; }
+ (instancetype)gamepadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf11b" size:size style:style]; }
+ (instancetype)gasPumpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf52f" size:size style:style]; }
+ (instancetype)gasPumpSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f4" size:size style:style]; }
+ (instancetype)gavelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e3" size:size style:style]; }
+ (instancetype)gemIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a5" size:size style:style]; }
+ (instancetype)genderlessIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf22d" size:size style:style]; }
+ (instancetype)getPocketIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf265" size:size style:style]; }
+ (instancetype)ggIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf260" size:size style:style]; }
+ (instancetype)ggCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf261" size:size style:style]; }
+ (instancetype)ghostIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e2" size:size style:style]; }
+ (instancetype)giftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf06b" size:size style:style]; }
+ (instancetype)giftCardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf663" size:size style:style]; }
+ (instancetype)gitIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d3" size:size style:style]; }
+ (instancetype)gitSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d2" size:size style:style]; }
+ (instancetype)githubIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf09b" size:size style:style]; }
+ (instancetype)githubAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf113" size:size style:style]; }
+ (instancetype)githubSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf092" size:size style:style]; }
+ (instancetype)gitkrakenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a6" size:size style:style]; }
+ (instancetype)gitlabIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf296" size:size style:style]; }
+ (instancetype)gitterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf426" size:size style:style]; }
+ (instancetype)glassMartiniIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf000" size:size style:style]; }
+ (instancetype)glassMartiniAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf57b" size:size style:style]; }
+ (instancetype)glassesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf530" size:size style:style]; }
+ (instancetype)glassesAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f5" size:size style:style]; }
+ (instancetype)glideIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a5" size:size style:style]; }
+ (instancetype)glideGIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a6" size:size style:style]; }
+ (instancetype)globeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ac" size:size style:style]; }
+ (instancetype)globeAfricaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf57c" size:size style:style]; }
+ (instancetype)globeAmericasIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf57d" size:size style:style]; }
+ (instancetype)globeAsiaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf57e" size:size style:style]; }
+ (instancetype)globeStandIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f6" size:size style:style]; }
+ (instancetype)goforeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a7" size:size style:style]; }
+ (instancetype)golfBallIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf450" size:size style:style]; }
+ (instancetype)golfClubIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf451" size:size style:style]; }
+ (instancetype)goodreadsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a8" size:size style:style]; }
+ (instancetype)goodreadsGIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3a9" size:size style:style]; }
+ (instancetype)googleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a0" size:size style:style]; }
+ (instancetype)googleDriveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3aa" size:size style:style]; }
+ (instancetype)googlePlayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ab" size:size style:style]; }
+ (instancetype)googlePlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b3" size:size style:style]; }
+ (instancetype)googlePlusGIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d5" size:size style:style]; }
+ (instancetype)googlePlusSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d4" size:size style:style]; }
+ (instancetype)googleWalletIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ee" size:size style:style]; }
+ (instancetype)gopuramIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf664" size:size style:style]; }
+ (instancetype)graduationCapIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf19d" size:size style:style]; }
+ (instancetype)gratipayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf184" size:size style:style]; }
+ (instancetype)gravIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d6" size:size style:style]; }
+ (instancetype)greaterThanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf531" size:size style:style]; }
+ (instancetype)greaterThanEqualIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf532" size:size style:style]; }
+ (instancetype)grimaceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf57f" size:size style:style]; }
+ (instancetype)grinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf580" size:size style:style]; }
+ (instancetype)grinAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf581" size:size style:style]; }
+ (instancetype)grinBeamIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf582" size:size style:style]; }
+ (instancetype)grinBeamSweatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf583" size:size style:style]; }
+ (instancetype)grinHeartsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf584" size:size style:style]; }
+ (instancetype)grinSquintIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf585" size:size style:style]; }
+ (instancetype)grinSquintTearsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf586" size:size style:style]; }
+ (instancetype)grinStarsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf587" size:size style:style]; }
+ (instancetype)grinTearsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf588" size:size style:style]; }
+ (instancetype)grinTongueIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf589" size:size style:style]; }
+ (instancetype)grinTongueSquintIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf58a" size:size style:style]; }
+ (instancetype)grinTongueWinkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf58b" size:size style:style]; }
+ (instancetype)grinWinkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf58c" size:size style:style]; }
+ (instancetype)gripHorizontalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf58d" size:size style:style]; }
+ (instancetype)gripVerticalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf58e" size:size style:style]; }
+ (instancetype)gripfireIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ac" size:size style:style]; }
+ (instancetype)gruntIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ad" size:size style:style]; }
+ (instancetype)gulpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ae" size:size style:style]; }
+ (instancetype)hSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0fd" size:size style:style]; }
+ (instancetype)h1IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf313" size:size style:style]; }
+ (instancetype)h2IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf314" size:size style:style]; }
+ (instancetype)h3IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf315" size:size style:style]; }
+ (instancetype)hackerNewsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d4" size:size style:style]; }
+ (instancetype)hackerNewsSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3af" size:size style:style]; }
+ (instancetype)hackerrankIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f7" size:size style:style]; }
+ (instancetype)hammerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e3" size:size style:style]; }
+ (instancetype)hammerWarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e4" size:size style:style]; }
+ (instancetype)hamsaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf665" size:size style:style]; }
+ (instancetype)handHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4bc" size:size style:style]; }
+ (instancetype)handHoldingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4bd" size:size style:style]; }
+ (instancetype)handHoldingBoxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf47b" size:size style:style]; }
+ (instancetype)handHoldingHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4be" size:size style:style]; }
+ (instancetype)handHoldingMagicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e5" size:size style:style]; }
+ (instancetype)handHoldingSeedlingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4bf" size:size style:style]; }
+ (instancetype)handHoldingUsdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c0" size:size style:style]; }
+ (instancetype)handHoldingWaterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c1" size:size style:style]; }
+ (instancetype)handLizardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf258" size:size style:style]; }
+ (instancetype)handPaperIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf256" size:size style:style]; }
+ (instancetype)handPeaceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf25b" size:size style:style]; }
+ (instancetype)handPointDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a7" size:size style:style]; }
+ (instancetype)handPointLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a5" size:size style:style]; }
+ (instancetype)handPointRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a4" size:size style:style]; }
+ (instancetype)handPointUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a6" size:size style:style]; }
+ (instancetype)handPointerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf25a" size:size style:style]; }
+ (instancetype)handReceivingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf47c" size:size style:style]; }
+ (instancetype)handRockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf255" size:size style:style]; }
+ (instancetype)handScissorsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf257" size:size style:style]; }
+ (instancetype)handSpockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf259" size:size style:style]; }
+ (instancetype)handsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c2" size:size style:style]; }
+ (instancetype)handsHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c3" size:size style:style]; }
+ (instancetype)handsHelpingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c4" size:size style:style]; }
+ (instancetype)handsUsdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c5" size:size style:style]; }
+ (instancetype)handshakeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b5" size:size style:style]; }
+ (instancetype)handshakeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c6" size:size style:style]; }
+ (instancetype)hanukiahIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e6" size:size style:style]; }
+ (instancetype)hashtagIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf292" size:size style:style]; }
+ (instancetype)hatWitchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e7" size:size style:style]; }
+ (instancetype)hatWizardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e8" size:size style:style]; }
+ (instancetype)haykalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf666" size:size style:style]; }
+ (instancetype)hddIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0a0" size:size style:style]; }
+ (instancetype)headSideIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6e9" size:size style:style]; }
+ (instancetype)headVrIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ea" size:size style:style]; }
+ (instancetype)headingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1dc" size:size style:style]; }
+ (instancetype)headphonesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf025" size:size style:style]; }
+ (instancetype)headphonesAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf58f" size:size style:style]; }
+ (instancetype)headsetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf590" size:size style:style]; }
+ (instancetype)heartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf004" size:size style:style]; }
+ (instancetype)heartCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c7" size:size style:style]; }
+ (instancetype)heartRateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f8" size:size style:style]; }
+ (instancetype)heartSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c8" size:size style:style]; }
+ (instancetype)heartbeatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf21e" size:size style:style]; }
+ (instancetype)helicopterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf533" size:size style:style]; }
+ (instancetype)helmetBattleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6eb" size:size style:style]; }
+ (instancetype)hexagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf312" size:size style:style]; }
+ (instancetype)highlighterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf591" size:size style:style]; }
+ (instancetype)hikingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ec" size:size style:style]; }
+ (instancetype)hippoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ed" size:size style:style]; }
+ (instancetype)hipsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf452" size:size style:style]; }
+ (instancetype)hireAHelperIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b0" size:size style:style]; }
+ (instancetype)historyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1da" size:size style:style]; }
+ (instancetype)hockeyMaskIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ee" size:size style:style]; }
+ (instancetype)hockeyPuckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf453" size:size style:style]; }
+ (instancetype)hockeySticksIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf454" size:size style:style]; }
+ (instancetype)homeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf015" size:size style:style]; }
+ (instancetype)homeHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4c9" size:size style:style]; }
+ (instancetype)hoodCloakIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ef" size:size style:style]; }
+ (instancetype)hooliIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf427" size:size style:style]; }
+ (instancetype)hornbillIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf592" size:size style:style]; }
+ (instancetype)horseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f0" size:size style:style]; }
+ (instancetype)hospitalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0f8" size:size style:style]; }
+ (instancetype)hospitalAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf47d" size:size style:style]; }
+ (instancetype)hospitalSymbolIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf47e" size:size style:style]; }
+ (instancetype)hotTubIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf593" size:size style:style]; }
+ (instancetype)hotelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf594" size:size style:style]; }
+ (instancetype)hotjarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b1" size:size style:style]; }
+ (instancetype)hourglassIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf254" size:size style:style]; }
+ (instancetype)hourglassEndIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf253" size:size style:style]; }
+ (instancetype)hourglassHalfIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf252" size:size style:style]; }
+ (instancetype)hourglassStartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf251" size:size style:style]; }
+ (instancetype)houseDamageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f1" size:size style:style]; }
+ (instancetype)houseFloodIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf74f" size:size style:style]; }
+ (instancetype)houzzIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf27c" size:size style:style]; }
+ (instancetype)hryvniaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f2" size:size style:style]; }
+ (instancetype)html5IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf13b" size:size style:style]; }
+ (instancetype)hubspotIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b2" size:size style:style]; }
+ (instancetype)humidityIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf750" size:size style:style]; }
+ (instancetype)hurricaneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf751" size:size style:style]; }
+ (instancetype)iCursorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf246" size:size style:style]; }
+ (instancetype)idBadgeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c1" size:size style:style]; }
+ (instancetype)idCardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c2" size:size style:style]; }
+ (instancetype)idCardAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf47f" size:size style:style]; }
+ (instancetype)imageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf03e" size:size style:style]; }
+ (instancetype)imagesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf302" size:size style:style]; }
+ (instancetype)imdbIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d8" size:size style:style]; }
+ (instancetype)inboxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf01c" size:size style:style]; }
+ (instancetype)inboxInIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf310" size:size style:style]; }
+ (instancetype)inboxOutIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf311" size:size style:style]; }
+ (instancetype)indentIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf03c" size:size style:style]; }
+ (instancetype)industryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf275" size:size style:style]; }
+ (instancetype)industryAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b3" size:size style:style]; }
+ (instancetype)infinityIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf534" size:size style:style]; }
+ (instancetype)infoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf129" size:size style:style]; }
+ (instancetype)infoCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf05a" size:size style:style]; }
+ (instancetype)infoSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf30f" size:size style:style]; }
+ (instancetype)inhalerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5f9" size:size style:style]; }
+ (instancetype)instagramIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf16d" size:size style:style]; }
+ (instancetype)integralIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf667" size:size style:style]; }
+ (instancetype)internetExplorerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf26b" size:size style:style]; }
+ (instancetype)intersectionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf668" size:size style:style]; }
+ (instancetype)inventoryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf480" size:size style:style]; }
+ (instancetype)ioxhostIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf208" size:size style:style]; }
+ (instancetype)italicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf033" size:size style:style]; }
+ (instancetype)itunesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b4" size:size style:style]; }
+ (instancetype)itunesNoteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b5" size:size style:style]; }
+ (instancetype)jackOLanternIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf30e" size:size style:style]; }
+ (instancetype)javaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e4" size:size style:style]; }
+ (instancetype)jediIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf669" size:size style:style]; }
+ (instancetype)jediOrderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf50e" size:size style:style]; }
+ (instancetype)jenkinsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b6" size:size style:style]; }
+ (instancetype)jogetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b7" size:size style:style]; }
+ (instancetype)jointIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf595" size:size style:style]; }
+ (instancetype)joomlaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1aa" size:size style:style]; }
+ (instancetype)journalWhillsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf66a" size:size style:style]; }
+ (instancetype)jsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b8" size:size style:style]; }
+ (instancetype)jsSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3b9" size:size style:style]; }
+ (instancetype)jsfiddleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1cc" size:size style:style]; }
+ (instancetype)kaabaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf66b" size:size style:style]; }
+ (instancetype)kaggleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5fa" size:size style:style]; }
+ (instancetype)keyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf084" size:size style:style]; }
+ (instancetype)keySkeletonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f3" size:size style:style]; }
+ (instancetype)keybaseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f5" size:size style:style]; }
+ (instancetype)keyboardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf11c" size:size style:style]; }
+ (instancetype)keycdnIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ba" size:size style:style]; }
+ (instancetype)keynoteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf66c" size:size style:style]; }
+ (instancetype)khandaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf66d" size:size style:style]; }
+ (instancetype)kickstarterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3bb" size:size style:style]; }
+ (instancetype)kickstarterKIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3bc" size:size style:style]; }
+ (instancetype)kidneysIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5fb" size:size style:style]; }
+ (instancetype)kissIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf596" size:size style:style]; }
+ (instancetype)kissBeamIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf597" size:size style:style]; }
+ (instancetype)kissWinkHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf598" size:size style:style]; }
+ (instancetype)kiteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f4" size:size style:style]; }
+ (instancetype)kiwiBirdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf535" size:size style:style]; }
+ (instancetype)knifeKitchenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f5" size:size style:style]; }
+ (instancetype)korvueIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf42f" size:size style:style]; }
+ (instancetype)lambdaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf66e" size:size style:style]; }
+ (instancetype)lampIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ca" size:size style:style]; }
+ (instancetype)landmarkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf66f" size:size style:style]; }
+ (instancetype)landmarkAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf752" size:size style:style]; }
+ (instancetype)languageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ab" size:size style:style]; }
+ (instancetype)laptopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf109" size:size style:style]; }
+ (instancetype)laptopCodeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5fc" size:size style:style]; }
+ (instancetype)laravelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3bd" size:size style:style]; }
+ (instancetype)lastfmIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf202" size:size style:style]; }
+ (instancetype)lastfmSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf203" size:size style:style]; }
+ (instancetype)laughIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf599" size:size style:style]; }
+ (instancetype)laughBeamIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf59a" size:size style:style]; }
+ (instancetype)laughSquintIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf59b" size:size style:style]; }
+ (instancetype)laughWinkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf59c" size:size style:style]; }
+ (instancetype)layerGroupIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5fd" size:size style:style]; }
+ (instancetype)layerMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5fe" size:size style:style]; }
+ (instancetype)layerPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ff" size:size style:style]; }
+ (instancetype)leafIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf06c" size:size style:style]; }
+ (instancetype)leafHeartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4cb" size:size style:style]; }
+ (instancetype)leafMapleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f6" size:size style:style]; }
+ (instancetype)leafOakIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f7" size:size style:style]; }
+ (instancetype)leanpubIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf212" size:size style:style]; }
+ (instancetype)lemonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf094" size:size style:style]; }
+ (instancetype)lessIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf41d" size:size style:style]; }
+ (instancetype)lessThanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf536" size:size style:style]; }
+ (instancetype)lessThanEqualIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf537" size:size style:style]; }
+ (instancetype)levelDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf149" size:size style:style]; }
+ (instancetype)levelDownAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3be" size:size style:style]; }
+ (instancetype)levelUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf148" size:size style:style]; }
+ (instancetype)levelUpAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3bf" size:size style:style]; }
+ (instancetype)lifeRingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1cd" size:size style:style]; }
+ (instancetype)lightbulbIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0eb" size:size style:style]; }
+ (instancetype)lightbulbDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf670" size:size style:style]; }
+ (instancetype)lightbulbExclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf671" size:size style:style]; }
+ (instancetype)lightbulbOnIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf672" size:size style:style]; }
+ (instancetype)lightbulbSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf673" size:size style:style]; }
+ (instancetype)lineIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c0" size:size style:style]; }
+ (instancetype)linkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c1" size:size style:style]; }
+ (instancetype)linkedinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf08c" size:size style:style]; }
+ (instancetype)linkedinInIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e1" size:size style:style]; }
+ (instancetype)linodeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b8" size:size style:style]; }
+ (instancetype)linuxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf17c" size:size style:style]; }
+ (instancetype)lipsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf600" size:size style:style]; }
+ (instancetype)liraSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf195" size:size style:style]; }
+ (instancetype)listIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf03a" size:size style:style]; }
+ (instancetype)listAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf022" size:size style:style]; }
+ (instancetype)listOlIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0cb" size:size style:style]; }
+ (instancetype)listUlIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ca" size:size style:style]; }
+ (instancetype)locationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf601" size:size style:style]; }
+ (instancetype)locationArrowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf124" size:size style:style]; }
+ (instancetype)locationCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf602" size:size style:style]; }
+ (instancetype)locationSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf603" size:size style:style]; }
+ (instancetype)lockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf023" size:size style:style]; }
+ (instancetype)lockAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf30d" size:size style:style]; }
+ (instancetype)lockOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c1" size:size style:style]; }
+ (instancetype)lockOpenAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c2" size:size style:style]; }
+ (instancetype)longArrowAltDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf309" size:size style:style]; }
+ (instancetype)longArrowAltLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf30a" size:size style:style]; }
+ (instancetype)longArrowAltRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf30b" size:size style:style]; }
+ (instancetype)longArrowAltUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf30c" size:size style:style]; }
+ (instancetype)longArrowDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf175" size:size style:style]; }
+ (instancetype)longArrowLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf177" size:size style:style]; }
+ (instancetype)longArrowRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf178" size:size style:style]; }
+ (instancetype)longArrowUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf176" size:size style:style]; }
+ (instancetype)loveseatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4cc" size:size style:style]; }
+ (instancetype)lowVisionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a8" size:size style:style]; }
+ (instancetype)luchadorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf455" size:size style:style]; }
+ (instancetype)luggageCartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf59d" size:size style:style]; }
+ (instancetype)lungsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf604" size:size style:style]; }
+ (instancetype)lyftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c3" size:size style:style]; }
+ (instancetype)maceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f8" size:size style:style]; }
+ (instancetype)magentoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c4" size:size style:style]; }
+ (instancetype)magicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d0" size:size style:style]; }
+ (instancetype)magnetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf076" size:size style:style]; }
+ (instancetype)mailBulkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf674" size:size style:style]; }
+ (instancetype)mailchimpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf59e" size:size style:style]; }
+ (instancetype)maleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf183" size:size style:style]; }
+ (instancetype)mandalorianIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf50f" size:size style:style]; }
+ (instancetype)mandolinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6f9" size:size style:style]; }
+ (instancetype)mapIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf279" size:size style:style]; }
+ (instancetype)mapMarkedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf59f" size:size style:style]; }
+ (instancetype)mapMarkedAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a0" size:size style:style]; }
+ (instancetype)mapMarkerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf041" size:size style:style]; }
+ (instancetype)mapMarkerAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c5" size:size style:style]; }
+ (instancetype)mapMarkerAltSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf605" size:size style:style]; }
+ (instancetype)mapMarkerCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf606" size:size style:style]; }
+ (instancetype)mapMarkerEditIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf607" size:size style:style]; }
+ (instancetype)mapMarkerExclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf608" size:size style:style]; }
+ (instancetype)mapMarkerMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf609" size:size style:style]; }
+ (instancetype)mapMarkerPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf60a" size:size style:style]; }
+ (instancetype)mapMarkerQuestionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf60b" size:size style:style]; }
+ (instancetype)mapMarkerSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf60c" size:size style:style]; }
+ (instancetype)mapMarkerSmileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf60d" size:size style:style]; }
+ (instancetype)mapMarkerTimesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf60e" size:size style:style]; }
+ (instancetype)mapPinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf276" size:size style:style]; }
+ (instancetype)mapSignsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf277" size:size style:style]; }
+ (instancetype)markdownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf60f" size:size style:style]; }
+ (instancetype)markerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a1" size:size style:style]; }
+ (instancetype)marsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf222" size:size style:style]; }
+ (instancetype)marsDoubleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf227" size:size style:style]; }
+ (instancetype)marsStrokeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf229" size:size style:style]; }
+ (instancetype)marsStrokeHIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf22b" size:size style:style]; }
+ (instancetype)marsStrokeVIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf22a" size:size style:style]; }
+ (instancetype)maskIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6fa" size:size style:style]; }
+ (instancetype)mastodonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f6" size:size style:style]; }
+ (instancetype)maxcdnIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf136" size:size style:style]; }
+ (instancetype)medalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a2" size:size style:style]; }
+ (instancetype)medappsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c6" size:size style:style]; }
+ (instancetype)mediumIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf23a" size:size style:style]; }
+ (instancetype)mediumMIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c7" size:size style:style]; }
+ (instancetype)medkitIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0fa" size:size style:style]; }
+ (instancetype)medrtIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c8" size:size style:style]; }
+ (instancetype)meetupIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e0" size:size style:style]; }
+ (instancetype)megaphoneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf675" size:size style:style]; }
+ (instancetype)megaportIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a3" size:size style:style]; }
+ (instancetype)mehIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf11a" size:size style:style]; }
+ (instancetype)mehBlankIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a4" size:size style:style]; }
+ (instancetype)mehRollingEyesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a5" size:size style:style]; }
+ (instancetype)memoryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf538" size:size style:style]; }
+ (instancetype)menorahIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf676" size:size style:style]; }
+ (instancetype)mercuryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf223" size:size style:style]; }
+ (instancetype)meteorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf753" size:size style:style]; }
+ (instancetype)microchipIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2db" size:size style:style]; }
+ (instancetype)microphoneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf130" size:size style:style]; }
+ (instancetype)microphoneAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3c9" size:size style:style]; }
+ (instancetype)microphoneAltSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf539" size:size style:style]; }
+ (instancetype)microphoneSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf131" size:size style:style]; }
+ (instancetype)microscopeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf610" size:size style:style]; }
+ (instancetype)microsoftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ca" size:size style:style]; }
+ (instancetype)mindShareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf677" size:size style:style]; }
+ (instancetype)minusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf068" size:size style:style]; }
+ (instancetype)minusCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf056" size:size style:style]; }
+ (instancetype)minusHexagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf307" size:size style:style]; }
+ (instancetype)minusOctagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf308" size:size style:style]; }
+ (instancetype)minusSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf146" size:size style:style]; }
+ (instancetype)mixIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3cb" size:size style:style]; }
+ (instancetype)mixcloudIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf289" size:size style:style]; }
+ (instancetype)mizuniIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3cc" size:size style:style]; }
+ (instancetype)mobileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf10b" size:size style:style]; }
+ (instancetype)mobileAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3cd" size:size style:style]; }
+ (instancetype)mobileAndroidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ce" size:size style:style]; }
+ (instancetype)mobileAndroidAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3cf" size:size style:style]; }
+ (instancetype)modxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf285" size:size style:style]; }
+ (instancetype)moneroIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d0" size:size style:style]; }
+ (instancetype)moneyBillIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d6" size:size style:style]; }
+ (instancetype)moneyBillAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d1" size:size style:style]; }
+ (instancetype)moneyBillWaveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf53a" size:size style:style]; }
+ (instancetype)moneyBillWaveAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf53b" size:size style:style]; }
+ (instancetype)moneyCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf53c" size:size style:style]; }
+ (instancetype)moneyCheckAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf53d" size:size style:style]; }
+ (instancetype)monitorHeartRateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf611" size:size style:style]; }
+ (instancetype)monkeyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6fb" size:size style:style]; }
+ (instancetype)monumentIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a6" size:size style:style]; }
+ (instancetype)moonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf186" size:size style:style]; }
+ (instancetype)moonCloudIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf754" size:size style:style]; }
+ (instancetype)moonStarsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf755" size:size style:style]; }
+ (instancetype)mortarPestleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a7" size:size style:style]; }
+ (instancetype)mosqueIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf678" size:size style:style]; }
+ (instancetype)motorcycleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf21c" size:size style:style]; }
+ (instancetype)mountainIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6fc" size:size style:style]; }
+ (instancetype)mountainsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6fd" size:size style:style]; }
+ (instancetype)mousePointerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf245" size:size style:style]; }
+ (instancetype)musicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf001" size:size style:style]; }
+ (instancetype)napsterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d2" size:size style:style]; }
+ (instancetype)narwhalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6fe" size:size style:style]; }
+ (instancetype)neosIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf612" size:size style:style]; }
+ (instancetype)networkWiredIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ff" size:size style:style]; }
+ (instancetype)neuterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf22c" size:size style:style]; }
+ (instancetype)newspaperIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ea" size:size style:style]; }
+ (instancetype)nimblrIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a8" size:size style:style]; }
+ (instancetype)nintendoSwitchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf418" size:size style:style]; }
+ (instancetype)nodeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf419" size:size style:style]; }
+ (instancetype)nodeJsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d3" size:size style:style]; }
+ (instancetype)notEqualIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf53e" size:size style:style]; }
+ (instancetype)notesMedicalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf481" size:size style:style]; }
+ (instancetype)npmIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d4" size:size style:style]; }
+ (instancetype)ns8IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d5" size:size style:style]; }
+ (instancetype)nutritionixIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d6" size:size style:style]; }
+ (instancetype)objectGroupIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf247" size:size style:style]; }
+ (instancetype)objectUngroupIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf248" size:size style:style]; }
+ (instancetype)octagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf306" size:size style:style]; }
+ (instancetype)odnoklassnikiIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf263" size:size style:style]; }
+ (instancetype)odnoklassnikiSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf264" size:size style:style]; }
+ (instancetype)oilCanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf613" size:size style:style]; }
+ (instancetype)oilTempIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf614" size:size style:style]; }
+ (instancetype)oldRepublicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf510" size:size style:style]; }
+ (instancetype)omIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf679" size:size style:style]; }
+ (instancetype)omegaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf67a" size:size style:style]; }
+ (instancetype)opencartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf23d" size:size style:style]; }
+ (instancetype)openidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf19b" size:size style:style]; }
+ (instancetype)operaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf26a" size:size style:style]; }
+ (instancetype)optinMonsterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf23c" size:size style:style]; }
+ (instancetype)osiIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf41a" size:size style:style]; }
+ (instancetype)otterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf700" size:size style:style]; }
+ (instancetype)outdentIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf03b" size:size style:style]; }
+ (instancetype)page4IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d7" size:size style:style]; }
+ (instancetype)pagelinesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf18c" size:size style:style]; }
+ (instancetype)paintBrushIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1fc" size:size style:style]; }
+ (instancetype)paintBrushAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5a9" size:size style:style]; }
+ (instancetype)paintRollerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5aa" size:size style:style]; }
+ (instancetype)paletteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf53f" size:size style:style]; }
+ (instancetype)palfedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d8" size:size style:style]; }
+ (instancetype)palletIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf482" size:size style:style]; }
+ (instancetype)palletAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf483" size:size style:style]; }
+ (instancetype)paperPlaneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d8" size:size style:style]; }
+ (instancetype)paperclipIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c6" size:size style:style]; }
+ (instancetype)parachuteBoxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4cd" size:size style:style]; }
+ (instancetype)paragraphIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1dd" size:size style:style]; }
+ (instancetype)parkingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf540" size:size style:style]; }
+ (instancetype)parkingCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf615" size:size style:style]; }
+ (instancetype)parkingCircleSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf616" size:size style:style]; }
+ (instancetype)parkingSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf617" size:size style:style]; }
+ (instancetype)passportIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ab" size:size style:style]; }
+ (instancetype)pastafarianismIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf67b" size:size style:style]; }
+ (instancetype)pasteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ea" size:size style:style]; }
+ (instancetype)patreonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3d9" size:size style:style]; }
+ (instancetype)pauseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf04c" size:size style:style]; }
+ (instancetype)pauseCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf28b" size:size style:style]; }
+ (instancetype)pawIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b0" size:size style:style]; }
+ (instancetype)pawAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf701" size:size style:style]; }
+ (instancetype)pawClawsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf702" size:size style:style]; }
+ (instancetype)paypalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ed" size:size style:style]; }
+ (instancetype)peaceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf67c" size:size style:style]; }
+ (instancetype)pegasusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf703" size:size style:style]; }
+ (instancetype)penIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf304" size:size style:style]; }
+ (instancetype)penAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf305" size:size style:style]; }
+ (instancetype)penFancyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ac" size:size style:style]; }
+ (instancetype)penNibIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ad" size:size style:style]; }
+ (instancetype)penSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf14b" size:size style:style]; }
+ (instancetype)pencilIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf040" size:size style:style]; }
+ (instancetype)pencilAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf303" size:size style:style]; }
+ (instancetype)pencilPaintbrushIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf618" size:size style:style]; }
+ (instancetype)pencilRulerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ae" size:size style:style]; }
+ (instancetype)pennantIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf456" size:size style:style]; }
+ (instancetype)pennyArcadeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf704" size:size style:style]; }
+ (instancetype)peopleCarryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ce" size:size style:style]; }
+ (instancetype)percentIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf295" size:size style:style]; }
+ (instancetype)percentageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf541" size:size style:style]; }
+ (instancetype)periscopeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3da" size:size style:style]; }
+ (instancetype)personBoothIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf756" size:size style:style]; }
+ (instancetype)personCarryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4cf" size:size style:style]; }
+ (instancetype)personDollyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d0" size:size style:style]; }
+ (instancetype)personDollyEmptyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d1" size:size style:style]; }
+ (instancetype)personSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf757" size:size style:style]; }
+ (instancetype)phabricatorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3db" size:size style:style]; }
+ (instancetype)phoenixFrameworkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3dc" size:size style:style]; }
+ (instancetype)phoenixSquadronIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf511" size:size style:style]; }
+ (instancetype)phoneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf095" size:size style:style]; }
+ (instancetype)phoneOfficeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf67d" size:size style:style]; }
+ (instancetype)phonePlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d2" size:size style:style]; }
+ (instancetype)phoneSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3dd" size:size style:style]; }
+ (instancetype)phoneSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf098" size:size style:style]; }
+ (instancetype)phoneVolumeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a0" size:size style:style]; }
+ (instancetype)phpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf457" size:size style:style]; }
+ (instancetype)piIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf67e" size:size style:style]; }
+ (instancetype)pieIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf705" size:size style:style]; }
+ (instancetype)piedPiperIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ae" size:size style:style]; }
+ (instancetype)piedPiperAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a8" size:size style:style]; }
+ (instancetype)piedPiperHatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e5" size:size style:style]; }
+ (instancetype)piedPiperPpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a7" size:size style:style]; }
+ (instancetype)pigIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf706" size:size style:style]; }
+ (instancetype)piggyBankIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d3" size:size style:style]; }
+ (instancetype)pillsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf484" size:size style:style]; }
+ (instancetype)pinterestIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d2" size:size style:style]; }
+ (instancetype)pinterestPIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf231" size:size style:style]; }
+ (instancetype)pinterestSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d3" size:size style:style]; }
+ (instancetype)placeOfWorshipIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf67f" size:size style:style]; }
+ (instancetype)planeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf072" size:size style:style]; }
+ (instancetype)planeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3de" size:size style:style]; }
+ (instancetype)planeArrivalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5af" size:size style:style]; }
+ (instancetype)planeDepartureIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b0" size:size style:style]; }
+ (instancetype)playIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf04b" size:size style:style]; }
+ (instancetype)playCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf144" size:size style:style]; }
+ (instancetype)playstationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3df" size:size style:style]; }
+ (instancetype)plugIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e6" size:size style:style]; }
+ (instancetype)plusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf067" size:size style:style]; }
+ (instancetype)plusCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf055" size:size style:style]; }
+ (instancetype)plusHexagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf300" size:size style:style]; }
+ (instancetype)plusOctagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf301" size:size style:style]; }
+ (instancetype)plusSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0fe" size:size style:style]; }
+ (instancetype)podcastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ce" size:size style:style]; }
+ (instancetype)podiumIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf680" size:size style:style]; }
+ (instancetype)podiumStarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf758" size:size style:style]; }
+ (instancetype)pollIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf681" size:size style:style]; }
+ (instancetype)pollHIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf682" size:size style:style]; }
+ (instancetype)pollPeopleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf759" size:size style:style]; }
+ (instancetype)pooIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2fe" size:size style:style]; }
+ (instancetype)pooStormIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf75a" size:size style:style]; }
+ (instancetype)poopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf619" size:size style:style]; }
+ (instancetype)portraitIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e0" size:size style:style]; }
+ (instancetype)poundSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf154" size:size style:style]; }
+ (instancetype)powerOffIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf011" size:size style:style]; }
+ (instancetype)prayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf683" size:size style:style]; }
+ (instancetype)prayingHandsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf684" size:size style:style]; }
+ (instancetype)prescriptionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b1" size:size style:style]; }
+ (instancetype)prescriptionBottleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf485" size:size style:style]; }
+ (instancetype)prescriptionBottleAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf486" size:size style:style]; }
+ (instancetype)presentationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf685" size:size style:style]; }
+ (instancetype)printIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf02f" size:size style:style]; }
+ (instancetype)printSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf686" size:size style:style]; }
+ (instancetype)proceduresIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf487" size:size style:style]; }
+ (instancetype)productHuntIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf288" size:size style:style]; }
+ (instancetype)projectDiagramIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf542" size:size style:style]; }
+ (instancetype)pumpkinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf707" size:size style:style]; }
+ (instancetype)pushedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e1" size:size style:style]; }
+ (instancetype)puzzlePieceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf12e" size:size style:style]; }
+ (instancetype)pythonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e2" size:size style:style]; }
+ (instancetype)qqIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d6" size:size style:style]; }
+ (instancetype)qrcodeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf029" size:size style:style]; }
+ (instancetype)questionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf128" size:size style:style]; }
+ (instancetype)questionCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf059" size:size style:style]; }
+ (instancetype)questionSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2fd" size:size style:style]; }
+ (instancetype)quidditchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf458" size:size style:style]; }
+ (instancetype)quinscapeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf459" size:size style:style]; }
+ (instancetype)quoraIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c4" size:size style:style]; }
+ (instancetype)quoteLeftIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf10d" size:size style:style]; }
+ (instancetype)quoteRightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf10e" size:size style:style]; }
+ (instancetype)quranIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf687" size:size style:style]; }
+ (instancetype)rProjectIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f7" size:size style:style]; }
+ (instancetype)rabbitIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf708" size:size style:style]; }
+ (instancetype)rabbitFastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf709" size:size style:style]; }
+ (instancetype)racquetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf45a" size:size style:style]; }
+ (instancetype)rainbowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf75b" size:size style:style]; }
+ (instancetype)raindropsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf75c" size:size style:style]; }
+ (instancetype)ramIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf70a" size:size style:style]; }
+ (instancetype)rampLoadingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d4" size:size style:style]; }
+ (instancetype)randomIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf074" size:size style:style]; }
+ (instancetype)ravelryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d9" size:size style:style]; }
+ (instancetype)reactIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf41b" size:size style:style]; }
+ (instancetype)reacteuropeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf75d" size:size style:style]; }
+ (instancetype)readmeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d5" size:size style:style]; }
+ (instancetype)rebelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d0" size:size style:style]; }
+ (instancetype)receiptIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf543" size:size style:style]; }
+ (instancetype)rectangleLandscapeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2fa" size:size style:style]; }
+ (instancetype)rectanglePortraitIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2fb" size:size style:style]; }
+ (instancetype)rectangleWideIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2fc" size:size style:style]; }
+ (instancetype)recycleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b8" size:size style:style]; }
+ (instancetype)redRiverIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e3" size:size style:style]; }
+ (instancetype)redditIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a1" size:size style:style]; }
+ (instancetype)redditAlienIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf281" size:size style:style]; }
+ (instancetype)redditSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a2" size:size style:style]; }
+ (instancetype)redoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf01e" size:size style:style]; }
+ (instancetype)redoAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f9" size:size style:style]; }
+ (instancetype)registeredIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf25d" size:size style:style]; }
+ (instancetype)renrenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf18b" size:size style:style]; }
+ (instancetype)repeatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf363" size:size style:style]; }
+ (instancetype)repeat1IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf365" size:size style:style]; }
+ (instancetype)repeat1AltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf366" size:size style:style]; }
+ (instancetype)repeatAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf364" size:size style:style]; }
+ (instancetype)replyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e5" size:size style:style]; }
+ (instancetype)replyAllIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf122" size:size style:style]; }
+ (instancetype)replydIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e6" size:size style:style]; }
+ (instancetype)republicanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf75e" size:size style:style]; }
+ (instancetype)researchgateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f8" size:size style:style]; }
+ (instancetype)resolvingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e7" size:size style:style]; }
+ (instancetype)retweetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf079" size:size style:style]; }
+ (instancetype)retweetAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf361" size:size style:style]; }
+ (instancetype)revIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b2" size:size style:style]; }
+ (instancetype)ribbonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d6" size:size style:style]; }
+ (instancetype)ringIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf70b" size:size style:style]; }
+ (instancetype)roadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf018" size:size style:style]; }
+ (instancetype)robotIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf544" size:size style:style]; }
+ (instancetype)rocketIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf135" size:size style:style]; }
+ (instancetype)rocketchatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e8" size:size style:style]; }
+ (instancetype)rockrmsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e9" size:size style:style]; }
+ (instancetype)routeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d7" size:size style:style]; }
+ (instancetype)routeHighwayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf61a" size:size style:style]; }
+ (instancetype)routeInterstateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf61b" size:size style:style]; }
+ (instancetype)rssIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf09e" size:size style:style]; }
+ (instancetype)rssSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf143" size:size style:style]; }
+ (instancetype)rubleSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf158" size:size style:style]; }
+ (instancetype)rulerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf545" size:size style:style]; }
+ (instancetype)rulerCombinedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf546" size:size style:style]; }
+ (instancetype)rulerHorizontalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf547" size:size style:style]; }
+ (instancetype)rulerTriangleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf61c" size:size style:style]; }
+ (instancetype)rulerVerticalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf548" size:size style:style]; }
+ (instancetype)runningIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf70c" size:size style:style]; }
+ (instancetype)rupeeSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf156" size:size style:style]; }
+ (instancetype)sadCryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b3" size:size style:style]; }
+ (instancetype)sadTearIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b4" size:size style:style]; }
+ (instancetype)safariIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf267" size:size style:style]; }
+ (instancetype)sassIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf41e" size:size style:style]; }
+ (instancetype)saveIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c7" size:size style:style]; }
+ (instancetype)scalpelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf61d" size:size style:style]; }
+ (instancetype)scalpelPathIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf61e" size:size style:style]; }
+ (instancetype)scannerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf488" size:size style:style]; }
+ (instancetype)scannerKeyboardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf489" size:size style:style]; }
+ (instancetype)scannerTouchscreenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf48a" size:size style:style]; }
+ (instancetype)scarecrowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf70d" size:size style:style]; }
+ (instancetype)schlixIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ea" size:size style:style]; }
+ (instancetype)schoolIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf549" size:size style:style]; }
+ (instancetype)screwdriverIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf54a" size:size style:style]; }
+ (instancetype)scribdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf28a" size:size style:style]; }
+ (instancetype)scrollIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf70e" size:size style:style]; }
+ (instancetype)scrollOldIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf70f" size:size style:style]; }
+ (instancetype)scrubberIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f8" size:size style:style]; }
+ (instancetype)scytheIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf710" size:size style:style]; }
+ (instancetype)searchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf002" size:size style:style]; }
+ (instancetype)searchDollarIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf688" size:size style:style]; }
+ (instancetype)searchLocationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf689" size:size style:style]; }
+ (instancetype)searchMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf010" size:size style:style]; }
+ (instancetype)searchPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf00e" size:size style:style]; }
+ (instancetype)searchenginIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3eb" size:size style:style]; }
+ (instancetype)seedlingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d8" size:size style:style]; }
+ (instancetype)sellcastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2da" size:size style:style]; }
+ (instancetype)sellsyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf213" size:size style:style]; }
+ (instancetype)serverIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf233" size:size style:style]; }
+ (instancetype)servicestackIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ec" size:size style:style]; }
+ (instancetype)shapesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf61f" size:size style:style]; }
+ (instancetype)shareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf064" size:size style:style]; }
+ (instancetype)shareAllIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf367" size:size style:style]; }
+ (instancetype)shareAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e0" size:size style:style]; }
+ (instancetype)shareAltSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e1" size:size style:style]; }
+ (instancetype)shareSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf14d" size:size style:style]; }
+ (instancetype)sheepIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf711" size:size style:style]; }
+ (instancetype)shekelSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf20b" size:size style:style]; }
+ (instancetype)shieldIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf132" size:size style:style]; }
+ (instancetype)shieldAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ed" size:size style:style]; }
+ (instancetype)shieldCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f7" size:size style:style]; }
+ (instancetype)shieldCrossIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf712" size:size style:style]; }
+ (instancetype)shipIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf21a" size:size style:style]; }
+ (instancetype)shippingFastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf48b" size:size style:style]; }
+ (instancetype)shippingTimedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf48c" size:size style:style]; }
+ (instancetype)shirtsinbulkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf214" size:size style:style]; }
+ (instancetype)shoePrintsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf54b" size:size style:style]; }
+ (instancetype)shoppingBagIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf290" size:size style:style]; }
+ (instancetype)shoppingBasketIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf291" size:size style:style]; }
+ (instancetype)shoppingCartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf07a" size:size style:style]; }
+ (instancetype)shopwareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b5" size:size style:style]; }
+ (instancetype)shovelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf713" size:size style:style]; }
+ (instancetype)showerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2cc" size:size style:style]; }
+ (instancetype)shredderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf68a" size:size style:style]; }
+ (instancetype)shuttleVanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b6" size:size style:style]; }
+ (instancetype)shuttlecockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf45b" size:size style:style]; }
+ (instancetype)sigmaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf68b" size:size style:style]; }
+ (instancetype)signIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4d9" size:size style:style]; }
+ (instancetype)signInIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf090" size:size style:style]; }
+ (instancetype)signInAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f6" size:size style:style]; }
+ (instancetype)signLanguageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a7" size:size style:style]; }
+ (instancetype)signOutIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf08b" size:size style:style]; }
+ (instancetype)signOutAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f5" size:size style:style]; }
+ (instancetype)signalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf012" size:size style:style]; }
+ (instancetype)signal1IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf68c" size:size style:style]; }
+ (instancetype)signal2IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf68d" size:size style:style]; }
+ (instancetype)signal3IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf68e" size:size style:style]; }
+ (instancetype)signal4IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf68f" size:size style:style]; }
+ (instancetype)signalAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf690" size:size style:style]; }
+ (instancetype)signalAlt1IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf691" size:size style:style]; }
+ (instancetype)signalAlt2IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf692" size:size style:style]; }
+ (instancetype)signalAlt3IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf693" size:size style:style]; }
+ (instancetype)signalAltSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf694" size:size style:style]; }
+ (instancetype)signalSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf695" size:size style:style]; }
+ (instancetype)signatureIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b7" size:size style:style]; }
+ (instancetype)simplybuiltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf215" size:size style:style]; }
+ (instancetype)sistrixIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ee" size:size style:style]; }
+ (instancetype)sitemapIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e8" size:size style:style]; }
+ (instancetype)sithIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf512" size:size style:style]; }
+ (instancetype)skeletonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf620" size:size style:style]; }
+ (instancetype)skullIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf54c" size:size style:style]; }
+ (instancetype)skullCrossbonesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf714" size:size style:style]; }
+ (instancetype)skyatlasIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf216" size:size style:style]; }
+ (instancetype)skypeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf17e" size:size style:style]; }
+ (instancetype)slackIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf198" size:size style:style]; }
+ (instancetype)slackHashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ef" size:size style:style]; }
+ (instancetype)slashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf715" size:size style:style]; }
+ (instancetype)slidersHIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1de" size:size style:style]; }
+ (instancetype)slidersHSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f0" size:size style:style]; }
+ (instancetype)slidersVIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f1" size:size style:style]; }
+ (instancetype)slidersVSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f2" size:size style:style]; }
+ (instancetype)slideshareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e7" size:size style:style]; }
+ (instancetype)smileIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf118" size:size style:style]; }
+ (instancetype)smileBeamIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b8" size:size style:style]; }
+ (instancetype)smilePlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5b9" size:size style:style]; }
+ (instancetype)smileWinkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4da" size:size style:style]; }
+ (instancetype)smogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf75f" size:size style:style]; }
+ (instancetype)smokeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf760" size:size style:style]; }
+ (instancetype)smokingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf48d" size:size style:style]; }
+ (instancetype)smokingBanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf54d" size:size style:style]; }
+ (instancetype)snakeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf716" size:size style:style]; }
+ (instancetype)snapchatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ab" size:size style:style]; }
+ (instancetype)snapchatGhostIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ac" size:size style:style]; }
+ (instancetype)snapchatSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ad" size:size style:style]; }
+ (instancetype)snowBlowingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf761" size:size style:style]; }
+ (instancetype)snowflakeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2dc" size:size style:style]; }
+ (instancetype)socksIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf696" size:size style:style]; }
+ (instancetype)solarPanelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ba" size:size style:style]; }
+ (instancetype)sortIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0dc" size:size style:style]; }
+ (instancetype)sortAlphaDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf15d" size:size style:style]; }
+ (instancetype)sortAlphaUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf15e" size:size style:style]; }
+ (instancetype)sortAmountDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf160" size:size style:style]; }
+ (instancetype)sortAmountUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf161" size:size style:style]; }
+ (instancetype)sortDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0dd" size:size style:style]; }
+ (instancetype)sortNumericDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf162" size:size style:style]; }
+ (instancetype)sortNumericUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf163" size:size style:style]; }
+ (instancetype)sortUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0de" size:size style:style]; }
+ (instancetype)soundcloudIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1be" size:size style:style]; }
+ (instancetype)spaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5bb" size:size style:style]; }
+ (instancetype)spaceShuttleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf197" size:size style:style]; }
+ (instancetype)spadeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f4" size:size style:style]; }
+ (instancetype)speakapIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f3" size:size style:style]; }
+ (instancetype)spiderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf717" size:size style:style]; }
+ (instancetype)spiderBlackWidowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf718" size:size style:style]; }
+ (instancetype)spiderWebIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf719" size:size style:style]; }
+ (instancetype)spinnerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf110" size:size style:style]; }
+ (instancetype)spinnerThirdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f4" size:size style:style]; }
+ (instancetype)splotchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5bc" size:size style:style]; }
+ (instancetype)spotifyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1bc" size:size style:style]; }
+ (instancetype)sprayCanIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5bd" size:size style:style]; }
+ (instancetype)squareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c8" size:size style:style]; }
+ (instancetype)squareFullIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf45c" size:size style:style]; }
+ (instancetype)squareRootIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf697" size:size style:style]; }
+ (instancetype)squareRootAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf698" size:size style:style]; }
+ (instancetype)squarespaceIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5be" size:size style:style]; }
+ (instancetype)squirrelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf71a" size:size style:style]; }
+ (instancetype)stackExchangeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf18d" size:size style:style]; }
+ (instancetype)stackOverflowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf16c" size:size style:style]; }
+ (instancetype)staffIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf71b" size:size style:style]; }
+ (instancetype)stampIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5bf" size:size style:style]; }
+ (instancetype)starIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf005" size:size style:style]; }
+ (instancetype)starAndCrescentIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf699" size:size style:style]; }
+ (instancetype)starExclamationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f3" size:size style:style]; }
+ (instancetype)starHalfIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf089" size:size style:style]; }
+ (instancetype)starHalfAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c0" size:size style:style]; }
+ (instancetype)starOfDavidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf69a" size:size style:style]; }
+ (instancetype)starOfLifeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf621" size:size style:style]; }
+ (instancetype)starsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf762" size:size style:style]; }
+ (instancetype)staylinkedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f5" size:size style:style]; }
+ (instancetype)steamIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b6" size:size style:style]; }
+ (instancetype)steamSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1b7" size:size style:style]; }
+ (instancetype)steamSymbolIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f6" size:size style:style]; }
+ (instancetype)steeringWheelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf622" size:size style:style]; }
+ (instancetype)stepBackwardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf048" size:size style:style]; }
+ (instancetype)stepForwardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf051" size:size style:style]; }
+ (instancetype)stethoscopeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0f1" size:size style:style]; }
+ (instancetype)stickerMuleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f7" size:size style:style]; }
+ (instancetype)stickyNoteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf249" size:size style:style]; }
+ (instancetype)stomachIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf623" size:size style:style]; }
+ (instancetype)stopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf04d" size:size style:style]; }
+ (instancetype)stopCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf28d" size:size style:style]; }
+ (instancetype)stopwatchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f2" size:size style:style]; }
+ (instancetype)storeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf54e" size:size style:style]; }
+ (instancetype)storeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf54f" size:size style:style]; }
+ (instancetype)stravaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf428" size:size style:style]; }
+ (instancetype)streamIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf550" size:size style:style]; }
+ (instancetype)streetViewIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf21d" size:size style:style]; }
+ (instancetype)strikethroughIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0cc" size:size style:style]; }
+ (instancetype)stripeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf429" size:size style:style]; }
+ (instancetype)stripeSIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf42a" size:size style:style]; }
+ (instancetype)stroopwafelIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf551" size:size style:style]; }
+ (instancetype)studiovinariIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f8" size:size style:style]; }
+ (instancetype)stumbleuponIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a4" size:size style:style]; }
+ (instancetype)stumbleuponCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1a3" size:size style:style]; }
+ (instancetype)subscriptIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf12c" size:size style:style]; }
+ (instancetype)subwayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf239" size:size style:style]; }
+ (instancetype)suitcaseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0f2" size:size style:style]; }
+ (instancetype)suitcaseRollingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c1" size:size style:style]; }
+ (instancetype)sunIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf185" size:size style:style]; }
+ (instancetype)sunCloudIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf763" size:size style:style]; }
+ (instancetype)sunDustIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf764" size:size style:style]; }
+ (instancetype)sunHazeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf765" size:size style:style]; }
+ (instancetype)sunriseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf766" size:size style:style]; }
+ (instancetype)sunsetIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf767" size:size style:style]; }
+ (instancetype)superpowersIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2dd" size:size style:style]; }
+ (instancetype)superscriptIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf12b" size:size style:style]; }
+ (instancetype)suppleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3f9" size:size style:style]; }
+ (instancetype)surpriseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c2" size:size style:style]; }
+ (instancetype)swatchbookIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c3" size:size style:style]; }
+ (instancetype)swimmerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c4" size:size style:style]; }
+ (instancetype)swimmingPoolIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c5" size:size style:style]; }
+ (instancetype)swordIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf71c" size:size style:style]; }
+ (instancetype)swordsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf71d" size:size style:style]; }
+ (instancetype)synagogueIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf69b" size:size style:style]; }
+ (instancetype)syncIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf021" size:size style:style]; }
+ (instancetype)syncAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f1" size:size style:style]; }
+ (instancetype)syringeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf48e" size:size style:style]; }
+ (instancetype)tableIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ce" size:size style:style]; }
+ (instancetype)tableTennisIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf45d" size:size style:style]; }
+ (instancetype)tabletIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf10a" size:size style:style]; }
+ (instancetype)tabletAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3fa" size:size style:style]; }
+ (instancetype)tabletAndroidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3fb" size:size style:style]; }
+ (instancetype)tabletAndroidAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3fc" size:size style:style]; }
+ (instancetype)tabletRuggedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf48f" size:size style:style]; }
+ (instancetype)tabletsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf490" size:size style:style]; }
+ (instancetype)tachometerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e4" size:size style:style]; }
+ (instancetype)tachometerAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3fd" size:size style:style]; }
+ (instancetype)tachometerAltAverageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf624" size:size style:style]; }
+ (instancetype)tachometerAltFastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf625" size:size style:style]; }
+ (instancetype)tachometerAltFastestIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf626" size:size style:style]; }
+ (instancetype)tachometerAltSlowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf627" size:size style:style]; }
+ (instancetype)tachometerAltSlowestIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf628" size:size style:style]; }
+ (instancetype)tachometerAverageIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf629" size:size style:style]; }
+ (instancetype)tachometerFastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf62a" size:size style:style]; }
+ (instancetype)tachometerFastestIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf62b" size:size style:style]; }
+ (instancetype)tachometerSlowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf62c" size:size style:style]; }
+ (instancetype)tachometerSlowestIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf62d" size:size style:style]; }
+ (instancetype)tagIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf02b" size:size style:style]; }
+ (instancetype)tagsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf02c" size:size style:style]; }
+ (instancetype)tallyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf69c" size:size style:style]; }
+ (instancetype)tapeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4db" size:size style:style]; }
+ (instancetype)tasksIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ae" size:size style:style]; }
+ (instancetype)taxiIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ba" size:size style:style]; }
+ (instancetype)teamspeakIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4f9" size:size style:style]; }
+ (instancetype)teethIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf62e" size:size style:style]; }
+ (instancetype)teethOpenIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf62f" size:size style:style]; }
+ (instancetype)telegramIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c6" size:size style:style]; }
+ (instancetype)telegramPlaneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3fe" size:size style:style]; }
+ (instancetype)temperatureFrigidIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf768" size:size style:style]; }
+ (instancetype)temperatureHighIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf769" size:size style:style]; }
+ (instancetype)temperatureHotIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf76a" size:size style:style]; }
+ (instancetype)temperatureLowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf76b" size:size style:style]; }
+ (instancetype)tencentWeiboIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d5" size:size style:style]; }
+ (instancetype)tennisBallIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf45e" size:size style:style]; }
+ (instancetype)terminalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf120" size:size style:style]; }
+ (instancetype)textHeightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf034" size:size style:style]; }
+ (instancetype)textWidthIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf035" size:size style:style]; }
+ (instancetype)thIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf00a" size:size style:style]; }
+ (instancetype)thLargeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf009" size:size style:style]; }
+ (instancetype)thListIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf00b" size:size style:style]; }
+ (instancetype)theRedYetiIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf69d" size:size style:style]; }
+ (instancetype)theaterMasksIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf630" size:size style:style]; }
+ (instancetype)themecoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c6" size:size style:style]; }
+ (instancetype)themeisleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b2" size:size style:style]; }
+ (instancetype)thermometerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf491" size:size style:style]; }
+ (instancetype)thermometerEmptyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2cb" size:size style:style]; }
+ (instancetype)thermometerFullIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c7" size:size style:style]; }
+ (instancetype)thermometerHalfIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c9" size:size style:style]; }
+ (instancetype)thermometerQuarterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ca" size:size style:style]; }
+ (instancetype)thermometerThreeQuartersIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2c8" size:size style:style]; }
+ (instancetype)thetaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf69e" size:size style:style]; }
+ (instancetype)thinkPeaksIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf731" size:size style:style]; }
+ (instancetype)thumbsDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf165" size:size style:style]; }
+ (instancetype)thumbsUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf164" size:size style:style]; }
+ (instancetype)thumbtackIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf08d" size:size style:style]; }
+ (instancetype)thunderstormIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf76c" size:size style:style]; }
+ (instancetype)thunderstormMoonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf76d" size:size style:style]; }
+ (instancetype)thunderstormSunIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf76e" size:size style:style]; }
+ (instancetype)ticketIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf145" size:size style:style]; }
+ (instancetype)ticketAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3ff" size:size style:style]; }
+ (instancetype)tildeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf69f" size:size style:style]; }
+ (instancetype)timesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf00d" size:size style:style]; }
+ (instancetype)timesCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf057" size:size style:style]; }
+ (instancetype)timesHexagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ee" size:size style:style]; }
+ (instancetype)timesOctagonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2f0" size:size style:style]; }
+ (instancetype)timesSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d3" size:size style:style]; }
+ (instancetype)tintIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf043" size:size style:style]; }
+ (instancetype)tintSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c7" size:size style:style]; }
+ (instancetype)tireIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf631" size:size style:style]; }
+ (instancetype)tireFlatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf632" size:size style:style]; }
+ (instancetype)tirePressureWarningIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf633" size:size style:style]; }
+ (instancetype)tireRuggedIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf634" size:size style:style]; }
+ (instancetype)tiredIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c8" size:size style:style]; }
+ (instancetype)toggleOffIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf204" size:size style:style]; }
+ (instancetype)toggleOnIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf205" size:size style:style]; }
+ (instancetype)toiletPaperIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf71e" size:size style:style]; }
+ (instancetype)toiletPaperAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf71f" size:size style:style]; }
+ (instancetype)tombstoneIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf720" size:size style:style]; }
+ (instancetype)tombstoneAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf721" size:size style:style]; }
+ (instancetype)toolboxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf552" size:size style:style]; }
+ (instancetype)toothIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5c9" size:size style:style]; }
+ (instancetype)toothbrushIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf635" size:size style:style]; }
+ (instancetype)torahIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a0" size:size style:style]; }
+ (instancetype)toriiGateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a1" size:size style:style]; }
+ (instancetype)tornadoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf76f" size:size style:style]; }
+ (instancetype)tractorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf722" size:size style:style]; }
+ (instancetype)tradeFederationIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf513" size:size style:style]; }
+ (instancetype)trademarkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf25c" size:size style:style]; }
+ (instancetype)trafficConeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf636" size:size style:style]; }
+ (instancetype)trafficLightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf637" size:size style:style]; }
+ (instancetype)trafficLightGoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf638" size:size style:style]; }
+ (instancetype)trafficLightSlowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf639" size:size style:style]; }
+ (instancetype)trafficLightStopIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf63a" size:size style:style]; }
+ (instancetype)trainIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf238" size:size style:style]; }
+ (instancetype)transgenderIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf224" size:size style:style]; }
+ (instancetype)transgenderAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf225" size:size style:style]; }
+ (instancetype)trashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1f8" size:size style:style]; }
+ (instancetype)trashAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ed" size:size style:style]; }
+ (instancetype)treasureChestIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf723" size:size style:style]; }
+ (instancetype)treeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1bb" size:size style:style]; }
+ (instancetype)treeAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf400" size:size style:style]; }
+ (instancetype)treesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf724" size:size style:style]; }
+ (instancetype)trelloIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf181" size:size style:style]; }
+ (instancetype)triangleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ec" size:size style:style]; }
+ (instancetype)tripadvisorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf262" size:size style:style]; }
+ (instancetype)trophyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf091" size:size style:style]; }
+ (instancetype)trophyAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2eb" size:size style:style]; }
+ (instancetype)truckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0d1" size:size style:style]; }
+ (instancetype)truckContainerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4dc" size:size style:style]; }
+ (instancetype)truckCouchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4dd" size:size style:style]; }
+ (instancetype)truckLoadingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4de" size:size style:style]; }
+ (instancetype)truckMonsterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf63b" size:size style:style]; }
+ (instancetype)truckMovingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4df" size:size style:style]; }
+ (instancetype)truckPickupIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf63c" size:size style:style]; }
+ (instancetype)truckRampIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e0" size:size style:style]; }
+ (instancetype)tshirtIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf553" size:size style:style]; }
+ (instancetype)ttyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e4" size:size style:style]; }
+ (instancetype)tumblrIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf173" size:size style:style]; }
+ (instancetype)tumblrSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf174" size:size style:style]; }
+ (instancetype)turkeyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf725" size:size style:style]; }
+ (instancetype)turtleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf726" size:size style:style]; }
+ (instancetype)tvIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf26c" size:size style:style]; }
+ (instancetype)tvRetroIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf401" size:size style:style]; }
+ (instancetype)twitchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e8" size:size style:style]; }
+ (instancetype)twitterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf099" size:size style:style]; }
+ (instancetype)twitterSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf081" size:size style:style]; }
+ (instancetype)typo3IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf42b" size:size style:style]; }
+ (instancetype)uberIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf402" size:size style:style]; }
+ (instancetype)uikitIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf403" size:size style:style]; }
+ (instancetype)umbrellaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e9" size:size style:style]; }
+ (instancetype)umbrellaBeachIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ca" size:size style:style]; }
+ (instancetype)underlineIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0cd" size:size style:style]; }
+ (instancetype)undoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0e2" size:size style:style]; }
+ (instancetype)undoAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2ea" size:size style:style]; }
+ (instancetype)unicornIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf727" size:size style:style]; }
+ (instancetype)unionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a2" size:size style:style]; }
+ (instancetype)uniregistryIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf404" size:size style:style]; }
+ (instancetype)universalAccessIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf29a" size:size style:style]; }
+ (instancetype)universityIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf19c" size:size style:style]; }
+ (instancetype)unlinkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf127" size:size style:style]; }
+ (instancetype)unlockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf09c" size:size style:style]; }
+ (instancetype)unlockAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf13e" size:size style:style]; }
+ (instancetype)untappdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf405" size:size style:style]; }
+ (instancetype)uploadIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf093" size:size style:style]; }
+ (instancetype)usbIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf287" size:size style:style]; }
+ (instancetype)usdCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e8" size:size style:style]; }
+ (instancetype)usdSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e9" size:size style:style]; }
+ (instancetype)userIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf007" size:size style:style]; }
+ (instancetype)userAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf406" size:size style:style]; }
+ (instancetype)userAltSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4fa" size:size style:style]; }
+ (instancetype)userAstronautIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4fb" size:size style:style]; }
+ (instancetype)userChartIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a3" size:size style:style]; }
+ (instancetype)userCheckIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4fc" size:size style:style]; }
+ (instancetype)userCircleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2bd" size:size style:style]; }
+ (instancetype)userClockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4fd" size:size style:style]; }
+ (instancetype)userCogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4fe" size:size style:style]; }
+ (instancetype)userCrownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a4" size:size style:style]; }
+ (instancetype)userEditIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4ff" size:size style:style]; }
+ (instancetype)userFriendsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf500" size:size style:style]; }
+ (instancetype)userGraduateIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf501" size:size style:style]; }
+ (instancetype)userInjuredIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf728" size:size style:style]; }
+ (instancetype)userLockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf502" size:size style:style]; }
+ (instancetype)userMdIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0f0" size:size style:style]; }
+ (instancetype)userMinusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf503" size:size style:style]; }
+ (instancetype)userNinjaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf504" size:size style:style]; }
+ (instancetype)userPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf234" size:size style:style]; }
+ (instancetype)userSecretIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf21b" size:size style:style]; }
+ (instancetype)userShieldIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf505" size:size style:style]; }
+ (instancetype)userSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf506" size:size style:style]; }
+ (instancetype)userTagIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf507" size:size style:style]; }
+ (instancetype)userTieIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf508" size:size style:style]; }
+ (instancetype)userTimesIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf235" size:size style:style]; }
+ (instancetype)usersIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0c0" size:size style:style]; }
+ (instancetype)usersClassIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf63d" size:size style:style]; }
+ (instancetype)usersCogIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf509" size:size style:style]; }
+ (instancetype)usersCrownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a5" size:size style:style]; }
+ (instancetype)ussunnahIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf407" size:size style:style]; }
+ (instancetype)utensilForkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e3" size:size style:style]; }
+ (instancetype)utensilKnifeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e4" size:size style:style]; }
+ (instancetype)utensilSpoonIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e5" size:size style:style]; }
+ (instancetype)utensilsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e7" size:size style:style]; }
+ (instancetype)utensilsAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e6" size:size style:style]; }
+ (instancetype)vaadinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf408" size:size style:style]; }
+ (instancetype)valueAbsoluteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a6" size:size style:style]; }
+ (instancetype)vectorSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5cb" size:size style:style]; }
+ (instancetype)venusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf221" size:size style:style]; }
+ (instancetype)venusDoubleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf226" size:size style:style]; }
+ (instancetype)venusMarsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf228" size:size style:style]; }
+ (instancetype)viacoinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf237" size:size style:style]; }
+ (instancetype)viadeoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2a9" size:size style:style]; }
+ (instancetype)viadeoSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2aa" size:size style:style]; }
+ (instancetype)vialIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf492" size:size style:style]; }
+ (instancetype)vialsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf493" size:size style:style]; }
+ (instancetype)viberIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf409" size:size style:style]; }
+ (instancetype)videoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf03d" size:size style:style]; }
+ (instancetype)videoPlusIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e1" size:size style:style]; }
+ (instancetype)videoSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e2" size:size style:style]; }
+ (instancetype)viharaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a7" size:size style:style]; }
+ (instancetype)vimeoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf40a" size:size style:style]; }
+ (instancetype)vimeoSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf194" size:size style:style]; }
+ (instancetype)vimeoVIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf27d" size:size style:style]; }
+ (instancetype)vineIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1ca" size:size style:style]; }
+ (instancetype)vkIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf189" size:size style:style]; }
+ (instancetype)vnvIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf40b" size:size style:style]; }
+ (instancetype)volcanoIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf770" size:size style:style]; }
+ (instancetype)volleyballBallIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf45f" size:size style:style]; }
+ (instancetype)volumeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a8" size:size style:style]; }
+ (instancetype)volumeDownIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf027" size:size style:style]; }
+ (instancetype)volumeMuteIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6a9" size:size style:style]; }
+ (instancetype)volumeOffIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf026" size:size style:style]; }
+ (instancetype)volumeSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e2" size:size style:style]; }
+ (instancetype)volumeUpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf028" size:size style:style]; }
+ (instancetype)voteNayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf771" size:size style:style]; }
+ (instancetype)voteYeaIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf772" size:size style:style]; }
+ (instancetype)vrCardboardIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf729" size:size style:style]; }
+ (instancetype)vuejsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf41f" size:size style:style]; }
+ (instancetype)walkingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf554" size:size style:style]; }
+ (instancetype)walletIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf555" size:size style:style]; }
+ (instancetype)wandIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf72a" size:size style:style]; }
+ (instancetype)wandMagicIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf72b" size:size style:style]; }
+ (instancetype)warehouseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf494" size:size style:style]; }
+ (instancetype)warehouseAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf495" size:size style:style]; }
+ (instancetype)watchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2e1" size:size style:style]; }
+ (instancetype)watchFitnessIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf63e" size:size style:style]; }
+ (instancetype)waterIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf773" size:size style:style]; }
+ (instancetype)waterLowerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf774" size:size style:style]; }
+ (instancetype)waterRiseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf775" size:size style:style]; }
+ (instancetype)weeblyIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5cc" size:size style:style]; }
+ (instancetype)weiboIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf18a" size:size style:style]; }
+ (instancetype)weightIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf496" size:size style:style]; }
+ (instancetype)weightHangingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5cd" size:size style:style]; }
+ (instancetype)weixinIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1d7" size:size style:style]; }
+ (instancetype)whaleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf72c" size:size style:style]; }
+ (instancetype)whatsappIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf232" size:size style:style]; }
+ (instancetype)whatsappSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf40c" size:size style:style]; }
+ (instancetype)wheatIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf72d" size:size style:style]; }
+ (instancetype)wheelchairIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf193" size:size style:style]; }
+ (instancetype)whistleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf460" size:size style:style]; }
+ (instancetype)whmcsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf40d" size:size style:style]; }
+ (instancetype)wifiIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1eb" size:size style:style]; }
+ (instancetype)wifi1IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6aa" size:size style:style]; }
+ (instancetype)wifi2IconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ab" size:size style:style]; }
+ (instancetype)wifiSlashIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ac" size:size style:style]; }
+ (instancetype)wikipediaWIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf266" size:size style:style]; }
+ (instancetype)windIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf72e" size:size style:style]; }
+ (instancetype)windWarningIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf776" size:size style:style]; }
+ (instancetype)windowIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf40e" size:size style:style]; }
+ (instancetype)windowAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf40f" size:size style:style]; }
+ (instancetype)windowCloseIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf410" size:size style:style]; }
+ (instancetype)windowMaximizeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d0" size:size style:style]; }
+ (instancetype)windowMinimizeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d1" size:size style:style]; }
+ (instancetype)windowRestoreIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2d2" size:size style:style]; }
+ (instancetype)windowsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf17a" size:size style:style]; }
+ (instancetype)windsockIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf777" size:size style:style]; }
+ (instancetype)wineBottleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf72f" size:size style:style]; }
+ (instancetype)wineGlassIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf4e3" size:size style:style]; }
+ (instancetype)wineGlassAltIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5ce" size:size style:style]; }
+ (instancetype)wixIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf5cf" size:size style:style]; }
+ (instancetype)wizardsOfTheCoastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf730" size:size style:style]; }
+ (instancetype)wolfPackBattalionIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf514" size:size style:style]; }
+ (instancetype)wonSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf159" size:size style:style]; }
+ (instancetype)wordpressIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf19a" size:size style:style]; }
+ (instancetype)wordpressSimpleIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf411" size:size style:style]; }
+ (instancetype)wpbeginnerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf297" size:size style:style]; }
+ (instancetype)wpexplorerIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2de" size:size style:style]; }
+ (instancetype)wpformsIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf298" size:size style:style]; }
+ (instancetype)wpressrIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf3e4" size:size style:style]; }
+ (instancetype)wrenchIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf0ad" size:size style:style]; }
+ (instancetype)xRayIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf497" size:size style:style]; }
+ (instancetype)xboxIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf412" size:size style:style]; }
+ (instancetype)xingIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf168" size:size style:style]; }
+ (instancetype)xingSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf169" size:size style:style]; }
+ (instancetype)yCombinatorIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf23b" size:size style:style]; }
+ (instancetype)yahooIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf19e" size:size style:style]; }
+ (instancetype)yandexIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf413" size:size style:style]; }
+ (instancetype)yandexInternationalIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf414" size:size style:style]; }
+ (instancetype)yelpIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf1e9" size:size style:style]; }
+ (instancetype)yenSignIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf157" size:size style:style]; }
+ (instancetype)yinYangIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf6ad" size:size style:style]; }
+ (instancetype)yoastIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf2b1" size:size style:style]; }
+ (instancetype)youtubeIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf167" size:size style:style]; }
+ (instancetype)youtubeSquareIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf431" size:size style:style]; }
+ (instancetype)zhihuIconWithSize:(CGFloat)size style:(FAKFontAwesomeStyle)style { return [self iconWithCode:@"\uf63f" size:size style:style]; }

+ (NSDictionary *)allIcons {
    return @{
             @"fa-500px" : @"\uf26e",
             @"fa-abacus" : @"\uf640",
             @"fa-accessible-icon" : @"\uf368",
             @"fa-accusoft" : @"\uf369",
             @"fa-acorn" : @"\uf6ae",
             @"fa-acquisitions-incorporated" : @"\uf6af",
             @"fa-ad" : @"\uf641",
             @"fa-address-book" : @"\uf2b9",
             @"fa-address-card" : @"\uf2bb",
             @"fa-adjust" : @"\uf042",
             @"fa-adn" : @"\uf170",
             @"fa-adversal" : @"\uf36a",
             @"fa-affiliatetheme" : @"\uf36b",
             @"fa-air-freshener" : @"\uf5d0",
             @"fa-alarm-clock" : @"\uf34e",
             @"fa-algolia" : @"\uf36c",
             @"fa-alicorn" : @"\uf6b0",
             @"fa-align-center" : @"\uf037",
             @"fa-align-justify" : @"\uf039",
             @"fa-align-left" : @"\uf036",
             @"fa-align-right" : @"\uf038",
             @"fa-alipay" : @"\uf642",
             @"fa-allergies" : @"\uf461",
             @"fa-amazon" : @"\uf270",
             @"fa-amazon-pay" : @"\uf42c",
             @"fa-ambulance" : @"\uf0f9",
             @"fa-american-sign-language-interpreting" : @"\uf2a3",
             @"fa-amilia" : @"\uf36d",
             @"fa-analytics" : @"\uf643",
             @"fa-anchor" : @"\uf13d",
             @"fa-android" : @"\uf17b",
             @"fa-angellist" : @"\uf209",
             @"fa-angle-double-down" : @"\uf103",
             @"fa-angle-double-left" : @"\uf100",
             @"fa-angle-double-right" : @"\uf101",
             @"fa-angle-double-up" : @"\uf102",
             @"fa-angle-down" : @"\uf107",
             @"fa-angle-left" : @"\uf104",
             @"fa-angle-right" : @"\uf105",
             @"fa-angle-up" : @"\uf106",
             @"fa-angry" : @"\uf556",
             @"fa-angrycreative" : @"\uf36e",
             @"fa-angular" : @"\uf420",
             @"fa-ankh" : @"\uf644",
             @"fa-app-store" : @"\uf36f",
             @"fa-app-store-ios" : @"\uf370",
             @"fa-apper" : @"\uf371",
             @"fa-apple" : @"\uf179",
             @"fa-apple-alt" : @"\uf5d1",
             @"fa-apple-crate" : @"\uf6b1",
             @"fa-apple-pay" : @"\uf415",
             @"fa-archive" : @"\uf187",
             @"fa-archway" : @"\uf557",
             @"fa-arrow-alt-circle-down" : @"\uf358",
             @"fa-arrow-alt-circle-left" : @"\uf359",
             @"fa-arrow-alt-circle-right" : @"\uf35a",
             @"fa-arrow-alt-circle-up" : @"\uf35b",
             @"fa-arrow-alt-down" : @"\uf354",
             @"fa-arrow-alt-from-bottom" : @"\uf346",
             @"fa-arrow-alt-from-left" : @"\uf347",
             @"fa-arrow-alt-from-right" : @"\uf348",
             @"fa-arrow-alt-from-top" : @"\uf349",
             @"fa-arrow-alt-left" : @"\uf355",
             @"fa-arrow-alt-right" : @"\uf356",
             @"fa-arrow-alt-square-down" : @"\uf350",
             @"fa-arrow-alt-square-left" : @"\uf351",
             @"fa-arrow-alt-square-right" : @"\uf352",
             @"fa-arrow-alt-square-up" : @"\uf353",
             @"fa-arrow-alt-to-bottom" : @"\uf34a",
             @"fa-arrow-alt-to-left" : @"\uf34b",
             @"fa-arrow-alt-to-right" : @"\uf34c",
             @"fa-arrow-alt-to-top" : @"\uf34d",
             @"fa-arrow-alt-up" : @"\uf357",
             @"fa-arrow-circle-down" : @"\uf0ab",
             @"fa-arrow-circle-left" : @"\uf0a8",
             @"fa-arrow-circle-right" : @"\uf0a9",
             @"fa-arrow-circle-up" : @"\uf0aa",
             @"fa-arrow-down" : @"\uf063",
             @"fa-arrow-from-bottom" : @"\uf342",
             @"fa-arrow-from-left" : @"\uf343",
             @"fa-arrow-from-right" : @"\uf344",
             @"fa-arrow-from-top" : @"\uf345",
             @"fa-arrow-left" : @"\uf060",
             @"fa-arrow-right" : @"\uf061",
             @"fa-arrow-square-down" : @"\uf339",
             @"fa-arrow-square-left" : @"\uf33a",
             @"fa-arrow-square-right" : @"\uf33b",
             @"fa-arrow-square-up" : @"\uf33c",
             @"fa-arrow-to-bottom" : @"\uf33d",
             @"fa-arrow-to-left" : @"\uf33e",
             @"fa-arrow-to-right" : @"\uf340",
             @"fa-arrow-to-top" : @"\uf341",
             @"fa-arrow-up" : @"\uf062",
             @"fa-arrows" : @"\uf047",
             @"fa-arrows-alt" : @"\uf0b2",
             @"fa-arrows-alt-h" : @"\uf337",
             @"fa-arrows-alt-v" : @"\uf338",
             @"fa-arrows-h" : @"\uf07e",
             @"fa-arrows-v" : @"\uf07d",
             @"fa-assistive-listening-systems" : @"\uf2a2",
             @"fa-asterisk" : @"\uf069",
             @"fa-asymmetrik" : @"\uf372",
             @"fa-at" : @"\uf1fa",
             @"fa-atlas" : @"\uf558",
             @"fa-atom" : @"\uf5d2",
             @"fa-atom-alt" : @"\uf5d3",
             @"fa-audible" : @"\uf373",
             @"fa-audio-description" : @"\uf29e",
             @"fa-autoprefixer" : @"\uf41c",
             @"fa-avianex" : @"\uf374",
             @"fa-aviato" : @"\uf421",
             @"fa-award" : @"\uf559",
             @"fa-aws" : @"\uf375",
             @"fa-axe" : @"\uf6b2",
             @"fa-axe-battle" : @"\uf6b3",
             @"fa-backpack" : @"\uf5d4",
             @"fa-backspace" : @"\uf55a",
             @"fa-backward" : @"\uf04a",
             @"fa-badge" : @"\uf335",
             @"fa-badge-check" : @"\uf336",
             @"fa-badge-dollar" : @"\uf645",
             @"fa-badge-percent" : @"\uf646",
             @"fa-badger-honey" : @"\uf6b4",
             @"fa-balance-scale" : @"\uf24e",
             @"fa-balance-scale-left" : @"\uf515",
             @"fa-balance-scale-right" : @"\uf516",
             @"fa-ballot" : @"\uf732",
             @"fa-ballot-check" : @"\uf733",
             @"fa-ban" : @"\uf05e",
             @"fa-band-aid" : @"\uf462",
             @"fa-bandcamp" : @"\uf2d5",
             @"fa-barcode" : @"\uf02a",
             @"fa-barcode-alt" : @"\uf463",
             @"fa-barcode-read" : @"\uf464",
             @"fa-barcode-scan" : @"\uf465",
             @"fa-bars" : @"\uf0c9",
             @"fa-baseball" : @"\uf432",
             @"fa-baseball-ball" : @"\uf433",
             @"fa-basketball-ball" : @"\uf434",
             @"fa-basketball-hoop" : @"\uf435",
             @"fa-bat" : @"\uf6b5",
             @"fa-bath" : @"\uf2cd",
             @"fa-battery-bolt" : @"\uf376",
             @"fa-battery-empty" : @"\uf244",
             @"fa-battery-full" : @"\uf240",
             @"fa-battery-half" : @"\uf242",
             @"fa-battery-quarter" : @"\uf243",
             @"fa-battery-slash" : @"\uf377",
             @"fa-battery-three-quarters" : @"\uf241",
             @"fa-bed" : @"\uf236",
             @"fa-beer" : @"\uf0fc",
             @"fa-behance" : @"\uf1b4",
             @"fa-behance-square" : @"\uf1b5",
             @"fa-bell" : @"\uf0f3",
             @"fa-bell-school" : @"\uf5d5",
             @"fa-bell-school-slash" : @"\uf5d6",
             @"fa-bell-slash" : @"\uf1f6",
             @"fa-bezier-curve" : @"\uf55b",
             @"fa-bible" : @"\uf647",
             @"fa-bicycle" : @"\uf206",
             @"fa-bimobject" : @"\uf378",
             @"fa-binoculars" : @"\uf1e5",
             @"fa-birthday-cake" : @"\uf1fd",
             @"fa-bitbucket" : @"\uf171",
             @"fa-bitcoin" : @"\uf379",
             @"fa-bity" : @"\uf37a",
             @"fa-black-tie" : @"\uf27e",
             @"fa-blackberry" : @"\uf37b",
             @"fa-blanket" : @"\uf498",
             @"fa-blender" : @"\uf517",
             @"fa-blender-phone" : @"\uf6b6",
             @"fa-blind" : @"\uf29d",
             @"fa-blogger" : @"\uf37c",
             @"fa-blogger-b" : @"\uf37d",
             @"fa-bluetooth" : @"\uf293",
             @"fa-bluetooth-b" : @"\uf294",
             @"fa-bold" : @"\uf032",
             @"fa-bolt" : @"\uf0e7",
             @"fa-bomb" : @"\uf1e2",
             @"fa-bone" : @"\uf5d7",
             @"fa-bone-break" : @"\uf5d8",
             @"fa-bong" : @"\uf55c",
             @"fa-book" : @"\uf02d",
             @"fa-book-alt" : @"\uf5d9",
             @"fa-book-dead" : @"\uf6b7",
             @"fa-book-heart" : @"\uf499",
             @"fa-book-open" : @"\uf518",
             @"fa-book-reader" : @"\uf5da",
             @"fa-book-spells" : @"\uf6b8",
             @"fa-bookmark" : @"\uf02e",
             @"fa-books" : @"\uf5db",
             @"fa-booth-curtain" : @"\uf734",
             @"fa-bow-arrow" : @"\uf6b9",
             @"fa-bowling-ball" : @"\uf436",
             @"fa-bowling-pins" : @"\uf437",
             @"fa-box" : @"\uf466",
             @"fa-box-alt" : @"\uf49a",
             @"fa-box-ballot" : @"\uf735",
             @"fa-box-check" : @"\uf467",
             @"fa-box-fragile" : @"\uf49b",
             @"fa-box-full" : @"\uf49c",
             @"fa-box-heart" : @"\uf49d",
             @"fa-box-open" : @"\uf49e",
             @"fa-box-up" : @"\uf49f",
             @"fa-box-usd" : @"\uf4a0",
             @"fa-boxes" : @"\uf468",
             @"fa-boxes-alt" : @"\uf4a1",
             @"fa-boxing-glove" : @"\uf438",
             @"fa-braille" : @"\uf2a1",
             @"fa-brain" : @"\uf5dc",
             @"fa-briefcase" : @"\uf0b1",
             @"fa-briefcase-medical" : @"\uf469",
             @"fa-broadcast-tower" : @"\uf519",
             @"fa-broom" : @"\uf51a",
             @"fa-browser" : @"\uf37e",
             @"fa-brush" : @"\uf55d",
             @"fa-btc" : @"\uf15a",
             @"fa-bug" : @"\uf188",
             @"fa-building" : @"\uf1ad",
             @"fa-bullhorn" : @"\uf0a1",
             @"fa-bullseye" : @"\uf140",
             @"fa-bullseye-arrow" : @"\uf648",
             @"fa-bullseye-pointer" : @"\uf649",
             @"fa-burn" : @"\uf46a",
             @"fa-buromobelexperte" : @"\uf37f",
             @"fa-bus" : @"\uf207",
             @"fa-bus-alt" : @"\uf55e",
             @"fa-bus-school" : @"\uf5dd",
             @"fa-business-time" : @"\uf64a",
             @"fa-buysellads" : @"\uf20d",
             @"fa-cabinet-filing" : @"\uf64b",
             @"fa-calculator" : @"\uf1ec",
             @"fa-calculator-alt" : @"\uf64c",
             @"fa-calendar" : @"\uf133",
             @"fa-calendar-alt" : @"\uf073",
             @"fa-calendar-check" : @"\uf274",
             @"fa-calendar-edit" : @"\uf333",
             @"fa-calendar-exclamation" : @"\uf334",
             @"fa-calendar-minus" : @"\uf272",
             @"fa-calendar-plus" : @"\uf271",
             @"fa-calendar-star" : @"\uf736",
             @"fa-calendar-times" : @"\uf273",
             @"fa-camera" : @"\uf030",
             @"fa-camera-alt" : @"\uf332",
             @"fa-camera-retro" : @"\uf083",
             @"fa-campfire" : @"\uf6ba",
             @"fa-campground" : @"\uf6bb",
             @"fa-candle-holder" : @"\uf6bc",
             @"fa-candy-corn" : @"\uf6bd",
             @"fa-cannabis" : @"\uf55f",
             @"fa-capsules" : @"\uf46b",
             @"fa-car" : @"\uf1b9",
             @"fa-car-alt" : @"\uf5de",
             @"fa-car-battery" : @"\uf5df",
             @"fa-car-bump" : @"\uf5e0",
             @"fa-car-crash" : @"\uf5e1",
             @"fa-car-garage" : @"\uf5e2",
             @"fa-car-mechanic" : @"\uf5e3",
             @"fa-car-side" : @"\uf5e4",
             @"fa-car-tilt" : @"\uf5e5",
             @"fa-car-wash" : @"\uf5e6",
             @"fa-caret-circle-down" : @"\uf32d",
             @"fa-caret-circle-left" : @"\uf32e",
             @"fa-caret-circle-right" : @"\uf330",
             @"fa-caret-circle-up" : @"\uf331",
             @"fa-caret-down" : @"\uf0d7",
             @"fa-caret-left" : @"\uf0d9",
             @"fa-caret-right" : @"\uf0da",
             @"fa-caret-square-down" : @"\uf150",
             @"fa-caret-square-left" : @"\uf191",
             @"fa-caret-square-right" : @"\uf152",
             @"fa-caret-square-up" : @"\uf151",
             @"fa-caret-up" : @"\uf0d8",
             @"fa-cart-arrow-down" : @"\uf218",
             @"fa-cart-plus" : @"\uf217",
             @"fa-cat" : @"\uf6be",
             @"fa-cauldron" : @"\uf6bf",
             @"fa-cc-amazon-pay" : @"\uf42d",
             @"fa-cc-amex" : @"\uf1f3",
             @"fa-cc-apple-pay" : @"\uf416",
             @"fa-cc-diners-club" : @"\uf24c",
             @"fa-cc-discover" : @"\uf1f2",
             @"fa-cc-jcb" : @"\uf24b",
             @"fa-cc-mastercard" : @"\uf1f1",
             @"fa-cc-paypal" : @"\uf1f4",
             @"fa-cc-stripe" : @"\uf1f5",
             @"fa-cc-visa" : @"\uf1f0",
             @"fa-centercode" : @"\uf380",
             @"fa-certificate" : @"\uf0a3",
             @"fa-chair" : @"\uf6c0",
             @"fa-chair-office" : @"\uf6c1",
             @"fa-chalkboard" : @"\uf51b",
             @"fa-chalkboard-teacher" : @"\uf51c",
             @"fa-charging-station" : @"\uf5e7",
             @"fa-chart-area" : @"\uf1fe",
             @"fa-chart-bar" : @"\uf080",
             @"fa-chart-line" : @"\uf201",
             @"fa-chart-line-down" : @"\uf64d",
             @"fa-chart-pie" : @"\uf200",
             @"fa-chart-pie-alt" : @"\uf64e",
             @"fa-check" : @"\uf00c",
             @"fa-check-circle" : @"\uf058",
             @"fa-check-double" : @"\uf560",
             @"fa-check-square" : @"\uf14a",
             @"fa-chess" : @"\uf439",
             @"fa-chess-bishop" : @"\uf43a",
             @"fa-chess-bishop-alt" : @"\uf43b",
             @"fa-chess-board" : @"\uf43c",
             @"fa-chess-clock" : @"\uf43d",
             @"fa-chess-clock-alt" : @"\uf43e",
             @"fa-chess-king" : @"\uf43f",
             @"fa-chess-king-alt" : @"\uf440",
             @"fa-chess-knight" : @"\uf441",
             @"fa-chess-knight-alt" : @"\uf442",
             @"fa-chess-pawn" : @"\uf443",
             @"fa-chess-pawn-alt" : @"\uf444",
             @"fa-chess-queen" : @"\uf445",
             @"fa-chess-queen-alt" : @"\uf446",
             @"fa-chess-rook" : @"\uf447",
             @"fa-chess-rook-alt" : @"\uf448",
             @"fa-chevron-circle-down" : @"\uf13a",
             @"fa-chevron-circle-left" : @"\uf137",
             @"fa-chevron-circle-right" : @"\uf138",
             @"fa-chevron-circle-up" : @"\uf139",
             @"fa-chevron-double-down" : @"\uf322",
             @"fa-chevron-double-left" : @"\uf323",
             @"fa-chevron-double-right" : @"\uf324",
             @"fa-chevron-double-up" : @"\uf325",
             @"fa-chevron-down" : @"\uf078",
             @"fa-chevron-left" : @"\uf053",
             @"fa-chevron-right" : @"\uf054",
             @"fa-chevron-square-down" : @"\uf329",
             @"fa-chevron-square-left" : @"\uf32a",
             @"fa-chevron-square-right" : @"\uf32b",
             @"fa-chevron-square-up" : @"\uf32c",
             @"fa-chevron-up" : @"\uf077",
             @"fa-child" : @"\uf1ae",
             @"fa-chrome" : @"\uf268",
             @"fa-church" : @"\uf51d",
             @"fa-circle" : @"\uf111",
             @"fa-circle-notch" : @"\uf1ce",
             @"fa-city" : @"\uf64f",
             @"fa-claw-marks" : @"\uf6c2",
             @"fa-clipboard" : @"\uf328",
             @"fa-clipboard-check" : @"\uf46c",
             @"fa-clipboard-list" : @"\uf46d",
             @"fa-clipboard-list-check" : @"\uf737",
             @"fa-clipboard-prescription" : @"\uf5e8",
             @"fa-clock" : @"\uf017",
             @"fa-clone" : @"\uf24d",
             @"fa-closed-captioning" : @"\uf20a",
             @"fa-cloud" : @"\uf0c2",
             @"fa-cloud-download" : @"\uf0ed",
             @"fa-cloud-download-alt" : @"\uf381",
             @"fa-cloud-drizzle" : @"\uf738",
             @"fa-cloud-hail" : @"\uf739",
             @"fa-cloud-hail-mixed" : @"\uf73a",
             @"fa-cloud-meatball" : @"\uf73b",
             @"fa-cloud-moon" : @"\uf6c3",
             @"fa-cloud-moon-rain" : @"\uf73c",
             @"fa-cloud-rain" : @"\uf73d",
             @"fa-cloud-rainbow" : @"\uf73e",
             @"fa-cloud-showers" : @"\uf73f",
             @"fa-cloud-showers-heavy" : @"\uf740",
             @"fa-cloud-sleet" : @"\uf741",
             @"fa-cloud-snow" : @"\uf742",
             @"fa-cloud-sun" : @"\uf6c4",
             @"fa-cloud-sun-rain" : @"\uf743",
             @"fa-cloud-upload" : @"\uf0ee",
             @"fa-cloud-upload-alt" : @"\uf382",
             @"fa-clouds" : @"\uf744",
             @"fa-clouds-moon" : @"\uf745",
             @"fa-clouds-sun" : @"\uf746",
             @"fa-cloudscale" : @"\uf383",
             @"fa-cloudsmith" : @"\uf384",
             @"fa-cloudversify" : @"\uf385",
             @"fa-club" : @"\uf327",
             @"fa-cocktail" : @"\uf561",
             @"fa-code" : @"\uf121",
             @"fa-code-branch" : @"\uf126",
             @"fa-code-commit" : @"\uf386",
             @"fa-code-merge" : @"\uf387",
             @"fa-codepen" : @"\uf1cb",
             @"fa-codiepie" : @"\uf284",
             @"fa-coffee" : @"\uf0f4",
             @"fa-coffee-togo" : @"\uf6c5",
             @"fa-coffin" : @"\uf6c6",
             @"fa-cog" : @"\uf013",
             @"fa-cogs" : @"\uf085",
             @"fa-coins" : @"\uf51e",
             @"fa-columns" : @"\uf0db",
             @"fa-comment" : @"\uf075",
             @"fa-comment-alt" : @"\uf27a",
             @"fa-comment-alt-check" : @"\uf4a2",
             @"fa-comment-alt-dollar" : @"\uf650",
             @"fa-comment-alt-dots" : @"\uf4a3",
             @"fa-comment-alt-edit" : @"\uf4a4",
             @"fa-comment-alt-exclamation" : @"\uf4a5",
             @"fa-comment-alt-lines" : @"\uf4a6",
             @"fa-comment-alt-minus" : @"\uf4a7",
             @"fa-comment-alt-plus" : @"\uf4a8",
             @"fa-comment-alt-slash" : @"\uf4a9",
             @"fa-comment-alt-smile" : @"\uf4aa",
             @"fa-comment-alt-times" : @"\uf4ab",
             @"fa-comment-check" : @"\uf4ac",
             @"fa-comment-dollar" : @"\uf651",
             @"fa-comment-dots" : @"\uf4ad",
             @"fa-comment-edit" : @"\uf4ae",
             @"fa-comment-exclamation" : @"\uf4af",
             @"fa-comment-lines" : @"\uf4b0",
             @"fa-comment-minus" : @"\uf4b1",
             @"fa-comment-plus" : @"\uf4b2",
             @"fa-comment-slash" : @"\uf4b3",
             @"fa-comment-smile" : @"\uf4b4",
             @"fa-comment-times" : @"\uf4b5",
             @"fa-comments" : @"\uf086",
             @"fa-comments-alt" : @"\uf4b6",
             @"fa-comments-alt-dollar" : @"\uf652",
             @"fa-comments-dollar" : @"\uf653",
             @"fa-compact-disc" : @"\uf51f",
             @"fa-compass" : @"\uf14e",
             @"fa-compass-slash" : @"\uf5e9",
             @"fa-compress" : @"\uf066",
             @"fa-compress-alt" : @"\uf422",
             @"fa-compress-wide" : @"\uf326",
             @"fa-concierge-bell" : @"\uf562",
             @"fa-connectdevelop" : @"\uf20e",
             @"fa-container-storage" : @"\uf4b7",
             @"fa-contao" : @"\uf26d",
             @"fa-conveyor-belt" : @"\uf46e",
             @"fa-conveyor-belt-alt" : @"\uf46f",
             @"fa-cookie" : @"\uf563",
             @"fa-cookie-bite" : @"\uf564",
             @"fa-copy" : @"\uf0c5",
             @"fa-copyright" : @"\uf1f9",
             @"fa-corn" : @"\uf6c7",
             @"fa-couch" : @"\uf4b8",
             @"fa-cow" : @"\uf6c8",
             @"fa-cpanel" : @"\uf388",
             @"fa-creative-commons" : @"\uf25e",
             @"fa-creative-commons-by" : @"\uf4e7",
             @"fa-creative-commons-nc" : @"\uf4e8",
             @"fa-creative-commons-nc-eu" : @"\uf4e9",
             @"fa-creative-commons-nc-jp" : @"\uf4ea",
             @"fa-creative-commons-nd" : @"\uf4eb",
             @"fa-creative-commons-pd" : @"\uf4ec",
             @"fa-creative-commons-pd-alt" : @"\uf4ed",
             @"fa-creative-commons-remix" : @"\uf4ee",
             @"fa-creative-commons-sa" : @"\uf4ef",
             @"fa-creative-commons-sampling" : @"\uf4f0",
             @"fa-creative-commons-sampling-plus" : @"\uf4f1",
             @"fa-creative-commons-share" : @"\uf4f2",
             @"fa-creative-commons-zero" : @"\uf4f3",
             @"fa-credit-card" : @"\uf09d",
             @"fa-credit-card-blank" : @"\uf389",
             @"fa-credit-card-front" : @"\uf38a",
             @"fa-cricket" : @"\uf449",
             @"fa-critical-role" : @"\uf6c9",
             @"fa-crop" : @"\uf125",
             @"fa-crop-alt" : @"\uf565",
             @"fa-cross" : @"\uf654",
             @"fa-crosshairs" : @"\uf05b",
             @"fa-crow" : @"\uf520",
             @"fa-crown" : @"\uf521",
             @"fa-css3" : @"\uf13c",
             @"fa-css3-alt" : @"\uf38b",
             @"fa-cube" : @"\uf1b2",
             @"fa-cubes" : @"\uf1b3",
             @"fa-curling" : @"\uf44a",
             @"fa-cut" : @"\uf0c4",
             @"fa-cuttlefish" : @"\uf38c",
             @"fa-d-and-d" : @"\uf38d",
             @"fa-d-and-d-beyond" : @"\uf6ca",
             @"fa-dagger" : @"\uf6cb",
             @"fa-dashcube" : @"\uf210",
             @"fa-database" : @"\uf1c0",
             @"fa-deaf" : @"\uf2a4",
             @"fa-delicious" : @"\uf1a5",
             @"fa-democrat" : @"\uf747",
             @"fa-deploydog" : @"\uf38e",
             @"fa-deskpro" : @"\uf38f",
             @"fa-desktop" : @"\uf108",
             @"fa-desktop-alt" : @"\uf390",
             @"fa-dev" : @"\uf6cc",
             @"fa-deviantart" : @"\uf1bd",
             @"fa-dewpoint" : @"\uf748",
             @"fa-dharmachakra" : @"\uf655",
             @"fa-diagnoses" : @"\uf470",
             @"fa-diamond" : @"\uf219",
             @"fa-dice" : @"\uf522",
             @"fa-dice-d10" : @"\uf6cd",
             @"fa-dice-d12" : @"\uf6ce",
             @"fa-dice-d20" : @"\uf6cf",
             @"fa-dice-d4" : @"\uf6d0",
             @"fa-dice-d6" : @"\uf6d1",
             @"fa-dice-d8" : @"\uf6d2",
             @"fa-dice-five" : @"\uf523",
             @"fa-dice-four" : @"\uf524",
             @"fa-dice-one" : @"\uf525",
             @"fa-dice-six" : @"\uf526",
             @"fa-dice-three" : @"\uf527",
             @"fa-dice-two" : @"\uf528",
             @"fa-digg" : @"\uf1a6",
             @"fa-digital-ocean" : @"\uf391",
             @"fa-digital-tachograph" : @"\uf566",
             @"fa-diploma" : @"\uf5ea",
             @"fa-directions" : @"\uf5eb",
             @"fa-discord" : @"\uf392",
             @"fa-discourse" : @"\uf393",
             @"fa-divide" : @"\uf529",
             @"fa-dizzy" : @"\uf567",
             @"fa-dna" : @"\uf471",
             @"fa-do-not-enter" : @"\uf5ec",
             @"fa-dochub" : @"\uf394",
             @"fa-docker" : @"\uf395",
             @"fa-dog" : @"\uf6d3",
             @"fa-dog-leashed" : @"\uf6d4",
             @"fa-dollar-sign" : @"\uf155",
             @"fa-dolly" : @"\uf472",
             @"fa-dolly-empty" : @"\uf473",
             @"fa-dolly-flatbed" : @"\uf474",
             @"fa-dolly-flatbed-alt" : @"\uf475",
             @"fa-dolly-flatbed-empty" : @"\uf476",
             @"fa-donate" : @"\uf4b9",
             @"fa-door-closed" : @"\uf52a",
             @"fa-door-open" : @"\uf52b",
             @"fa-dot-circle" : @"\uf192",
             @"fa-dove" : @"\uf4ba",
             @"fa-download" : @"\uf019",
             @"fa-draft2digital" : @"\uf396",
             @"fa-drafting-compass" : @"\uf568",
             @"fa-dragon" : @"\uf6d5",
             @"fa-draw-circle" : @"\uf5ed",
             @"fa-draw-polygon" : @"\uf5ee",
             @"fa-draw-square" : @"\uf5ef",
             @"fa-dribbble" : @"\uf17d",
             @"fa-dribbble-square" : @"\uf397",
             @"fa-dropbox" : @"\uf16b",
             @"fa-drum" : @"\uf569",
             @"fa-drum-steelpan" : @"\uf56a",
             @"fa-drumstick" : @"\uf6d6",
             @"fa-drumstick-bite" : @"\uf6d7",
             @"fa-drupal" : @"\uf1a9",
             @"fa-duck" : @"\uf6d8",
             @"fa-dumbbell" : @"\uf44b",
             @"fa-dungeon" : @"\uf6d9",
             @"fa-dyalog" : @"\uf399",
             @"fa-ear" : @"\uf5f0",
             @"fa-earlybirds" : @"\uf39a",
             @"fa-ebay" : @"\uf4f4",
             @"fa-eclipse" : @"\uf749",
             @"fa-eclipse-alt" : @"\uf74a",
             @"fa-edge" : @"\uf282",
             @"fa-edit" : @"\uf044",
             @"fa-eject" : @"\uf052",
             @"fa-elementor" : @"\uf430",
             @"fa-elephant" : @"\uf6da",
             @"fa-ellipsis-h" : @"\uf141",
             @"fa-ellipsis-h-alt" : @"\uf39b",
             @"fa-ellipsis-v" : @"\uf142",
             @"fa-ellipsis-v-alt" : @"\uf39c",
             @"fa-ello" : @"\uf5f1",
             @"fa-ember" : @"\uf423",
             @"fa-empire" : @"\uf1d1",
             @"fa-empty-set" : @"\uf656",
             @"fa-engine-warning" : @"\uf5f2",
             @"fa-envelope" : @"\uf0e0",
             @"fa-envelope-open" : @"\uf2b6",
             @"fa-envelope-open-dollar" : @"\uf657",
             @"fa-envelope-open-text" : @"\uf658",
             @"fa-envelope-square" : @"\uf199",
             @"fa-envira" : @"\uf299",
             @"fa-equals" : @"\uf52c",
             @"fa-eraser" : @"\uf12d",
             @"fa-erlang" : @"\uf39d",
             @"fa-ethereum" : @"\uf42e",
             @"fa-etsy" : @"\uf2d7",
             @"fa-euro-sign" : @"\uf153",
             @"fa-exchange" : @"\uf0ec",
             @"fa-exchange-alt" : @"\uf362",
             @"fa-exclamation" : @"\uf12a",
             @"fa-exclamation-circle" : @"\uf06a",
             @"fa-exclamation-square" : @"\uf321",
             @"fa-exclamation-triangle" : @"\uf071",
             @"fa-expand" : @"\uf065",
             @"fa-expand-alt" : @"\uf424",
             @"fa-expand-arrows" : @"\uf31d",
             @"fa-expand-arrows-alt" : @"\uf31e",
             @"fa-expand-wide" : @"\uf320",
             @"fa-expeditedssl" : @"\uf23e",
             @"fa-external-link" : @"\uf08e",
             @"fa-external-link-alt" : @"\uf35d",
             @"fa-external-link-square" : @"\uf14c",
             @"fa-external-link-square-alt" : @"\uf360",
             @"fa-eye" : @"\uf06e",
             @"fa-eye-dropper" : @"\uf1fb",
             @"fa-eye-evil" : @"\uf6db",
             @"fa-eye-slash" : @"\uf070",
             @"fa-facebook" : @"\uf09a",
             @"fa-facebook-f" : @"\uf39e",
             @"fa-facebook-messenger" : @"\uf39f",
             @"fa-facebook-square" : @"\uf082",
             @"fa-fantasy-flight-games" : @"\uf6dc",
             @"fa-fast-backward" : @"\uf049",
             @"fa-fast-forward" : @"\uf050",
             @"fa-fax" : @"\uf1ac",
             @"fa-feather" : @"\uf52d",
             @"fa-feather-alt" : @"\uf56b",
             @"fa-female" : @"\uf182",
             @"fa-field-hockey" : @"\uf44c",
             @"fa-fighter-jet" : @"\uf0fb",
             @"fa-file" : @"\uf15b",
             @"fa-file-alt" : @"\uf15c",
             @"fa-file-archive" : @"\uf1c6",
             @"fa-file-audio" : @"\uf1c7",
             @"fa-file-certificate" : @"\uf5f3",
             @"fa-file-chart-line" : @"\uf659",
             @"fa-file-chart-pie" : @"\uf65a",
             @"fa-file-check" : @"\uf316",
             @"fa-file-code" : @"\uf1c9",
             @"fa-file-contract" : @"\uf56c",
             @"fa-file-csv" : @"\uf6dd",
             @"fa-file-download" : @"\uf56d",
             @"fa-file-edit" : @"\uf31c",
             @"fa-file-excel" : @"\uf1c3",
             @"fa-file-exclamation" : @"\uf31a",
             @"fa-file-export" : @"\uf56e",
             @"fa-file-image" : @"\uf1c5",
             @"fa-file-import" : @"\uf56f",
             @"fa-file-invoice" : @"\uf570",
             @"fa-file-invoice-dollar" : @"\uf571",
             @"fa-file-medical" : @"\uf477",
             @"fa-file-medical-alt" : @"\uf478",
             @"fa-file-minus" : @"\uf318",
             @"fa-file-pdf" : @"\uf1c1",
             @"fa-file-plus" : @"\uf319",
             @"fa-file-powerpoint" : @"\uf1c4",
             @"fa-file-prescription" : @"\uf572",
             @"fa-file-signature" : @"\uf573",
             @"fa-file-spreadsheet" : @"\uf65b",
             @"fa-file-times" : @"\uf317",
             @"fa-file-upload" : @"\uf574",
             @"fa-file-user" : @"\uf65c",
             @"fa-file-video" : @"\uf1c8",
             @"fa-file-word" : @"\uf1c2",
             @"fa-fill" : @"\uf575",
             @"fa-fill-drip" : @"\uf576",
             @"fa-film" : @"\uf008",
             @"fa-film-alt" : @"\uf3a0",
             @"fa-filter" : @"\uf0b0",
             @"fa-fingerprint" : @"\uf577",
             @"fa-fire" : @"\uf06d",
             @"fa-fire-extinguisher" : @"\uf134",
             @"fa-fire-smoke" : @"\uf74b",
             @"fa-firefox" : @"\uf269",
             @"fa-first-aid" : @"\uf479",
             @"fa-first-order" : @"\uf2b0",
             @"fa-first-order-alt" : @"\uf50a",
             @"fa-firstdraft" : @"\uf3a1",
             @"fa-fish" : @"\uf578",
             @"fa-fist-raised" : @"\uf6de",
             @"fa-flag" : @"\uf024",
             @"fa-flag-alt" : @"\uf74c",
             @"fa-flag-checkered" : @"\uf11e",
             @"fa-flag-usa" : @"\uf74d",
             @"fa-flame" : @"\uf6df",
             @"fa-flask" : @"\uf0c3",
             @"fa-flask-poison" : @"\uf6e0",
             @"fa-flask-potion" : @"\uf6e1",
             @"fa-flickr" : @"\uf16e",
             @"fa-flipboard" : @"\uf44d",
             @"fa-flushed" : @"\uf579",
             @"fa-fly" : @"\uf417",
             @"fa-fog" : @"\uf74e",
             @"fa-folder" : @"\uf07b",
             @"fa-folder-minus" : @"\uf65d",
             @"fa-folder-open" : @"\uf07c",
             @"fa-folder-plus" : @"\uf65e",
             @"fa-folder-times" : @"\uf65f",
             @"fa-folders" : @"\uf660",
             @"fa-font" : @"\uf031",
             @"fa-font-awesome" : @"\uf2b4",
             @"fa-font-awesome-alt" : @"\uf35c",
             @"fa-font-awesome-flag" : @"\uf425",
             @"fa-font-awesome-logo-full" : @"\uf4e6",
             @"fa-fonticons" : @"\uf280",
             @"fa-fonticons-fi" : @"\uf3a2",
             @"fa-football-ball" : @"\uf44e",
             @"fa-football-helmet" : @"\uf44f",
             @"fa-forklift" : @"\uf47a",
             @"fa-fort-awesome" : @"\uf286",
             @"fa-fort-awesome-alt" : @"\uf3a3",
             @"fa-forumbee" : @"\uf211",
             @"fa-forward" : @"\uf04e",
             @"fa-foursquare" : @"\uf180",
             @"fa-fragile" : @"\uf4bb",
             @"fa-free-code-camp" : @"\uf2c5",
             @"fa-freebsd" : @"\uf3a4",
             @"fa-frog" : @"\uf52e",
             @"fa-frown" : @"\uf119",
             @"fa-frown-open" : @"\uf57a",
             @"fa-fulcrum" : @"\uf50b",
             @"fa-function" : @"\uf661",
             @"fa-funnel-dollar" : @"\uf662",
             @"fa-futbol" : @"\uf1e3",
             @"fa-galactic-republic" : @"\uf50c",
             @"fa-galactic-senate" : @"\uf50d",
             @"fa-gamepad" : @"\uf11b",
             @"fa-gas-pump" : @"\uf52f",
             @"fa-gas-pump-slash" : @"\uf5f4",
             @"fa-gavel" : @"\uf0e3",
             @"fa-gem" : @"\uf3a5",
             @"fa-genderless" : @"\uf22d",
             @"fa-get-pocket" : @"\uf265",
             @"fa-gg" : @"\uf260",
             @"fa-gg-circle" : @"\uf261",
             @"fa-ghost" : @"\uf6e2",
             @"fa-gift" : @"\uf06b",
             @"fa-gift-card" : @"\uf663",
             @"fa-git" : @"\uf1d3",
             @"fa-git-square" : @"\uf1d2",
             @"fa-github" : @"\uf09b",
             @"fa-github-alt" : @"\uf113",
             @"fa-github-square" : @"\uf092",
             @"fa-gitkraken" : @"\uf3a6",
             @"fa-gitlab" : @"\uf296",
             @"fa-gitter" : @"\uf426",
             @"fa-glass-martini" : @"\uf000",
             @"fa-glass-martini-alt" : @"\uf57b",
             @"fa-glasses" : @"\uf530",
             @"fa-glasses-alt" : @"\uf5f5",
             @"fa-glide" : @"\uf2a5",
             @"fa-glide-g" : @"\uf2a6",
             @"fa-globe" : @"\uf0ac",
             @"fa-globe-africa" : @"\uf57c",
             @"fa-globe-americas" : @"\uf57d",
             @"fa-globe-asia" : @"\uf57e",
             @"fa-globe-stand" : @"\uf5f6",
             @"fa-gofore" : @"\uf3a7",
             @"fa-golf-ball" : @"\uf450",
             @"fa-golf-club" : @"\uf451",
             @"fa-goodreads" : @"\uf3a8",
             @"fa-goodreads-g" : @"\uf3a9",
             @"fa-google" : @"\uf1a0",
             @"fa-google-drive" : @"\uf3aa",
             @"fa-google-play" : @"\uf3ab",
             @"fa-google-plus" : @"\uf2b3",
             @"fa-google-plus-g" : @"\uf0d5",
             @"fa-google-plus-square" : @"\uf0d4",
             @"fa-google-wallet" : @"\uf1ee",
             @"fa-gopuram" : @"\uf664",
             @"fa-graduation-cap" : @"\uf19d",
             @"fa-gratipay" : @"\uf184",
             @"fa-grav" : @"\uf2d6",
             @"fa-greater-than" : @"\uf531",
             @"fa-greater-than-equal" : @"\uf532",
             @"fa-grimace" : @"\uf57f",
             @"fa-grin" : @"\uf580",
             @"fa-grin-alt" : @"\uf581",
             @"fa-grin-beam" : @"\uf582",
             @"fa-grin-beam-sweat" : @"\uf583",
             @"fa-grin-hearts" : @"\uf584",
             @"fa-grin-squint" : @"\uf585",
             @"fa-grin-squint-tears" : @"\uf586",
             @"fa-grin-stars" : @"\uf587",
             @"fa-grin-tears" : @"\uf588",
             @"fa-grin-tongue" : @"\uf589",
             @"fa-grin-tongue-squint" : @"\uf58a",
             @"fa-grin-tongue-wink" : @"\uf58b",
             @"fa-grin-wink" : @"\uf58c",
             @"fa-grip-horizontal" : @"\uf58d",
             @"fa-grip-vertical" : @"\uf58e",
             @"fa-gripfire" : @"\uf3ac",
             @"fa-grunt" : @"\uf3ad",
             @"fa-gulp" : @"\uf3ae",
             @"fa-h-square" : @"\uf0fd",
             @"fa-h1" : @"\uf313",
             @"fa-h2" : @"\uf314",
             @"fa-h3" : @"\uf315",
             @"fa-hacker-news" : @"\uf1d4",
             @"fa-hacker-news-square" : @"\uf3af",
             @"fa-hackerrank" : @"\uf5f7",
             @"fa-hammer" : @"\uf6e3",
             @"fa-hammer-war" : @"\uf6e4",
             @"fa-hamsa" : @"\uf665",
             @"fa-hand-heart" : @"\uf4bc",
             @"fa-hand-holding" : @"\uf4bd",
             @"fa-hand-holding-box" : @"\uf47b",
             @"fa-hand-holding-heart" : @"\uf4be",
             @"fa-hand-holding-magic" : @"\uf6e5",
             @"fa-hand-holding-seedling" : @"\uf4bf",
             @"fa-hand-holding-usd" : @"\uf4c0",
             @"fa-hand-holding-water" : @"\uf4c1",
             @"fa-hand-lizard" : @"\uf258",
             @"fa-hand-paper" : @"\uf256",
             @"fa-hand-peace" : @"\uf25b",
             @"fa-hand-point-down" : @"\uf0a7",
             @"fa-hand-point-left" : @"\uf0a5",
             @"fa-hand-point-right" : @"\uf0a4",
             @"fa-hand-point-up" : @"\uf0a6",
             @"fa-hand-pointer" : @"\uf25a",
             @"fa-hand-receiving" : @"\uf47c",
             @"fa-hand-rock" : @"\uf255",
             @"fa-hand-scissors" : @"\uf257",
             @"fa-hand-spock" : @"\uf259",
             @"fa-hands" : @"\uf4c2",
             @"fa-hands-heart" : @"\uf4c3",
             @"fa-hands-helping" : @"\uf4c4",
             @"fa-hands-usd" : @"\uf4c5",
             @"fa-handshake" : @"\uf2b5",
             @"fa-handshake-alt" : @"\uf4c6",
             @"fa-hanukiah" : @"\uf6e6",
             @"fa-hashtag" : @"\uf292",
             @"fa-hat-witch" : @"\uf6e7",
             @"fa-hat-wizard" : @"\uf6e8",
             @"fa-haykal" : @"\uf666",
             @"fa-hdd" : @"\uf0a0",
             @"fa-head-side" : @"\uf6e9",
             @"fa-head-vr" : @"\uf6ea",
             @"fa-heading" : @"\uf1dc",
             @"fa-headphones" : @"\uf025",
             @"fa-headphones-alt" : @"\uf58f",
             @"fa-headset" : @"\uf590",
             @"fa-heart" : @"\uf004",
             @"fa-heart-circle" : @"\uf4c7",
             @"fa-heart-rate" : @"\uf5f8",
             @"fa-heart-square" : @"\uf4c8",
             @"fa-heartbeat" : @"\uf21e",
             @"fa-helicopter" : @"\uf533",
             @"fa-helmet-battle" : @"\uf6eb",
             @"fa-hexagon" : @"\uf312",
             @"fa-highlighter" : @"\uf591",
             @"fa-hiking" : @"\uf6ec",
             @"fa-hippo" : @"\uf6ed",
             @"fa-hips" : @"\uf452",
             @"fa-hire-a-helper" : @"\uf3b0",
             @"fa-history" : @"\uf1da",
             @"fa-hockey-mask" : @"\uf6ee",
             @"fa-hockey-puck" : @"\uf453",
             @"fa-hockey-sticks" : @"\uf454",
             @"fa-home" : @"\uf015",
             @"fa-home-heart" : @"\uf4c9",
             @"fa-hood-cloak" : @"\uf6ef",
             @"fa-hooli" : @"\uf427",
             @"fa-hornbill" : @"\uf592",
             @"fa-horse" : @"\uf6f0",
             @"fa-hospital" : @"\uf0f8",
             @"fa-hospital-alt" : @"\uf47d",
             @"fa-hospital-symbol" : @"\uf47e",
             @"fa-hot-tub" : @"\uf593",
             @"fa-hotel" : @"\uf594",
             @"fa-hotjar" : @"\uf3b1",
             @"fa-hourglass" : @"\uf254",
             @"fa-hourglass-end" : @"\uf253",
             @"fa-hourglass-half" : @"\uf252",
             @"fa-hourglass-start" : @"\uf251",
             @"fa-house-damage" : @"\uf6f1",
             @"fa-house-flood" : @"\uf74f",
             @"fa-houzz" : @"\uf27c",
             @"fa-hryvnia" : @"\uf6f2",
             @"fa-html5" : @"\uf13b",
             @"fa-hubspot" : @"\uf3b2",
             @"fa-humidity" : @"\uf750",
             @"fa-hurricane" : @"\uf751",
             @"fa-i-cursor" : @"\uf246",
             @"fa-id-badge" : @"\uf2c1",
             @"fa-id-card" : @"\uf2c2",
             @"fa-id-card-alt" : @"\uf47f",
             @"fa-image" : @"\uf03e",
             @"fa-images" : @"\uf302",
             @"fa-imdb" : @"\uf2d8",
             @"fa-inbox" : @"\uf01c",
             @"fa-inbox-in" : @"\uf310",
             @"fa-inbox-out" : @"\uf311",
             @"fa-indent" : @"\uf03c",
             @"fa-industry" : @"\uf275",
             @"fa-industry-alt" : @"\uf3b3",
             @"fa-infinity" : @"\uf534",
             @"fa-info" : @"\uf129",
             @"fa-info-circle" : @"\uf05a",
             @"fa-info-square" : @"\uf30f",
             @"fa-inhaler" : @"\uf5f9",
             @"fa-instagram" : @"\uf16d",
             @"fa-integral" : @"\uf667",
             @"fa-internet-explorer" : @"\uf26b",
             @"fa-intersection" : @"\uf668",
             @"fa-inventory" : @"\uf480",
             @"fa-ioxhost" : @"\uf208",
             @"fa-italic" : @"\uf033",
             @"fa-itunes" : @"\uf3b4",
             @"fa-itunes-note" : @"\uf3b5",
             @"fa-jack-o-lantern" : @"\uf30e",
             @"fa-java" : @"\uf4e4",
             @"fa-jedi" : @"\uf669",
             @"fa-jedi-order" : @"\uf50e",
             @"fa-jenkins" : @"\uf3b6",
             @"fa-joget" : @"\uf3b7",
             @"fa-joint" : @"\uf595",
             @"fa-joomla" : @"\uf1aa",
             @"fa-journal-whills" : @"\uf66a",
             @"fa-js" : @"\uf3b8",
             @"fa-js-square" : @"\uf3b9",
             @"fa-jsfiddle" : @"\uf1cc",
             @"fa-kaaba" : @"\uf66b",
             @"fa-kaggle" : @"\uf5fa",
             @"fa-key" : @"\uf084",
             @"fa-key-skeleton" : @"\uf6f3",
             @"fa-keybase" : @"\uf4f5",
             @"fa-keyboard" : @"\uf11c",
             @"fa-keycdn" : @"\uf3ba",
             @"fa-keynote" : @"\uf66c",
             @"fa-khanda" : @"\uf66d",
             @"fa-kickstarter" : @"\uf3bb",
             @"fa-kickstarter-k" : @"\uf3bc",
             @"fa-kidneys" : @"\uf5fb",
             @"fa-kiss" : @"\uf596",
             @"fa-kiss-beam" : @"\uf597",
             @"fa-kiss-wink-heart" : @"\uf598",
             @"fa-kite" : @"\uf6f4",
             @"fa-kiwi-bird" : @"\uf535",
             @"fa-knife-kitchen" : @"\uf6f5",
             @"fa-korvue" : @"\uf42f",
             @"fa-lambda" : @"\uf66e",
             @"fa-lamp" : @"\uf4ca",
             @"fa-landmark" : @"\uf66f",
             @"fa-landmark-alt" : @"\uf752",
             @"fa-language" : @"\uf1ab",
             @"fa-laptop" : @"\uf109",
             @"fa-laptop-code" : @"\uf5fc",
             @"fa-laravel" : @"\uf3bd",
             @"fa-lastfm" : @"\uf202",
             @"fa-lastfm-square" : @"\uf203",
             @"fa-laugh" : @"\uf599",
             @"fa-laugh-beam" : @"\uf59a",
             @"fa-laugh-squint" : @"\uf59b",
             @"fa-laugh-wink" : @"\uf59c",
             @"fa-layer-group" : @"\uf5fd",
             @"fa-layer-minus" : @"\uf5fe",
             @"fa-layer-plus" : @"\uf5ff",
             @"fa-leaf" : @"\uf06c",
             @"fa-leaf-heart" : @"\uf4cb",
             @"fa-leaf-maple" : @"\uf6f6",
             @"fa-leaf-oak" : @"\uf6f7",
             @"fa-leanpub" : @"\uf212",
             @"fa-lemon" : @"\uf094",
             @"fa-less" : @"\uf41d",
             @"fa-less-than" : @"\uf536",
             @"fa-less-than-equal" : @"\uf537",
             @"fa-level-down" : @"\uf149",
             @"fa-level-down-alt" : @"\uf3be",
             @"fa-level-up" : @"\uf148",
             @"fa-level-up-alt" : @"\uf3bf",
             @"fa-life-ring" : @"\uf1cd",
             @"fa-lightbulb" : @"\uf0eb",
             @"fa-lightbulb-dollar" : @"\uf670",
             @"fa-lightbulb-exclamation" : @"\uf671",
             @"fa-lightbulb-on" : @"\uf672",
             @"fa-lightbulb-slash" : @"\uf673",
             @"fa-line" : @"\uf3c0",
             @"fa-link" : @"\uf0c1",
             @"fa-linkedin" : @"\uf08c",
             @"fa-linkedin-in" : @"\uf0e1",
             @"fa-linode" : @"\uf2b8",
             @"fa-linux" : @"\uf17c",
             @"fa-lips" : @"\uf600",
             @"fa-lira-sign" : @"\uf195",
             @"fa-list" : @"\uf03a",
             @"fa-list-alt" : @"\uf022",
             @"fa-list-ol" : @"\uf0cb",
             @"fa-list-ul" : @"\uf0ca",
             @"fa-location" : @"\uf601",
             @"fa-location-arrow" : @"\uf124",
             @"fa-location-circle" : @"\uf602",
             @"fa-location-slash" : @"\uf603",
             @"fa-lock" : @"\uf023",
             @"fa-lock-alt" : @"\uf30d",
             @"fa-lock-open" : @"\uf3c1",
             @"fa-lock-open-alt" : @"\uf3c2",
             @"fa-long-arrow-alt-down" : @"\uf309",
             @"fa-long-arrow-alt-left" : @"\uf30a",
             @"fa-long-arrow-alt-right" : @"\uf30b",
             @"fa-long-arrow-alt-up" : @"\uf30c",
             @"fa-long-arrow-down" : @"\uf175",
             @"fa-long-arrow-left" : @"\uf177",
             @"fa-long-arrow-right" : @"\uf178",
             @"fa-long-arrow-up" : @"\uf176",
             @"fa-loveseat" : @"\uf4cc",
             @"fa-low-vision" : @"\uf2a8",
             @"fa-luchador" : @"\uf455",
             @"fa-luggage-cart" : @"\uf59d",
             @"fa-lungs" : @"\uf604",
             @"fa-lyft" : @"\uf3c3",
             @"fa-mace" : @"\uf6f8",
             @"fa-magento" : @"\uf3c4",
             @"fa-magic" : @"\uf0d0",
             @"fa-magnet" : @"\uf076",
             @"fa-mail-bulk" : @"\uf674",
             @"fa-mailchimp" : @"\uf59e",
             @"fa-male" : @"\uf183",
             @"fa-mandalorian" : @"\uf50f",
             @"fa-mandolin" : @"\uf6f9",
             @"fa-map" : @"\uf279",
             @"fa-map-marked" : @"\uf59f",
             @"fa-map-marked-alt" : @"\uf5a0",
             @"fa-map-marker" : @"\uf041",
             @"fa-map-marker-alt" : @"\uf3c5",
             @"fa-map-marker-alt-slash" : @"\uf605",
             @"fa-map-marker-check" : @"\uf606",
             @"fa-map-marker-edit" : @"\uf607",
             @"fa-map-marker-exclamation" : @"\uf608",
             @"fa-map-marker-minus" : @"\uf609",
             @"fa-map-marker-plus" : @"\uf60a",
             @"fa-map-marker-question" : @"\uf60b",
             @"fa-map-marker-slash" : @"\uf60c",
             @"fa-map-marker-smile" : @"\uf60d",
             @"fa-map-marker-times" : @"\uf60e",
             @"fa-map-pin" : @"\uf276",
             @"fa-map-signs" : @"\uf277",
             @"fa-markdown" : @"\uf60f",
             @"fa-marker" : @"\uf5a1",
             @"fa-mars" : @"\uf222",
             @"fa-mars-double" : @"\uf227",
             @"fa-mars-stroke" : @"\uf229",
             @"fa-mars-stroke-h" : @"\uf22b",
             @"fa-mars-stroke-v" : @"\uf22a",
             @"fa-mask" : @"\uf6fa",
             @"fa-mastodon" : @"\uf4f6",
             @"fa-maxcdn" : @"\uf136",
             @"fa-medal" : @"\uf5a2",
             @"fa-medapps" : @"\uf3c6",
             @"fa-medium" : @"\uf23a",
             @"fa-medium-m" : @"\uf3c7",
             @"fa-medkit" : @"\uf0fa",
             @"fa-medrt" : @"\uf3c8",
             @"fa-meetup" : @"\uf2e0",
             @"fa-megaphone" : @"\uf675",
             @"fa-megaport" : @"\uf5a3",
             @"fa-meh" : @"\uf11a",
             @"fa-meh-blank" : @"\uf5a4",
             @"fa-meh-rolling-eyes" : @"\uf5a5",
             @"fa-memory" : @"\uf538",
             @"fa-menorah" : @"\uf676",
             @"fa-mercury" : @"\uf223",
             @"fa-meteor" : @"\uf753",
             @"fa-microchip" : @"\uf2db",
             @"fa-microphone" : @"\uf130",
             @"fa-microphone-alt" : @"\uf3c9",
             @"fa-microphone-alt-slash" : @"\uf539",
             @"fa-microphone-slash" : @"\uf131",
             @"fa-microscope" : @"\uf610",
             @"fa-microsoft" : @"\uf3ca",
             @"fa-mind-share" : @"\uf677",
             @"fa-minus" : @"\uf068",
             @"fa-minus-circle" : @"\uf056",
             @"fa-minus-hexagon" : @"\uf307",
             @"fa-minus-octagon" : @"\uf308",
             @"fa-minus-square" : @"\uf146",
             @"fa-mix" : @"\uf3cb",
             @"fa-mixcloud" : @"\uf289",
             @"fa-mizuni" : @"\uf3cc",
             @"fa-mobile" : @"\uf10b",
             @"fa-mobile-alt" : @"\uf3cd",
             @"fa-mobile-android" : @"\uf3ce",
             @"fa-mobile-android-alt" : @"\uf3cf",
             @"fa-modx" : @"\uf285",
             @"fa-monero" : @"\uf3d0",
             @"fa-money-bill" : @"\uf0d6",
             @"fa-money-bill-alt" : @"\uf3d1",
             @"fa-money-bill-wave" : @"\uf53a",
             @"fa-money-bill-wave-alt" : @"\uf53b",
             @"fa-money-check" : @"\uf53c",
             @"fa-money-check-alt" : @"\uf53d",
             @"fa-monitor-heart-rate" : @"\uf611",
             @"fa-monkey" : @"\uf6fb",
             @"fa-monument" : @"\uf5a6",
             @"fa-moon" : @"\uf186",
             @"fa-moon-cloud" : @"\uf754",
             @"fa-moon-stars" : @"\uf755",
             @"fa-mortar-pestle" : @"\uf5a7",
             @"fa-mosque" : @"\uf678",
             @"fa-motorcycle" : @"\uf21c",
             @"fa-mountain" : @"\uf6fc",
             @"fa-mountains" : @"\uf6fd",
             @"fa-mouse-pointer" : @"\uf245",
             @"fa-music" : @"\uf001",
             @"fa-napster" : @"\uf3d2",
             @"fa-narwhal" : @"\uf6fe",
             @"fa-neos" : @"\uf612",
             @"fa-network-wired" : @"\uf6ff",
             @"fa-neuter" : @"\uf22c",
             @"fa-newspaper" : @"\uf1ea",
             @"fa-nimblr" : @"\uf5a8",
             @"fa-nintendo-switch" : @"\uf418",
             @"fa-node" : @"\uf419",
             @"fa-node-js" : @"\uf3d3",
             @"fa-not-equal" : @"\uf53e",
             @"fa-notes-medical" : @"\uf481",
             @"fa-npm" : @"\uf3d4",
             @"fa-ns8" : @"\uf3d5",
             @"fa-nutritionix" : @"\uf3d6",
             @"fa-object-group" : @"\uf247",
             @"fa-object-ungroup" : @"\uf248",
             @"fa-octagon" : @"\uf306",
             @"fa-odnoklassniki" : @"\uf263",
             @"fa-odnoklassniki-square" : @"\uf264",
             @"fa-oil-can" : @"\uf613",
             @"fa-oil-temp" : @"\uf614",
             @"fa-old-republic" : @"\uf510",
             @"fa-om" : @"\uf679",
             @"fa-omega" : @"\uf67a",
             @"fa-opencart" : @"\uf23d",
             @"fa-openid" : @"\uf19b",
             @"fa-opera" : @"\uf26a",
             @"fa-optin-monster" : @"\uf23c",
             @"fa-osi" : @"\uf41a",
             @"fa-otter" : @"\uf700",
             @"fa-outdent" : @"\uf03b",
             @"fa-page4" : @"\uf3d7",
             @"fa-pagelines" : @"\uf18c",
             @"fa-paint-brush" : @"\uf1fc",
             @"fa-paint-brush-alt" : @"\uf5a9",
             @"fa-paint-roller" : @"\uf5aa",
             @"fa-palette" : @"\uf53f",
             @"fa-palfed" : @"\uf3d8",
             @"fa-pallet" : @"\uf482",
             @"fa-pallet-alt" : @"\uf483",
             @"fa-paper-plane" : @"\uf1d8",
             @"fa-paperclip" : @"\uf0c6",
             @"fa-parachute-box" : @"\uf4cd",
             @"fa-paragraph" : @"\uf1dd",
             @"fa-parking" : @"\uf540",
             @"fa-parking-circle" : @"\uf615",
             @"fa-parking-circle-slash" : @"\uf616",
             @"fa-parking-slash" : @"\uf617",
             @"fa-passport" : @"\uf5ab",
             @"fa-pastafarianism" : @"\uf67b",
             @"fa-paste" : @"\uf0ea",
             @"fa-patreon" : @"\uf3d9",
             @"fa-pause" : @"\uf04c",
             @"fa-pause-circle" : @"\uf28b",
             @"fa-paw" : @"\uf1b0",
             @"fa-paw-alt" : @"\uf701",
             @"fa-paw-claws" : @"\uf702",
             @"fa-paypal" : @"\uf1ed",
             @"fa-peace" : @"\uf67c",
             @"fa-pegasus" : @"\uf703",
             @"fa-pen" : @"\uf304",
             @"fa-pen-alt" : @"\uf305",
             @"fa-pen-fancy" : @"\uf5ac",
             @"fa-pen-nib" : @"\uf5ad",
             @"fa-pen-square" : @"\uf14b",
             @"fa-pencil" : @"\uf040",
             @"fa-pencil-alt" : @"\uf303",
             @"fa-pencil-paintbrush" : @"\uf618",
             @"fa-pencil-ruler" : @"\uf5ae",
             @"fa-pennant" : @"\uf456",
             @"fa-penny-arcade" : @"\uf704",
             @"fa-people-carry" : @"\uf4ce",
             @"fa-percent" : @"\uf295",
             @"fa-percentage" : @"\uf541",
             @"fa-periscope" : @"\uf3da",
             @"fa-person-booth" : @"\uf756",
             @"fa-person-carry" : @"\uf4cf",
             @"fa-person-dolly" : @"\uf4d0",
             @"fa-person-dolly-empty" : @"\uf4d1",
             @"fa-person-sign" : @"\uf757",
             @"fa-phabricator" : @"\uf3db",
             @"fa-phoenix-framework" : @"\uf3dc",
             @"fa-phoenix-squadron" : @"\uf511",
             @"fa-phone" : @"\uf095",
             @"fa-phone-office" : @"\uf67d",
             @"fa-phone-plus" : @"\uf4d2",
             @"fa-phone-slash" : @"\uf3dd",
             @"fa-phone-square" : @"\uf098",
             @"fa-phone-volume" : @"\uf2a0",
             @"fa-php" : @"\uf457",
             @"fa-pi" : @"\uf67e",
             @"fa-pie" : @"\uf705",
             @"fa-pied-piper" : @"\uf2ae",
             @"fa-pied-piper-alt" : @"\uf1a8",
             @"fa-pied-piper-hat" : @"\uf4e5",
             @"fa-pied-piper-pp" : @"\uf1a7",
             @"fa-pig" : @"\uf706",
             @"fa-piggy-bank" : @"\uf4d3",
             @"fa-pills" : @"\uf484",
             @"fa-pinterest" : @"\uf0d2",
             @"fa-pinterest-p" : @"\uf231",
             @"fa-pinterest-square" : @"\uf0d3",
             @"fa-place-of-worship" : @"\uf67f",
             @"fa-plane" : @"\uf072",
             @"fa-plane-alt" : @"\uf3de",
             @"fa-plane-arrival" : @"\uf5af",
             @"fa-plane-departure" : @"\uf5b0",
             @"fa-play" : @"\uf04b",
             @"fa-play-circle" : @"\uf144",
             @"fa-playstation" : @"\uf3df",
             @"fa-plug" : @"\uf1e6",
             @"fa-plus" : @"\uf067",
             @"fa-plus-circle" : @"\uf055",
             @"fa-plus-hexagon" : @"\uf300",
             @"fa-plus-octagon" : @"\uf301",
             @"fa-plus-square" : @"\uf0fe",
             @"fa-podcast" : @"\uf2ce",
             @"fa-podium" : @"\uf680",
             @"fa-podium-star" : @"\uf758",
             @"fa-poll" : @"\uf681",
             @"fa-poll-h" : @"\uf682",
             @"fa-poll-people" : @"\uf759",
             @"fa-poo" : @"\uf2fe",
             @"fa-poo-storm" : @"\uf75a",
             @"fa-poop" : @"\uf619",
             @"fa-portrait" : @"\uf3e0",
             @"fa-pound-sign" : @"\uf154",
             @"fa-power-off" : @"\uf011",
             @"fa-pray" : @"\uf683",
             @"fa-praying-hands" : @"\uf684",
             @"fa-prescription" : @"\uf5b1",
             @"fa-prescription-bottle" : @"\uf485",
             @"fa-prescription-bottle-alt" : @"\uf486",
             @"fa-presentation" : @"\uf685",
             @"fa-print" : @"\uf02f",
             @"fa-print-slash" : @"\uf686",
             @"fa-procedures" : @"\uf487",
             @"fa-product-hunt" : @"\uf288",
             @"fa-project-diagram" : @"\uf542",
             @"fa-pumpkin" : @"\uf707",
             @"fa-pushed" : @"\uf3e1",
             @"fa-puzzle-piece" : @"\uf12e",
             @"fa-python" : @"\uf3e2",
             @"fa-qq" : @"\uf1d6",
             @"fa-qrcode" : @"\uf029",
             @"fa-question" : @"\uf128",
             @"fa-question-circle" : @"\uf059",
             @"fa-question-square" : @"\uf2fd",
             @"fa-quidditch" : @"\uf458",
             @"fa-quinscape" : @"\uf459",
             @"fa-quora" : @"\uf2c4",
             @"fa-quote-left" : @"\uf10d",
             @"fa-quote-right" : @"\uf10e",
             @"fa-quran" : @"\uf687",
             @"fa-r-project" : @"\uf4f7",
             @"fa-rabbit" : @"\uf708",
             @"fa-rabbit-fast" : @"\uf709",
             @"fa-racquet" : @"\uf45a",
             @"fa-rainbow" : @"\uf75b",
             @"fa-raindrops" : @"\uf75c",
             @"fa-ram" : @"\uf70a",
             @"fa-ramp-loading" : @"\uf4d4",
             @"fa-random" : @"\uf074",
             @"fa-ravelry" : @"\uf2d9",
             @"fa-react" : @"\uf41b",
             @"fa-reacteurope" : @"\uf75d",
             @"fa-readme" : @"\uf4d5",
             @"fa-rebel" : @"\uf1d0",
             @"fa-receipt" : @"\uf543",
             @"fa-rectangle-landscape" : @"\uf2fa",
             @"fa-rectangle-portrait" : @"\uf2fb",
             @"fa-rectangle-wide" : @"\uf2fc",
             @"fa-recycle" : @"\uf1b8",
             @"fa-red-river" : @"\uf3e3",
             @"fa-reddit" : @"\uf1a1",
             @"fa-reddit-alien" : @"\uf281",
             @"fa-reddit-square" : @"\uf1a2",
             @"fa-redo" : @"\uf01e",
             @"fa-redo-alt" : @"\uf2f9",
             @"fa-registered" : @"\uf25d",
             @"fa-renren" : @"\uf18b",
             @"fa-repeat" : @"\uf363",
             @"fa-repeat-1" : @"\uf365",
             @"fa-repeat-1-alt" : @"\uf366",
             @"fa-repeat-alt" : @"\uf364",
             @"fa-reply" : @"\uf3e5",
             @"fa-reply-all" : @"\uf122",
             @"fa-replyd" : @"\uf3e6",
             @"fa-republican" : @"\uf75e",
             @"fa-researchgate" : @"\uf4f8",
             @"fa-resolving" : @"\uf3e7",
             @"fa-retweet" : @"\uf079",
             @"fa-retweet-alt" : @"\uf361",
             @"fa-rev" : @"\uf5b2",
             @"fa-ribbon" : @"\uf4d6",
             @"fa-ring" : @"\uf70b",
             @"fa-road" : @"\uf018",
             @"fa-robot" : @"\uf544",
             @"fa-rocket" : @"\uf135",
             @"fa-rocketchat" : @"\uf3e8",
             @"fa-rockrms" : @"\uf3e9",
             @"fa-route" : @"\uf4d7",
             @"fa-route-highway" : @"\uf61a",
             @"fa-route-interstate" : @"\uf61b",
             @"fa-rss" : @"\uf09e",
             @"fa-rss-square" : @"\uf143",
             @"fa-ruble-sign" : @"\uf158",
             @"fa-ruler" : @"\uf545",
             @"fa-ruler-combined" : @"\uf546",
             @"fa-ruler-horizontal" : @"\uf547",
             @"fa-ruler-triangle" : @"\uf61c",
             @"fa-ruler-vertical" : @"\uf548",
             @"fa-running" : @"\uf70c",
             @"fa-rupee-sign" : @"\uf156",
             @"fa-sad-cry" : @"\uf5b3",
             @"fa-sad-tear" : @"\uf5b4",
             @"fa-safari" : @"\uf267",
             @"fa-sass" : @"\uf41e",
             @"fa-save" : @"\uf0c7",
             @"fa-scalpel" : @"\uf61d",
             @"fa-scalpel-path" : @"\uf61e",
             @"fa-scanner" : @"\uf488",
             @"fa-scanner-keyboard" : @"\uf489",
             @"fa-scanner-touchscreen" : @"\uf48a",
             @"fa-scarecrow" : @"\uf70d",
             @"fa-schlix" : @"\uf3ea",
             @"fa-school" : @"\uf549",
             @"fa-screwdriver" : @"\uf54a",
             @"fa-scribd" : @"\uf28a",
             @"fa-scroll" : @"\uf70e",
             @"fa-scroll-old" : @"\uf70f",
             @"fa-scrubber" : @"\uf2f8",
             @"fa-scythe" : @"\uf710",
             @"fa-search" : @"\uf002",
             @"fa-search-dollar" : @"\uf688",
             @"fa-search-location" : @"\uf689",
             @"fa-search-minus" : @"\uf010",
             @"fa-search-plus" : @"\uf00e",
             @"fa-searchengin" : @"\uf3eb",
             @"fa-seedling" : @"\uf4d8",
             @"fa-sellcast" : @"\uf2da",
             @"fa-sellsy" : @"\uf213",
             @"fa-server" : @"\uf233",
             @"fa-servicestack" : @"\uf3ec",
             @"fa-shapes" : @"\uf61f",
             @"fa-share" : @"\uf064",
             @"fa-share-all" : @"\uf367",
             @"fa-share-alt" : @"\uf1e0",
             @"fa-share-alt-square" : @"\uf1e1",
             @"fa-share-square" : @"\uf14d",
             @"fa-sheep" : @"\uf711",
             @"fa-shekel-sign" : @"\uf20b",
             @"fa-shield" : @"\uf132",
             @"fa-shield-alt" : @"\uf3ed",
             @"fa-shield-check" : @"\uf2f7",
             @"fa-shield-cross" : @"\uf712",
             @"fa-ship" : @"\uf21a",
             @"fa-shipping-fast" : @"\uf48b",
             @"fa-shipping-timed" : @"\uf48c",
             @"fa-shirtsinbulk" : @"\uf214",
             @"fa-shoe-prints" : @"\uf54b",
             @"fa-shopping-bag" : @"\uf290",
             @"fa-shopping-basket" : @"\uf291",
             @"fa-shopping-cart" : @"\uf07a",
             @"fa-shopware" : @"\uf5b5",
             @"fa-shovel" : @"\uf713",
             @"fa-shower" : @"\uf2cc",
             @"fa-shredder" : @"\uf68a",
             @"fa-shuttle-van" : @"\uf5b6",
             @"fa-shuttlecock" : @"\uf45b",
             @"fa-sigma" : @"\uf68b",
             @"fa-sign" : @"\uf4d9",
             @"fa-sign-in" : @"\uf090",
             @"fa-sign-in-alt" : @"\uf2f6",
             @"fa-sign-language" : @"\uf2a7",
             @"fa-sign-out" : @"\uf08b",
             @"fa-sign-out-alt" : @"\uf2f5",
             @"fa-signal" : @"\uf012",
             @"fa-signal-1" : @"\uf68c",
             @"fa-signal-2" : @"\uf68d",
             @"fa-signal-3" : @"\uf68e",
             @"fa-signal-4" : @"\uf68f",
             @"fa-signal-alt" : @"\uf690",
             @"fa-signal-alt-1" : @"\uf691",
             @"fa-signal-alt-2" : @"\uf692",
             @"fa-signal-alt-3" : @"\uf693",
             @"fa-signal-alt-slash" : @"\uf694",
             @"fa-signal-slash" : @"\uf695",
             @"fa-signature" : @"\uf5b7",
             @"fa-simplybuilt" : @"\uf215",
             @"fa-sistrix" : @"\uf3ee",
             @"fa-sitemap" : @"\uf0e8",
             @"fa-sith" : @"\uf512",
             @"fa-skeleton" : @"\uf620",
             @"fa-skull" : @"\uf54c",
             @"fa-skull-crossbones" : @"\uf714",
             @"fa-skyatlas" : @"\uf216",
             @"fa-skype" : @"\uf17e",
             @"fa-slack" : @"\uf198",
             @"fa-slack-hash" : @"\uf3ef",
             @"fa-slash" : @"\uf715",
             @"fa-sliders-h" : @"\uf1de",
             @"fa-sliders-h-square" : @"\uf3f0",
             @"fa-sliders-v" : @"\uf3f1",
             @"fa-sliders-v-square" : @"\uf3f2",
             @"fa-slideshare" : @"\uf1e7",
             @"fa-smile" : @"\uf118",
             @"fa-smile-beam" : @"\uf5b8",
             @"fa-smile-plus" : @"\uf5b9",
             @"fa-smile-wink" : @"\uf4da",
             @"fa-smog" : @"\uf75f",
             @"fa-smoke" : @"\uf760",
             @"fa-smoking" : @"\uf48d",
             @"fa-smoking-ban" : @"\uf54d",
             @"fa-snake" : @"\uf716",
             @"fa-snapchat" : @"\uf2ab",
             @"fa-snapchat-ghost" : @"\uf2ac",
             @"fa-snapchat-square" : @"\uf2ad",
             @"fa-snow-blowing" : @"\uf761",
             @"fa-snowflake" : @"\uf2dc",
             @"fa-socks" : @"\uf696",
             @"fa-solar-panel" : @"\uf5ba",
             @"fa-sort" : @"\uf0dc",
             @"fa-sort-alpha-down" : @"\uf15d",
             @"fa-sort-alpha-up" : @"\uf15e",
             @"fa-sort-amount-down" : @"\uf160",
             @"fa-sort-amount-up" : @"\uf161",
             @"fa-sort-down" : @"\uf0dd",
             @"fa-sort-numeric-down" : @"\uf162",
             @"fa-sort-numeric-up" : @"\uf163",
             @"fa-sort-up" : @"\uf0de",
             @"fa-soundcloud" : @"\uf1be",
             @"fa-spa" : @"\uf5bb",
             @"fa-space-shuttle" : @"\uf197",
             @"fa-spade" : @"\uf2f4",
             @"fa-speakap" : @"\uf3f3",
             @"fa-spider" : @"\uf717",
             @"fa-spider-black-widow" : @"\uf718",
             @"fa-spider-web" : @"\uf719",
             @"fa-spinner" : @"\uf110",
             @"fa-spinner-third" : @"\uf3f4",
             @"fa-splotch" : @"\uf5bc",
             @"fa-spotify" : @"\uf1bc",
             @"fa-spray-can" : @"\uf5bd",
             @"fa-square" : @"\uf0c8",
             @"fa-square-full" : @"\uf45c",
             @"fa-square-root" : @"\uf697",
             @"fa-square-root-alt" : @"\uf698",
             @"fa-squarespace" : @"\uf5be",
             @"fa-squirrel" : @"\uf71a",
             @"fa-stack-exchange" : @"\uf18d",
             @"fa-stack-overflow" : @"\uf16c",
             @"fa-staff" : @"\uf71b",
             @"fa-stamp" : @"\uf5bf",
             @"fa-star" : @"\uf005",
             @"fa-star-and-crescent" : @"\uf699",
             @"fa-star-exclamation" : @"\uf2f3",
             @"fa-star-half" : @"\uf089",
             @"fa-star-half-alt" : @"\uf5c0",
             @"fa-star-of-david" : @"\uf69a",
             @"fa-star-of-life" : @"\uf621",
             @"fa-stars" : @"\uf762",
             @"fa-staylinked" : @"\uf3f5",
             @"fa-steam" : @"\uf1b6",
             @"fa-steam-square" : @"\uf1b7",
             @"fa-steam-symbol" : @"\uf3f6",
             @"fa-steering-wheel" : @"\uf622",
             @"fa-step-backward" : @"\uf048",
             @"fa-step-forward" : @"\uf051",
             @"fa-stethoscope" : @"\uf0f1",
             @"fa-sticker-mule" : @"\uf3f7",
             @"fa-sticky-note" : @"\uf249",
             @"fa-stomach" : @"\uf623",
             @"fa-stop" : @"\uf04d",
             @"fa-stop-circle" : @"\uf28d",
             @"fa-stopwatch" : @"\uf2f2",
             @"fa-store" : @"\uf54e",
             @"fa-store-alt" : @"\uf54f",
             @"fa-strava" : @"\uf428",
             @"fa-stream" : @"\uf550",
             @"fa-street-view" : @"\uf21d",
             @"fa-strikethrough" : @"\uf0cc",
             @"fa-stripe" : @"\uf429",
             @"fa-stripe-s" : @"\uf42a",
             @"fa-stroopwafel" : @"\uf551",
             @"fa-studiovinari" : @"\uf3f8",
             @"fa-stumbleupon" : @"\uf1a4",
             @"fa-stumbleupon-circle" : @"\uf1a3",
             @"fa-subscript" : @"\uf12c",
             @"fa-subway" : @"\uf239",
             @"fa-suitcase" : @"\uf0f2",
             @"fa-suitcase-rolling" : @"\uf5c1",
             @"fa-sun" : @"\uf185",
             @"fa-sun-cloud" : @"\uf763",
             @"fa-sun-dust" : @"\uf764",
             @"fa-sun-haze" : @"\uf765",
             @"fa-sunrise" : @"\uf766",
             @"fa-sunset" : @"\uf767",
             @"fa-superpowers" : @"\uf2dd",
             @"fa-superscript" : @"\uf12b",
             @"fa-supple" : @"\uf3f9",
             @"fa-surprise" : @"\uf5c2",
             @"fa-swatchbook" : @"\uf5c3",
             @"fa-swimmer" : @"\uf5c4",
             @"fa-swimming-pool" : @"\uf5c5",
             @"fa-sword" : @"\uf71c",
             @"fa-swords" : @"\uf71d",
             @"fa-synagogue" : @"\uf69b",
             @"fa-sync" : @"\uf021",
             @"fa-sync-alt" : @"\uf2f1",
             @"fa-syringe" : @"\uf48e",
             @"fa-table" : @"\uf0ce",
             @"fa-table-tennis" : @"\uf45d",
             @"fa-tablet" : @"\uf10a",
             @"fa-tablet-alt" : @"\uf3fa",
             @"fa-tablet-android" : @"\uf3fb",
             @"fa-tablet-android-alt" : @"\uf3fc",
             @"fa-tablet-rugged" : @"\uf48f",
             @"fa-tablets" : @"\uf490",
             @"fa-tachometer" : @"\uf0e4",
             @"fa-tachometer-alt" : @"\uf3fd",
             @"fa-tachometer-alt-average" : @"\uf624",
             @"fa-tachometer-alt-fast" : @"\uf625",
             @"fa-tachometer-alt-fastest" : @"\uf626",
             @"fa-tachometer-alt-slow" : @"\uf627",
             @"fa-tachometer-alt-slowest" : @"\uf628",
             @"fa-tachometer-average" : @"\uf629",
             @"fa-tachometer-fast" : @"\uf62a",
             @"fa-tachometer-fastest" : @"\uf62b",
             @"fa-tachometer-slow" : @"\uf62c",
             @"fa-tachometer-slowest" : @"\uf62d",
             @"fa-tag" : @"\uf02b",
             @"fa-tags" : @"\uf02c",
             @"fa-tally" : @"\uf69c",
             @"fa-tape" : @"\uf4db",
             @"fa-tasks" : @"\uf0ae",
             @"fa-taxi" : @"\uf1ba",
             @"fa-teamspeak" : @"\uf4f9",
             @"fa-teeth" : @"\uf62e",
             @"fa-teeth-open" : @"\uf62f",
             @"fa-telegram" : @"\uf2c6",
             @"fa-telegram-plane" : @"\uf3fe",
             @"fa-temperature-frigid" : @"\uf768",
             @"fa-temperature-high" : @"\uf769",
             @"fa-temperature-hot" : @"\uf76a",
             @"fa-temperature-low" : @"\uf76b",
             @"fa-tencent-weibo" : @"\uf1d5",
             @"fa-tennis-ball" : @"\uf45e",
             @"fa-terminal" : @"\uf120",
             @"fa-text-height" : @"\uf034",
             @"fa-text-width" : @"\uf035",
             @"fa-th" : @"\uf00a",
             @"fa-th-large" : @"\uf009",
             @"fa-th-list" : @"\uf00b",
             @"fa-the-red-yeti" : @"\uf69d",
             @"fa-theater-masks" : @"\uf630",
             @"fa-themeco" : @"\uf5c6",
             @"fa-themeisle" : @"\uf2b2",
             @"fa-thermometer" : @"\uf491",
             @"fa-thermometer-empty" : @"\uf2cb",
             @"fa-thermometer-full" : @"\uf2c7",
             @"fa-thermometer-half" : @"\uf2c9",
             @"fa-thermometer-quarter" : @"\uf2ca",
             @"fa-thermometer-three-quarters" : @"\uf2c8",
             @"fa-theta" : @"\uf69e",
             @"fa-think-peaks" : @"\uf731",
             @"fa-thumbs-down" : @"\uf165",
             @"fa-thumbs-up" : @"\uf164",
             @"fa-thumbtack" : @"\uf08d",
             @"fa-thunderstorm" : @"\uf76c",
             @"fa-thunderstorm-moon" : @"\uf76d",
             @"fa-thunderstorm-sun" : @"\uf76e",
             @"fa-ticket" : @"\uf145",
             @"fa-ticket-alt" : @"\uf3ff",
             @"fa-tilde" : @"\uf69f",
             @"fa-times" : @"\uf00d",
             @"fa-times-circle" : @"\uf057",
             @"fa-times-hexagon" : @"\uf2ee",
             @"fa-times-octagon" : @"\uf2f0",
             @"fa-times-square" : @"\uf2d3",
             @"fa-tint" : @"\uf043",
             @"fa-tint-slash" : @"\uf5c7",
             @"fa-tire" : @"\uf631",
             @"fa-tire-flat" : @"\uf632",
             @"fa-tire-pressure-warning" : @"\uf633",
             @"fa-tire-rugged" : @"\uf634",
             @"fa-tired" : @"\uf5c8",
             @"fa-toggle-off" : @"\uf204",
             @"fa-toggle-on" : @"\uf205",
             @"fa-toilet-paper" : @"\uf71e",
             @"fa-toilet-paper-alt" : @"\uf71f",
             @"fa-tombstone" : @"\uf720",
             @"fa-tombstone-alt" : @"\uf721",
             @"fa-toolbox" : @"\uf552",
             @"fa-tooth" : @"\uf5c9",
             @"fa-toothbrush" : @"\uf635",
             @"fa-torah" : @"\uf6a0",
             @"fa-torii-gate" : @"\uf6a1",
             @"fa-tornado" : @"\uf76f",
             @"fa-tractor" : @"\uf722",
             @"fa-trade-federation" : @"\uf513",
             @"fa-trademark" : @"\uf25c",
             @"fa-traffic-cone" : @"\uf636",
             @"fa-traffic-light" : @"\uf637",
             @"fa-traffic-light-go" : @"\uf638",
             @"fa-traffic-light-slow" : @"\uf639",
             @"fa-traffic-light-stop" : @"\uf63a",
             @"fa-train" : @"\uf238",
             @"fa-transgender" : @"\uf224",
             @"fa-transgender-alt" : @"\uf225",
             @"fa-trash" : @"\uf1f8",
             @"fa-trash-alt" : @"\uf2ed",
             @"fa-treasure-chest" : @"\uf723",
             @"fa-tree" : @"\uf1bb",
             @"fa-tree-alt" : @"\uf400",
             @"fa-trees" : @"\uf724",
             @"fa-trello" : @"\uf181",
             @"fa-triangle" : @"\uf2ec",
             @"fa-tripadvisor" : @"\uf262",
             @"fa-trophy" : @"\uf091",
             @"fa-trophy-alt" : @"\uf2eb",
             @"fa-truck" : @"\uf0d1",
             @"fa-truck-container" : @"\uf4dc",
             @"fa-truck-couch" : @"\uf4dd",
             @"fa-truck-loading" : @"\uf4de",
             @"fa-truck-monster" : @"\uf63b",
             @"fa-truck-moving" : @"\uf4df",
             @"fa-truck-pickup" : @"\uf63c",
             @"fa-truck-ramp" : @"\uf4e0",
             @"fa-tshirt" : @"\uf553",
             @"fa-tty" : @"\uf1e4",
             @"fa-tumblr" : @"\uf173",
             @"fa-tumblr-square" : @"\uf174",
             @"fa-turkey" : @"\uf725",
             @"fa-turtle" : @"\uf726",
             @"fa-tv" : @"\uf26c",
             @"fa-tv-retro" : @"\uf401",
             @"fa-twitch" : @"\uf1e8",
             @"fa-twitter" : @"\uf099",
             @"fa-twitter-square" : @"\uf081",
             @"fa-typo3" : @"\uf42b",
             @"fa-uber" : @"\uf402",
             @"fa-uikit" : @"\uf403",
             @"fa-umbrella" : @"\uf0e9",
             @"fa-umbrella-beach" : @"\uf5ca",
             @"fa-underline" : @"\uf0cd",
             @"fa-undo" : @"\uf0e2",
             @"fa-undo-alt" : @"\uf2ea",
             @"fa-unicorn" : @"\uf727",
             @"fa-union" : @"\uf6a2",
             @"fa-uniregistry" : @"\uf404",
             @"fa-universal-access" : @"\uf29a",
             @"fa-university" : @"\uf19c",
             @"fa-unlink" : @"\uf127",
             @"fa-unlock" : @"\uf09c",
             @"fa-unlock-alt" : @"\uf13e",
             @"fa-untappd" : @"\uf405",
             @"fa-upload" : @"\uf093",
             @"fa-usb" : @"\uf287",
             @"fa-usd-circle" : @"\uf2e8",
             @"fa-usd-square" : @"\uf2e9",
             @"fa-user" : @"\uf007",
             @"fa-user-alt" : @"\uf406",
             @"fa-user-alt-slash" : @"\uf4fa",
             @"fa-user-astronaut" : @"\uf4fb",
             @"fa-user-chart" : @"\uf6a3",
             @"fa-user-check" : @"\uf4fc",
             @"fa-user-circle" : @"\uf2bd",
             @"fa-user-clock" : @"\uf4fd",
             @"fa-user-cog" : @"\uf4fe",
             @"fa-user-crown" : @"\uf6a4",
             @"fa-user-edit" : @"\uf4ff",
             @"fa-user-friends" : @"\uf500",
             @"fa-user-graduate" : @"\uf501",
             @"fa-user-injured" : @"\uf728",
             @"fa-user-lock" : @"\uf502",
             @"fa-user-md" : @"\uf0f0",
             @"fa-user-minus" : @"\uf503",
             @"fa-user-ninja" : @"\uf504",
             @"fa-user-plus" : @"\uf234",
             @"fa-user-secret" : @"\uf21b",
             @"fa-user-shield" : @"\uf505",
             @"fa-user-slash" : @"\uf506",
             @"fa-user-tag" : @"\uf507",
             @"fa-user-tie" : @"\uf508",
             @"fa-user-times" : @"\uf235",
             @"fa-users" : @"\uf0c0",
             @"fa-users-class" : @"\uf63d",
             @"fa-users-cog" : @"\uf509",
             @"fa-users-crown" : @"\uf6a5",
             @"fa-ussunnah" : @"\uf407",
             @"fa-utensil-fork" : @"\uf2e3",
             @"fa-utensil-knife" : @"\uf2e4",
             @"fa-utensil-spoon" : @"\uf2e5",
             @"fa-utensils" : @"\uf2e7",
             @"fa-utensils-alt" : @"\uf2e6",
             @"fa-vaadin" : @"\uf408",
             @"fa-value-absolute" : @"\uf6a6",
             @"fa-vector-square" : @"\uf5cb",
             @"fa-venus" : @"\uf221",
             @"fa-venus-double" : @"\uf226",
             @"fa-venus-mars" : @"\uf228",
             @"fa-viacoin" : @"\uf237",
             @"fa-viadeo" : @"\uf2a9",
             @"fa-viadeo-square" : @"\uf2aa",
             @"fa-vial" : @"\uf492",
             @"fa-vials" : @"\uf493",
             @"fa-viber" : @"\uf409",
             @"fa-video" : @"\uf03d",
             @"fa-video-plus" : @"\uf4e1",
             @"fa-video-slash" : @"\uf4e2",
             @"fa-vihara" : @"\uf6a7",
             @"fa-vimeo" : @"\uf40a",
             @"fa-vimeo-square" : @"\uf194",
             @"fa-vimeo-v" : @"\uf27d",
             @"fa-vine" : @"\uf1ca",
             @"fa-vk" : @"\uf189",
             @"fa-vnv" : @"\uf40b",
             @"fa-volcano" : @"\uf770",
             @"fa-volleyball-ball" : @"\uf45f",
             @"fa-volume" : @"\uf6a8",
             @"fa-volume-down" : @"\uf027",
             @"fa-volume-mute" : @"\uf6a9",
             @"fa-volume-off" : @"\uf026",
             @"fa-volume-slash" : @"\uf2e2",
             @"fa-volume-up" : @"\uf028",
             @"fa-vote-nay" : @"\uf771",
             @"fa-vote-yea" : @"\uf772",
             @"fa-vr-cardboard" : @"\uf729",
             @"fa-vuejs" : @"\uf41f",
             @"fa-walking" : @"\uf554",
             @"fa-wallet" : @"\uf555",
             @"fa-wand" : @"\uf72a",
             @"fa-wand-magic" : @"\uf72b",
             @"fa-warehouse" : @"\uf494",
             @"fa-warehouse-alt" : @"\uf495",
             @"fa-watch" : @"\uf2e1",
             @"fa-watch-fitness" : @"\uf63e",
             @"fa-water" : @"\uf773",
             @"fa-water-lower" : @"\uf774",
             @"fa-water-rise" : @"\uf775",
             @"fa-weebly" : @"\uf5cc",
             @"fa-weibo" : @"\uf18a",
             @"fa-weight" : @"\uf496",
             @"fa-weight-hanging" : @"\uf5cd",
             @"fa-weixin" : @"\uf1d7",
             @"fa-whale" : @"\uf72c",
             @"fa-whatsapp" : @"\uf232",
             @"fa-whatsapp-square" : @"\uf40c",
             @"fa-wheat" : @"\uf72d",
             @"fa-wheelchair" : @"\uf193",
             @"fa-whistle" : @"\uf460",
             @"fa-whmcs" : @"\uf40d",
             @"fa-wifi" : @"\uf1eb",
             @"fa-wifi-1" : @"\uf6aa",
             @"fa-wifi-2" : @"\uf6ab",
             @"fa-wifi-slash" : @"\uf6ac",
             @"fa-wikipedia-w" : @"\uf266",
             @"fa-wind" : @"\uf72e",
             @"fa-wind-warning" : @"\uf776",
             @"fa-window" : @"\uf40e",
             @"fa-window-alt" : @"\uf40f",
             @"fa-window-close" : @"\uf410",
             @"fa-window-maximize" : @"\uf2d0",
             @"fa-window-minimize" : @"\uf2d1",
             @"fa-window-restore" : @"\uf2d2",
             @"fa-windows" : @"\uf17a",
             @"fa-windsock" : @"\uf777",
             @"fa-wine-bottle" : @"\uf72f",
             @"fa-wine-glass" : @"\uf4e3",
             @"fa-wine-glass-alt" : @"\uf5ce",
             @"fa-wix" : @"\uf5cf",
             @"fa-wizards-of-the-coast" : @"\uf730",
             @"fa-wolf-pack-battalion" : @"\uf514",
             @"fa-won-sign" : @"\uf159",
             @"fa-wordpress" : @"\uf19a",
             @"fa-wordpress-simple" : @"\uf411",
             @"fa-wpbeginner" : @"\uf297",
             @"fa-wpexplorer" : @"\uf2de",
             @"fa-wpforms" : @"\uf298",
             @"fa-wpressr" : @"\uf3e4",
             @"fa-wrench" : @"\uf0ad",
             @"fa-x-ray" : @"\uf497",
             @"fa-xbox" : @"\uf412",
             @"fa-xing" : @"\uf168",
             @"fa-xing-square" : @"\uf169",
             @"fa-y-combinator" : @"\uf23b",
             @"fa-yahoo" : @"\uf19e",
             @"fa-yandex" : @"\uf413",
             @"fa-yandex-international" : @"\uf414",
             @"fa-yelp" : @"\uf1e9",
             @"fa-yen-sign" : @"\uf157",
             @"fa-yin-yang" : @"\uf6ad",
             @"fa-yoast" : @"\uf2b1",
             @"fa-youtube" : @"\uf167",
             @"fa-youtube-square" : @"\uf431",
             @"fa-zhihu" : @"\uf63f"
             };
}

@end
