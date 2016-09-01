//
//  PYLineDemoOptions.m
//  iOS-Echarts
//
//  Created by Pluto Y on 9/1/16.
//  Copyright © 2016 pluto-y. All rights reserved.
//

#import "PYLineDemoOptions.h"

@implementation PYLineDemoOptions

+ (PYOption *)standardLineOption {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"未来一周气温变化")
            .subtextEqual(@"纯属虚构");
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerAxis);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@50);
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.dataEqual(@[@"最高温度",@"最低温度"]);
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .xEqual(PYPositionRight)
            .yEqual(PYPositionTop)
            .zEqual(@100)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .boundaryGapEqual(@NO);
            axis.data = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
        }])
        .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeValue)
            .axisLabelEqual([PYAxisLabel initPYAxisLabelWithBlock:^(PYAxisLabel *axisLabel) {
                axisLabel.formatterEqual(@"{value} ℃");
            }]);
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"最高温度")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(11),@(11),@(15),@(13),@(12),@(13),@(10)])
            .markPointEqual([PYMarkPoint initPYMarkPointWithBlock:^(PYMarkPoint *point) {
                point.dataEqual(@[@{@"type" : @"max", @"name": @"最大值"},@{@"type" : @"min", @"name": @"最小值"}]);
            }])
            .markLineEqual([PYMarkLine initPYMarkLineWithBlock:^(PYMarkLine *markLine) {
                markLine.dataEqual(@[@{@"type" : @"average", @"name": @"平均值"}]);
            }]);
            
        }])
        .addSeries([PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"最低温度")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual(@[@(1),@(-2),@(2),@(5),@(3),@(2),@(0)])
            .markPointEqual([PYMarkPoint initPYMarkPointWithBlock:^(PYMarkPoint *point) {
                point.dataEqual(@[@{@"value" : @(2), @"name": @"周最低", @"xAxis":@(1), @"yAxis" : @(-1.5)}]);
            }])
            .markLineEqual([PYMarkLine initPYMarkLineWithBlock:^(PYMarkLine *markLine) {
                markLine.dataEqual(@[@{@"type" : @"average", @"name": @"平均值"}]);
            }]);
        }]);
    }];
}

+ (PYOption *)stackedLineOption {
    return nil;
}

+ (PYOption *)basicLinOption {
    return nil;
}

+ (PYOption *)basicAreaOption {
    return nil;
}

+ (PYOption *)stackedAreaOption {
    return nil;
}

+ (PYOption *)irregularLineOption {
    return nil;
}

+ (PYOption *)irregularLine2Option {
    return nil;
}

+ (PYOption *)lineOption {
    return nil;
}

+ (PYOption *)logarithmicOption {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        
        PYAxis *xAxis = [PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeCategory)
            .nameEqual(@"x")
            .splitLineEqual([PYAxisSplitLine initPYAxisSplitLineWithBlock:^(PYAxisSplitLine *axisSpliteLine) {
                axisSpliteLine.showEqual(NO);
            }]);
            axis.data = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九"];
        }];
        
        PYAxis *yAxis = [PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
            axis.typeEqual(PYAxisTypeLog).nameEqual(@"y");
        }];
        
        PYSeries *series1 = [PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"3的指数")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual([[NSMutableArray alloc] initWithArray:@[@(1),@(3),@(9),@(27),@(81),@(247),@(741),@(2223),@(6669)]]);
        }];
        
        PYSeries *series2 = [PYSeries initPYSeriesWithBlock:^(PYSeries *series) {
            series.nameEqual(@"2的指数")
            .typeEqual(PYSeriesTypeLine)
            .dataEqual([[NSMutableArray alloc] initWithArray:@[@(1),@(2),@(4),@(8),@(16),@(32),@(64),@(128),@(256)]]);
        }];
        
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"对数轴实例")
            .xEqual(PYPositionCenter);
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerItem)
            .formatterEqual(@"{a} <br/>{b} : {c}");
        }])
        .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
            legend.xEqual(PYPositionLeft)
            .dataEqual(@[@"2的指数", @"3的指数"]);
        }])
        .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
            grid.xEqual(@40).x2Equal(@50);
        }])
        .xAxisEqual([[NSMutableArray alloc] initWithArray:@[xAxis]])
        .yAxisEqual([[NSMutableArray alloc] initWithArray:@[yAxis]])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.showEqual(YES);
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(NO);
                }])
                .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
                    magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar, @"stack", @"tiled"]);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(YES)
        .seriesEqual([[NSMutableArray alloc] initWithArray:@[series1, series2]]);
    }];
}

@end