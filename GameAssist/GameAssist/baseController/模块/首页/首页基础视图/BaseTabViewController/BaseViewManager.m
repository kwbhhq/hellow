//
//  BaseViewManager.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import "BaseViewManager.h"
#import "SwordAndHomeModel.h"
#import "ComingSoonDataModel.h"
#import <malloc/malloc.h>
#import <objc/runtime.h>

@interface BaseViewManager()

@property(nonatomic,strong)NSArray<HomeBaseViewSectionModel *> *dataModelArray;

@end

@implementation BaseViewManager

- (void)configData {
    HomeBaseViewSectionModel *homeSectionModel = [[HomeBaseViewSectionModel alloc] init];
    SwordAndHomeModel *gameJYJYModel = [[SwordAndHomeModel alloc] init];
    ComingSoonDataModel *willComModel = [[ComingSoonDataModel alloc] init];
    homeSectionModel.gameArray = @[gameJYJYModel,willComModel];
    homeSectionModel.sectionName = @"经营策略类";
    self.dataModelArray = @[homeSectionModel];
    [self test];
}

-(void)test {
//    testma *test = [[testma alloc] init];
//    BOOL ism1 = class_isMetaClass([testma class]);
//    BOOL ism2 = class_isMetaClass(object_getClass([testma class]));
//    objc_getMetaClass(test);
//    const char *a = "a";
//    [objc_getMetaClass("testma") isMemberOfClass:object_getClass([testma class])];
//    Class cls = [testma class];
//    Class cls2 = objc_getMetaClass("testma");
//    BOOL isMetaClass = [cls isKindOfClass:objc_getMetaClass("NSObject")];
//    BOOL isMetaClass2 = [cls2 isKindOfClass:objc_getMetaClass("NSObject")];
//    [object_getClass([testma class]) isKindOfClass:objc_getMetaClass("NSObject")]
//    Class test1 = objc_getMetaClass("testma");
//    Class test2 = object_getClass([testma class]);
//    if(isMetaClass) {
//        NSLog(@"");
//    }
//    NSString *aaa = @"转 哈哈转。转";
//    NSRange bbb = [aaa rangeOfString:@"转" options:NSBackwardsSearch];
//    testma *aa = [[testma alloc] init];
//    id test = objc_getMetaClass(aa);
//    NSString *testttt = nil;
//    if([@"" containsString:testttt]) {
//        NSLog(@"%@",@"aa");
//    }
//    if(isMetaClass2) {
//        NSLog(@"%@",@(bbb.location));
//    }
//    ((__bridge const void *) a);
}

@end
