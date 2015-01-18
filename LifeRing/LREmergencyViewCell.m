//
//  LREmergencyViewCell.m
//  LifeRing
//
//  Created by Michael Hulet on 1/18/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//

#import "LREmergencyViewCell.h"
#import "LRColorScheme.h"
@import Parse;
@interface LREmergencyViewCell()

@end
@implementation LREmergencyViewCell
#pragma mark - View Setup Code
-(instancetype)init{
    if(self = [super init]){
        UILongPressGestureRecognizer *hold = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(sendDistressSignal)];
        [self addGestureRecognizer:hold];
        [self.imageView addGestureRecognizer:hold];
        [self.helpLabel addGestureRecognizer:hold];
        return self;
    }
    else{
        return nil;
    }
}
+(instancetype)cellForCellType:(LREmergencyViewCellType)type{
    LREmergencyViewCell *cell = [[LREmergencyViewCell alloc] init];
    switch(type){
        case LREmergencyViewCellTypeEpiPen:
            cell.backgroundColor = [LRColorScheme epiPenComplement];
            cell.imageView.image = [UIImage imageNamed:@"epiPen"];
            break;
        case LREmergencyViewCellTypeInsulin:
            cell.backgroundColor = [LRColorScheme syringeComplement];
            cell.imageView.image = [UIImage imageNamed:@"syringe"];
            break;
        case LREmergencyViewCellTypeAlbuterolInhaler:
            cell.backgroundColor = [LRColorScheme red];
            cell.imageView.image = [UIImage imageNamed:@"inhalerA"];
            break;
        case LREmergencyViewCellTypeBambuterolInhaler:
            cell.backgroundColor = [LRColorScheme BInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerB"];
            break;
        case LREmergencyViewCellTypeFenoterolInhaler:
            cell.backgroundColor = [LRColorScheme FInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerF"];
            break;
        case LREmergencyViewCellTypeIsoproterenolInhaler:
            cell.backgroundColor = [LRColorScheme IPInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerIP"];
            break;
        case LREmergencyViewCellTypeIsoetherineInhaler:
            cell.backgroundColor = [LRColorScheme ISInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerIS"];
            break;
        case LREmergencyViewCellTypeLevalbuterolInhaler:
            cell.backgroundColor = [LRColorScheme LInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerL"];
            break;
        case LREmergencyViewCellTypeMetaproterenolInhaler:
            cell.backgroundColor = [LRColorScheme MInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerM"];
            break;
        case LREmergencyViewCellTypePirbuterolInhaler:
            cell.backgroundColor = [LRColorScheme PInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerP"];
            break;
        case LREmergencyViewCellTypeSalbuterolInhaler:
            cell.backgroundColor = [UIColor whiteColor];
            break;
        case LREmergencyViewCellTypeTerbutelineInhaler:
            cell.backgroundColor = [LRColorScheme TEInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerTE"];
            break;
        case LREmergencyViewCellTypeTornalateInhaler:
            cell.backgroundColor = [LRColorScheme TOInhalerComplement];
            cell.imageView.image = [UIImage imageNamed:@"inhalerTO"];
            break;
        case LREmergencyViewCellTypeGeneral:
            cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
            break;
        default:
            break;
    }
    return cell;
}
-(void)sendDistressSignal{
    PFPush *notification = [PFPush push];
    [notification setChannel:@"medical"];
    [notification setMessage:@"I need help!"];
    [notification sendPushInBackground];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://8566697531"]];
}
@end
