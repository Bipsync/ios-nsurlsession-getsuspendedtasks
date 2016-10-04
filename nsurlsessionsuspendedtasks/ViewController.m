//
//  ViewController.m
//  nsurlsessionsuspendedtasks
//
//  Created by Craig Marvelley on 04/10/2016.
//  Copyright © 2016 Bipsync Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSArray *urls = @[
                      @"http://www.inkwelleditorial.com/pdfSample.pdf",
                      @"http://www.pdf995.com/samples/pdf.pdf",
                      @"https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf"
                      ];
    
    for (NSString *urlString in urls) {
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url];
        
        /*
         Without further manipulation, task is in NSURLSessionTaskStateSuspended state, and will not be included in the parameters of the completion handlers below.
         
         If the following code is uncommented the task *will* be included, despite the state being effectively the same.
         */
//        [task resume];
//        [task suspend];
    }
    
    [session getAllTasksWithCompletionHandler:^(NSArray<__kindof NSURLSessionTask *> * _Nonnull tasks) {
        NSLog(@"%@", tasks);
    }];
    
    [session getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        NSLog(@"%@", downloadTasks);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
