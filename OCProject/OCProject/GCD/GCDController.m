//
//  GCDController.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/5.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "GCDController.h"

@interface GCDController ()
@end

@implementation GCDController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//https://blog.ibireme.com/
//SerialDispatchQueueTest-等待结果按照顺序执行
- (IBAction)serialDispatchQueueTest:(id)sender{
    //创建一个SerialDispatchQueue，主要是用于防止资源的竞争，一个线程处使用完资源，然后另外一个才能继续使用
    dispatch_queue_t mySerialDispatchQueue =  dispatch_queue_create("com.example.gcd,serialDiapatchQueue", NULL);
    dispatch_async(mySerialDispatchQueue, ^{
        sleep(10);
        NSLog(@"mySerialDispatchQueue1-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue, ^{
        sleep(8);
        NSLog(@"mySerialDispatchQueue2-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue, ^{
        sleep(6);
        NSLog(@"mySerialDispatchQueue3-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue, ^{
        sleep(4);
        NSLog(@"mySerialDispatchQueue4-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue, ^{
        sleep(2);
        NSLog(@"mySerialDispatchQueue5-执行完毕");
    });
    //输出的结果
    /*
     2018-09-05 10:51:48.734387+0800 OCProject[89452:4426497] mySerialDispatchQueue1-执行完毕
     2018-09-05 10:51:56.738496+0800 OCProject[89452:4426497] mySerialDispatchQueue2-执行完毕
     2018-09-05 10:52:02.740314+0800 OCProject[89452:4426497] mySerialDispatchQueue3-执行完毕
     2018-09-05 10:52:06.744937+0800 OCProject[89452:4426497] mySerialDispatchQueue4-执行完毕
     2018-09-05 10:52:08.750614+0800 OCProject[89452:4426497] mySerialDispatchQueue5-执行完毕
     */
    //可以看出，创建1个SerialDispatchQueue，添加不同的任务，按照顺序执行。
}
//SerialDispatchQueueTest-不用等待结果，并发执行
- (IBAction)serialDispatchQueueTest2:(id)sender{
    //创建多个SerialDispatchQueue
    dispatch_queue_t mySerialDispatchQueue1 =  dispatch_queue_create("com.example.gcd,serialDiapatchQueue2", NULL);
    dispatch_queue_t mySerialDispatchQueue2 =  dispatch_queue_create("com.example.gcd,serialDiapatchQueue3", NULL);
    dispatch_queue_t mySerialDispatchQueue3 =  dispatch_queue_create("com.example.gcd,serialDiapatchQueue4", NULL);
    dispatch_queue_t mySerialDispatchQueue4 =  dispatch_queue_create("com.example.gcd,serialDiapatchQueue5", NULL);
    dispatch_queue_t mySerialDispatchQueue5 =  dispatch_queue_create("com.example.gcd,serialDiapatchQueue6", NULL);

    dispatch_async(mySerialDispatchQueue1, ^{
        sleep(10);
        NSLog(@"mySerialDispatchQueue1-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue2, ^{
        sleep(8);
        NSLog(@"mySerialDispatchQueue2-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue3, ^{
        sleep(6);
        NSLog(@"mySerialDispatchQueue3-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue4, ^{
        sleep(4);
        NSLog(@"mySerialDispatchQueue4-执行完毕");
    });
    dispatch_async(mySerialDispatchQueue5, ^{
        sleep(2);
        NSLog(@"mySerialDispatchQueue5-执行完毕");
    });
    //输出的结果
    /*
     2018-09-05 10:50:33.727306+0800 OCProject[89411:4425494] mySerialDispatchQueue5-执行完毕
     2018-09-05 10:50:35.727295+0800 OCProject[89411:4425364] mySerialDispatchQueue4-执行完毕
     2018-09-05 10:50:37.726063+0800 OCProject[89411:4425373] mySerialDispatchQueue3-执行完毕
     2018-09-05 10:50:39.725696+0800 OCProject[89411:4425371] mySerialDispatchQueue2-执行完毕
     2018-09-05 10:50:41.727550+0800 OCProject[89411:4425365] mySerialDispatchQueue1-执行完毕
     */
    //可以看出，创建个多个SerialDispatchQueue，可以并发的执行，谁的休眠时间短谁先执行完毕。
}

//自己创建Concurrent Dispatch Queue:不等待现在执行中处理结束
- (IBAction)concurrentDispatchQueueTest:(id)sender{
    dispatch_queue_t myConsurrentDiapatchQueue = dispatch_queue_create("com.example.gcd,serialDiapatchQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(myConsurrentDiapatchQueue, ^{
        sleep(4);
        NSLog(@"myConsurrentDiapatchQueue-执行完毕");
        dispatch_async([self mainQueue], ^{
            NSLog(@"回到主线程===1");
        });
    });
    dispatch_async(myConsurrentDiapatchQueue, ^{
        sleep(2);
        NSLog(@"myConsurrentDiapatchQueue-执行完毕");
        dispatch_async([self mainQueue], ^{
            NSLog(@"回到主线程===2");
        });
    });
}
//直接获取使用Concurrent Dispatch Queue
- (IBAction)concurrentDispatchQueueTest2:(id)sender{
    dispatch_async([self gloableQueue], ^{
        sleep(5);
        NSLog(@"获取gloable1，并发执行==");
        dispatch_async([self mainQueue], ^{
            NSLog(@"回到主线程===1");
        });
    });
    
    dispatch_async([self gloableQueue], ^{
        sleep(3);
        NSLog(@"获取gloable2，并发执行==");
        dispatch_async([self mainQueue], ^{
            NSLog(@"回到主线程===2");
        });
    });
    
}
/*
 *获取mian dispatch queue
 *dispatch_get_main_queue() 是在主线程执行的 Serial Diapatch Queue,主线程只有一个，所以 Main dispatch Queue 是 Serial Diapatch Queue
 */
- (dispatch_queue_t)mainQueue{
    return dispatch_get_main_queue();
}
/*获取 global dispatch queue
 *dispatch_get_global_queue 是所有应用程序都能使用的Concurrent Queue，没必要自己生成只需要获取就可以使用。
 */
- (dispatch_queue_t)gloableQueue{
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//dispatchGroup
//实际的情况可能是多个线程都在并发处理，但是希望这些并发都结束后有一个具体的操作
- (IBAction)dispatchGroupTest:(id)sender{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, [self gloableQueue], ^{
        sleep(6);
        NSLog(@"block-1");
    });
    dispatch_group_async(group, [self gloableQueue], ^{
        sleep(4);
        NSLog(@"block-2");
    });
    dispatch_group_async(group, [self gloableQueue], ^{
        sleep(5);
        NSLog(@"block-3");
    });
    
    dispatch_group_notify(group, [self mainQueue], ^{
        NSLog(@"全部任务结束后，回到主线程--");
    });
    //或者也可以使用 dispatch_group_wait,推荐使用dispatch_group_notify
//    long result =  dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    if (result == 0) {
//        NSLog(@"全部任务结束后，回到主线程--2");
//    }else{
//        NSLog(@"全部任务结束后，回到主线程--3");
//    }
    //打印结果
    /*
    2018-09-05 14:33:41.861183+0800 OCProject[92527:4569666] block-2
    2018-09-05 14:33:42.860655+0800 OCProject[92527:4569662] block-3
    2018-09-05 14:33:43.858538+0800 OCProject[92527:4569684] block-1
    2018-09-05 14:33:43.858840+0800 OCProject[92527:4569602] 全部任务结束后，回到主线程--
    */
}
//写入的操作时，会等待其他进行中的线程结束后才开始，然后自身结束后，恢复进程的管理，开始后面的进程。
//原始状态--dispatch_barrier_sync-原始状态
- (IBAction)dispatch_barrier_async:(id)sender{
    dispatch_async([self gloableQueue], ^{
        sleep(2);
        NSLog(@"读取操作=1");
    });
    dispatch_async([self gloableQueue], ^{
        NSLog(@"读取操作=2");
    });
    dispatch_async([self gloableQueue], ^{
        NSLog(@"读取操作=3");
    });
    dispatch_async([self gloableQueue], ^{
        NSLog(@"读取操作=4");
    });
    dispatch_async([self gloableQueue], ^{
        NSLog(@"读取操作=5");
    });
    dispatch_barrier_sync([self gloableQueue], ^{
        sleep(5);
        NSLog(@"写入操作=========");
    });
    dispatch_async([self gloableQueue], ^{
        NSLog(@"读取操作=6");
    });
    dispatch_async([self gloableQueue], ^{
        sleep(3);
        NSLog(@"读取操作=7");
    });
    dispatch_async([self gloableQueue], ^{
        NSLog(@"读取操作=8");
    });
    dispatch_async([self gloableQueue], ^{
        NSLog(@"读取操作=9");
    });
}
- (IBAction)dispatch_apply:(id)sender {
    NSArray *arrry = @[@"lj",@"hj",@"sd",@"ew",@"cs",@"ad",@"asd",@"ee"];
    dispatch_apply(arrry.count, [self gloableQueue], ^(size_t index) {
        NSLog(@"index==%ld,content==%@",index,arrry[index]);
    });
    NSLog(@"done==");
    
    dispatch_async([self gloableQueue], ^{
        dispatch_apply([arrry count], [self gloableQueue], ^(size_t index) {
            NSLog(@"index2==%ld,content2==%@",index,arrry[index]);
        });
        dispatch_async([self mainQueue], ^{
            NSLog(@"done==2");
        });
    });
    
}
/*
 2018-09-05 16:03:06.583186+0800 OCProject[93730:4631487] index==2,content==sd
 2018-09-05 16:03:06.583178+0800 OCProject[93730:4631316] index==1,content==hj
 2018-09-05 16:03:06.583175+0800 OCProject[93730:4631252] index==0,content==lj
 2018-09-05 16:03:06.583224+0800 OCProject[93730:4631486] index==3,content==ew
 2018-09-05 16:03:06.583376+0800 OCProject[93730:4631487] index==4,content==cs
 2018-09-05 16:03:06.583377+0800 OCProject[93730:4631316] index==6,content==asd
 2018-09-05 16:03:06.583377+0800 OCProject[93730:4631252] index==5,content==ad
 2018-09-05 16:03:06.583468+0800 OCProject[93730:4631486] index==7,content==ee
 2018-09-05 16:03:06.583752+0800 OCProject[93730:4631252] done==
 */
//done==肯定是最后输出

- (IBAction)dispatchSemaphore:(id)sender{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    for (NSInteger i =0; i < 100000; i ++ ) {
        dispatch_async([self gloableQueue], ^{
            //检测到信号不为0则可以继续执行，然后信号量-1
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//信号-1
            [array addObject:[NSNumber numberWithLong:i]];
            //执行完操作后，信号+1，然后继续循环执行
            dispatch_semaphore_signal(semaphore);//信号+1
        });
    }
}
//创建了两个任务信号，多余的任务需要等待信号释放才能执行
- (IBAction)dispatchSemaphore2:(id)sender{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);
    dispatch_async([self gloableQueue], ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"task-1");
        sleep(2);
        NSLog(@"task-1-finish");
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_async([self gloableQueue], ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"task-2");
        sleep(2);
        NSLog(@"task-2-finish");
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_async([self gloableQueue], ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"task-3");
        sleep(2);
        NSLog(@"task-3-finish");
        dispatch_semaphore_signal(semaphore);
    });
}
/*
 2018-09-05 18:47:41.270014+0800 OCProject[1148:4748195] task-1
 2018-09-05 18:47:41.270089+0800 OCProject[1148:4748209] task-3
 2018-09-05 18:47:43.273053+0800 OCProject[1148:4748209] task-3-finish
 2018-09-05 18:47:43.273053+0800 OCProject[1148:4748195] task-1-finish
 2018-09-05 18:47:43.273330+0800 OCProject[1148:4748510] task-2
 2018-09-05 18:47:45.278272+0800 OCProject[1148:4748510] task-2-finish

 */
@end
