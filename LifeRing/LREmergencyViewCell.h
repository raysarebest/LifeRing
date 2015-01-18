//
//  LREmergencyViewCell.h
//  LifeRing
//
//  Created by Michael Hulet on 1/18/15.
//  Copyright (c) 2015 LifeBoat. All rights reserved.
//
@import UIKit;

@interface LREmergencyViewCell : UITableViewCell
typedef NS_ENUM(uint32_t, LREmergencyViewCellType){
    LREmergencyViewCellTypeEpiPen,
    LREmergencyViewCellTypeInsulin,
    LREmergencyViewCellTypeAlbuterolInhaler,
    LREmergencyViewCellTypeBambuterolInhaler,
    LREmergencyViewCellTypeFenoterolInhaler,
    LREmergencyViewCellTypeIsoetherineInhaler,
    LREmergencyViewCellTypeIsoproterenolInhaler,
    LREmergencyViewCellTypeLevalbuterolInhaler,
    LREmergencyViewCellTypeMetaproterenolInhaler,
    LREmergencyViewCellTypePirbuterolInhaler,
    LREmergencyViewCellTypeSalbuterolInhaler,
    LREmergencyViewCellTypeTerbutelineInhaler,
    LREmergencyViewCellTypeTornalateInhaler,
    LREmergencyViewCellTypeGeneral
};
@property (weak, nonatomic) IBOutlet UILabel *helpLabel;
@property (weak, nonatomic) IBOutlet UIImageView *deviceImageView;
+(instancetype)cellForCellType:(LREmergencyViewCellType)type;
-(void)sendDistressSignal;
@end