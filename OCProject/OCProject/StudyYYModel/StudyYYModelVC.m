//
//  StudyYYModelVC.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/10/16.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "StudyYYModelVC.h"
#import "YYKit.h"
#import "CustomModel.h"
#import "RuntimeClass.h"
@interface StudyYYModelVC ()

@end

@implementation StudyYYModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CustomModel *model = [[CustomModel alloc] init];
    model.name= @"张三";
    model.age = @"30";
    model.address = @"深圳南山";

    NSDictionary *modelDic = @{@"name":@"张三",@"age":@"20",@"address":@"深圳南山"};

    CustomModel *jsonModel = [CustomModel modelWithJSON:modelDic];
//
//
//
//    [self ex_registerClassPair];
    
//    [self testRuntimekk2];
//    [self jsdjksjdks];
//    [self testRuntimekk3];
}
- (void)testRuntimekk3{
    id theObject = class_createInstance(NSString.class, sizeof(unsigned));
    id str1 = [theObject init];
    
    NSLog(@"%@", [str1 class]);
    
    id str2 = [[NSString alloc] initWithString:@"test"];
    NSLog(@"%@", [str2 class]);
}
- (void)testRuntimekk2{
    RuntimeClass *myClass = [[RuntimeClass alloc] init];
    
    Class cls = object_getClass(myClass);
    Class metaCls1 = object_getClass(cls);
    Class metaCls2 = object_getClass(metaCls1);
    Class metaCls3 = object_getClass(metaCls2);
    Class metaCls4 = object_getClass(metaCls3);
    Class metaCls5 = object_getClass(metaCls4);
    Class metaCls6 = object_getClass(metaCls5);
    
    
    
    Class supercls = class_getSuperclass(cls);
    Class supermetaCls1 = class_getSuperclass(supercls);
    Class supermetaCls2 = class_getSuperclass(supermetaCls1);
    Class supermetaCls3 = class_getSuperclass(supermetaCls2);
    Class supermetaCls4 = class_getSuperclass(supermetaCls3);
    Class supermetaCls5 = class_getSuperclass(supermetaCls4);
    Class supermetaCls6 = class_getSuperclass(supermetaCls5);
}
- (void)testRuntimekk{
    RuntimeClass *myClass = [[RuntimeClass alloc] init];
    unsigned int outCount = 0;
    
    Class cls = RuntimeClass.class;
    
    // 类名
    NSLog(@"class name: %s", class_getName(cls));
    
    NSLog(@"==========================================================");
    
    // 父类
    NSLog(@"super class name: %s", class_getName(class_getSuperclass(cls)));
    NSLog(@"==========================================================");
    
    // 是否是元类
    NSLog(@"MyClass is %@ a meta-class", (class_isMetaClass(cls) ? @"" : @"not"));
    NSLog(@"==========================================================");
    
    Class meta_class = objc_getMetaClass(class_getName(cls));
    NSLog(@"%s's meta-class is %s", class_getName(cls), class_getName(meta_class));
    NSLog(@"==========================================================");
    
    // 变量实例大小
    NSLog(@"instance size: %zu", class_getInstanceSize(cls));
    NSLog(@"==========================================================");
    
    // 成员变量
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"instance variable's name: %s at index: %d", ivar_getName(ivar), i);
    }
    
    free(ivars);
    
    Ivar string = class_getInstanceVariable(cls, "_string");
    if (string != NULL) {
        NSLog(@"instace variable %s", ivar_getName(string));
    }
    
    NSLog(@"==========================================================");
    
    // 属性操作
    objc_property_t * properties = class_copyPropertyList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSLog(@"property's name: %s", property_getName(property));
    }
    
    free(properties);
    
    objc_property_t array = class_getProperty(cls, "array");
    if (array != NULL) {
        NSLog(@"property %s", property_getName(array));
    }
    
    NSLog(@"==========================================================");
    
    // 方法操作
    Method *methods = class_copyMethodList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        NSLog(@"method's signature: %s", method_getName(method));
    }
    
    free(methods);
    
    Method method1 = class_getInstanceMethod(cls, @selector(method1));
    if (method1 != NULL) {
        NSLog(@"method %s", method_getName(method1));
    }
    
    Method classMethod = class_getClassMethod(cls, @selector(classMethod1));
    if (classMethod != NULL) {
        NSLog(@"class method : %s", method_getName(classMethod));
    }
    
    NSLog(@"MyClass is%@ responsd to selector: method3WithArg1:arg2:", class_respondsToSelector(cls, @selector(method3WithArg1:arg2:)) ? @"" : @" not");
    
    IMP imp = class_getMethodImplementation(cls, @selector(method1));
    imp();
    
    NSLog(@"==========================================================");
    
    // 协议
    Protocol * __unsafe_unretained * protocols = class_copyProtocolList(cls, &outCount);
    Protocol * protocol;
    for (int i = 0; i < outCount; i++) {
        protocol = protocols[i];
        NSLog(@"protocol name: %s", protocol_getName(protocol));
    }
    
    NSLog(@"MyClass is%@ responsed to protocol %s", class_conformsToProtocol(cls, protocol) ? @"" : @" not", protocol_getName(protocol));
    
    
    
}
void TestMetaClass(id self, SEL _cmd) {
    
    NSLog(@"This objcet is %p", self);
    NSLog(@"Class is %@, super class is %@", [self class], [self superclass]);
    
    Class currentClass = [self class];
    for (int i = 0; i < 4; i++) {
        NSLog(@"Following the isa pointer %d times gives %p", i, currentClass);
        currentClass = objc_getClass((__bridge void *)currentClass);
    }
    
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p", objc_getClass((__bridge void *)[NSObject class]));
}
- (void)ex_registerClassPair {
    
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)TestMetaClass, "v@:");
    objc_registerClassPair(newClass);
    
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
}

- (void)jsdjksjdks{
    Class cls=objc_allocateClassPair(RuntimeClass.class,"MySubClass",0);
    class_addMethod(cls,@selector(submethod22),(IMP)imp_submethod1,"v@:");
    class_replaceMethod(cls,@selector(submethod22),(IMP)imp_submethod22222,"v@:");
    class_addIvar(cls,"_ivar1",sizeof(NSString *),log(sizeof(NSString *)),"i");
     
    objc_property_attribute_t type = {"T", "@\"NSString\""};
    objc_property_attribute_t ownership = { "C", "" };
    objc_property_attribute_t backingivar = { "V", "_ivar1"};
    objc_property_attribute_t attrs[] = {type, ownership, backingivar};
     
    class_addProperty(cls, "property2", attrs, 3);
    objc_registerClassPair(cls);
     
    id instance = [[cls alloc] init];
    [instance performSelector:@selector(submethod22)];
    [instance performSelector:@selector(method1)];
}

void imp_submethod1(){
    NSLog(@"sdsajkdfk");

}

void imp_submethod22222(){
    NSLog(@"imp_submethod22222");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
