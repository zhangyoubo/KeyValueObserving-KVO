//
//  ViewController.m
//  KeyValueObserving-KVO
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 zf. All rights reserved.
//

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "Walker.h"

@class Walker;

@interface ViewController ()
{
    UIView *customView;
    NSMutableArray *array;
    Walker *walker;
    UILabel *ageLabel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *str=[[NSString alloc] init];
    str=@"zhangyoubo";
    
    NSString *str1=[str mutableCopy];
    
    NSLog(@"str=%p,str1=%p",str,str1);
    
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake((kWidth-150)/2, 60, 150, 40)];
    
    btn.backgroundColor=[UIColor blackColor];
    [btn setTitle:@"点击改变对象属性" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    customView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    customView.backgroundColor=[UIColor redColor];
    customView.center=self.view.center;
    [self.view addSubview:customView];
    
    // 监听customView属性的变化情况
    [customView addObserver:self forKeyPath:@"alpha" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    walker=[[Walker alloc] initWithName:@"boss" age:@"40"];
    
    [walker addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    ageLabel = [[UILabel alloc] initWithFrame:CGRectMake((kWidth-200)/2, 400, 200, 40)];
    ageLabel.text = [NSString stringWithFormat:@"%@现在的年龄是: %@", walker.name, walker.age];
    ageLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:ageLabel];
    
}

-(void)tapped:(UIButton *)sender
{
   customView.alpha=0.8;
   walker.age =@"50";
}

#pragma mark - 只要监听的item的属性一有新值，就会调用该方法重新给属性赋值
// change里存储了一些变化的数据，比如变化前的数据，变化后的数据
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
   
    if ([keyPath isEqualToString:@"alpha"] && object == customView) {
       customView.backgroundColor=[UIColor purpleColor];
    }
    
    if ([keyPath isEqualToString:@"age"] && object == walker) {
       ageLabel.text = [NSString stringWithFormat:@"%@现在的年龄是: %@", walker.name, walker.age];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
