//
//  WisecanViewController.m
//  真机调试练习
//
//  Created by wisecan on 13-12-9.
//  Copyright (c) 2013年 wisecan. All rights reserved.
//

#import "WisecanViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AdSupport/AdSupport.h>
#import <NewsstandKit/NewsstandKit.h>
#import <AudioToolbox/AudioToolbox.h>
#pragma mark - 排序
NSInteger intSortUp(id num1 ,id num2, void *context){
    int v1 = [num1 intValue];
    int v2 = [num2 intValue];
    if (v1<v2) {
        return NSOrderedAscending;
    }else if (v2<v1) {
        return NSOrderedDescending;
    }else {
        return NSOrderedSame;
    }
    
}

NSInteger getMaxofThree(NSInteger num1, NSInteger num2, NSInteger num3){
    NSInteger num[3] = {num1,num2,num3};
    NSInteger max = num[0];
    for (int i=0; i<3; i++) {
        if (num[i] >= max) {
            max = num[i];
        }
    }
    
    return max;
}


@interface WisecanViewController () <UIAlertViewDelegate>
@property (nonatomic, strong) UIAlertView* alert;
@property (nonatomic, strong) UIWebView* webNotice;
@end

@implementation WisecanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
#if 0
    [self testFunc];

    for (UIButton* btn in self.blueBallBtns) {
        [btn setBackgroundImage:[UIImage imageNamed:@"lan_no"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"emoji_touch"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"lan_ok"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
    }
    
    //[self blueBallSelect];

    
    NSString* testStr = @"\ue415";
    NSLog(@"%@",testStr);

    [self test1];

    //创建一个字典
    NSDictionary* dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"我爱我家",@"title",@"家是一个温暖的港湾",@"content", nil];
    NSLog(@"字典为：%@",dict1);
    //字典转为json字符串
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict1 options:NSJSONWritingPrettyPrinted error:nil];
    NSString *serializInfo =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"json为:%@",serializInfo);

    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy年MM月DD日"];//设定时间格式,这里可以设置成自己需要的格式
    NSDate *  senddate=[NSDate date];
    NSLog(@"%@",[dateFormat stringFromDate:senddate]);

    NSLog(@"得到字符串yyyy-mm中的小写字母为 %@",[@"YYYY-mm" lowercaseString]);

    //self.myImageView.image = [self imagesNamed:@"test2014010701" FromCustomBundle:@"resource"];
    //self.myImageView.image = [self imagesNamedFromCustomBundle:@"test2014010701.png"];

    NSLog(@"%f",floor(2.0));

    if (1)
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:1];
        [dict setValue:nil forKey:@"title"];
        [dict setValue:@"nihao" forKey:@"msg"];
        [self performSelector:@selector(showServerAlertWithMessage:) withObject:dict afterDelay:2.0f];
        return;
    }
    
    //
    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:1];
    [dict setObject:@"ydm1" forKey:@"name"];
    [dict setObject:@"ydm2" forKey:@"name"];


    //将json串转化为字典
    NSString* jsonStr = @"{\"rlt\" : \"SUCC\",\"info\" : {\"description\" : \"\",\"failmsg\" :\"\",\"app\" : {\"appcode\" : \"com.kakao.talk\",\"appname\" : \"kakaotalk\",\"apptitle\" : \"KakaoTalk\",\"related_adidx\" : \"78\",\"appurl\" : \"https://itunes.apple.com/us/app/id362057947\"},\"is_to_game\" : \"1\",\"adtitle\" : \"语言就是力量-新东方\",\"ad_urls\" : [\"http://oss.aliyuncs.com/qpaile/ad/20141201400272370.jpg\",\"http://oss.aliyuncs.com/qpaile/ad/20141201400278350.png\",\"http://oss.aliyuncs.com/qpaile/ad/20141201400278903.jpg\"],\"is_read\" : \"1\",\"question\" : {\"title\" : \"广告中的英语培训机构是\",\"type\" : \"1\",\"correct\" : \"139\",\"optional\" : \"0\",\"question_idx\" : \"35\",\"answer\" : {\"138\" : \"英孚教育\",\"140\" : \"ABC英语\",\"139\" : \"新东方英语\",\"137\" : \"百特英语\"}}}}";//json串
    NSData *data = [jsonStr dataUsingEncoding: NSUTF8StringEncoding];//json按指定编码转化为NSData
    NSDictionary *responseDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];//json解析，NSData转化为字典
    NSLog(@"%@",responseDic);

    NSMutableDictionary* modifiedDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [modifiedDic setValue:@"FAIL" forKey:@"rlt"];
    NSLog(@"%@",modifiedDic);


    //测试字数多时的警告框
    UIAlertView* alert  = [[UIAlertView alloc] initWithTitle:@"提示" message:@" 新华网北京1月23日电（记者霍小光）在春节即将到来之际，中共中央总书记、国家主席、中央军委主席习近平22日下午在人民大会堂同各民主党派中央、全国工商联负责人和无党派人士代表欢聚一堂，共迎新春。他代表中共中央，向各民主党派、工商联和无党派人士，向统一战线广大成员，致以诚挚的问候和新春的祝福。中共中央政治局常委、全国政协主席俞正声，中共中央政治局常委、国务院副总理张高丽出席。民革中央主席万鄂湘、民盟中央主席张宝文、民建中央主席陈昌智、民进中央主席严隽琪、农工党中央主席陈竺、致公党中央主席万钢、九三学社中央主席韩启德、台盟中央主席林文漪、全国工商联主席王钦敏和无党派人士代表林毅夫、邓中翰等应邀出席。陈竺代表各民主党派中央、全国工商联和无党派人士致辞。他指出，2013年，以习近平同志为总书记的中共中央带领全国人民团结奋斗，谋局开篇大略已定，首战奏捷大势已成。中共十八届三中全会对全面深化改革作出了总体部署，作为中国特色社会主义参政党，我们一定要与中国共产党风雨同舟、肝胆相照，做挚友、做诤友，讲真话、建诤言，加强自身建设，旗帜鲜明支持改革，既要献良策，也要出大力，彰显中国共产党领导的多党合作和政治协商制度的旺盛活力。他还就加强党外人士民主监督工作等提出意见和建议。" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];

    NSLog(@"转换前:7654000; 转换后:%@",[self strNumberToCurrency]);
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    //webView.scrollView.bounces = NO;
    webView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"WebViewBg.png"]];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    //加载本地网页资源
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"你好" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:nil];//写NSUTF16StringEncoding也行，因为 NSUTF16StringEncoding = NSUnicodeStringEncoding
    NSLog(@"%@",[NSURL fileURLWithPath:filePath]);
    [webView loadHTMLString:htmlString baseURL:nil];
    [self.view addSubview:webView];

    NSString* nihao = @"你好";
    NSAssert([nihao isEqualToString:@"你好1"], @"Method setupStream invoked multiple times");

    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:1];
    [dict setObject:@"ydm1" forKey:@"name"];
    [dict setObject:@"ydm2" forKey:@"name"];
    NSLog(@"----%ld",(long)[[dict objectForKey:@"jkk"] integerValue]);

    NSMutableArray * arr1 = [NSMutableArray arrayWithArray:nil];

    [arr1 addObject:@"你好"];
    NSLog(@"arr1=%@",arr1);

    NSLog(@"%f",[@"7.1.4" floatValue]);
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"obj1",@"key1",nil,@"key2", @"obj3",@"key3",@"obj4",@"key4",nil];
    NSLog(@"count = %ld, %@",[dict count],dict);

    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"obj1",@"key1",@"obj2",@"key2", @"obj3",@"key3",@"obj4",@"key4",nil];
    if (![dict objectForKey:@"key0"]) {
        NSLog(@"key0对应的值没有");
    }

    NSString* str = @"123";
    NSLog(@"%@", [str substringToIndex:4]);
#endif
}

-(void) viewDidAppear:(BOOL)animated
{
    if(!self.textField.text)
    {
        NSLog(@"----textField的文本为nil");
    }
        
}


//@“1234567”------>@"1,234,567"   将数字字符串转换为货币的形式，3位逗号分隔。
-(NSString*)strNumberToCurrencyWithStr:(NSString*)fromStr
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *num = [NSNumber numberWithInteger:[fromStr intValue]];
    return [numFormat stringFromNumber:num];
}
#pragma mark - UIUIWebViewDelegate
-(void) webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"------网页加载开始------");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"------网页加载完成------");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webView:didFailLoadWithError:");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    //3秒后刷新网页
    [self performSelector:@selector(reloadWebView:) withObject:webView afterDelay:3.0f];
}
-(void) reloadWebView:(UIWebView*)webView
{
    [webView reload];
}

//当备用服务器返回成功，且内容不为空时，弹出该警告框
-(void)showServerAlertWithMessage:(NSDictionary*)showDict
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:[showDict objectForKey:@"title"] message:[showDict objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
}

//得到某个bundle包中的某个图片
- (UIImage *)imagesNamed:(NSString*)imgName FromCustomBundle:(NSString *)bundleName
{
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",bundleName]];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *img_path = [bundle pathForResource:imgName ofType:@"png"];
    return [UIImage imageWithContentsOfFile:img_path];
}


- (UIImage *)imagesNamedFromCustomBundle:(NSString *)imgName
{
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"resource.bundle"];
    NSString *img_path = [bundlePath stringByAppendingPathComponent:imgName];
    return [UIImage imageWithContentsOfFile:img_path];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 测试
-(void) testFunc
{
    //数组的另一种初始化方法
    NSArray* myArr = @[@"one",@"two",@"three"];
    for (id ele in myArr)
    {
        NSLog(@"%@",ele);
    }
    
    //字典的另一种初始化方法
    NSDictionary* myDict = @{@"1": @"本科",@"2":@"大专",@"3":@"高中"};
    NSLog(@"%@",myDict);
}

-(void) test1
{
    LOG(@"%f",12.8);
}

-(void) blueBallSelect
{
    //用for循环打印测试一下blueBallBtns数组中每个元素（按钮）的title
    for (id ele in self.blueBallBtns)
    {
        NSLog(@"%@",[ele titleForState:UIControlStateNormal]);
    }
    
    int blue6Balls[6] = {2,4,7,10,13,15};//假设blue6Balls[]数组的6个元素为选中的6个球
    
    //使选中的6个球变蓝
    for (int i=0; i<6; i++)
    {
        UIButton* selectBtn = [_blueBallBtns objectAtIndex:(blue6Balls[i]-1)];
        //使选中的球变蓝，球上的号码为白色
        [selectBtn setBackgroundImage:[UIImage imageNamed:@"lan_ok"] forState:UIControlStateNormal];
        [selectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}
- (IBAction)downloadImg:(id)sender
{

    NSLog(@"------------");
#if 0
    UIButton* btn = sender;

    NSData * imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://oss.aliyuncs.com/qpaile/ad/201311151428307634.jpg"]];
    if (imageData)
    {
        UIImage* image = [[UIImage alloc] initWithData:imageData];
        self.myImageView.image = image;
    }
    else
    {
        NSLog(@"为空");
    }
    abort();

    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    self.alert = [[UIAlertView alloc] init];
    _alert.title = @"wait···";
    [_alert show];
    [self performSelector:@selector(hiddenAlert) withObject:nil afterDelay:3.0f];

    NSMutableString* str = [NSMutableString stringWithFormat:@"nihao"];
    [str setString:@"1"];
    NSLog(@"%@",str);
    
    int i = 0;
    
    list:{
        NSLog(@"nihaoma");
        i++;
    }
    
    if (i<5) {
        goto list;
    }
    else
    {
        NSLog(@"结束了");
    }
  

    NSString* str = @"0";
    NSLog(@"%d",[str boolValue]);
    
    NSNumber* number = [NSNumber numberWithInt:3];
    NSLog(@"%d",[number boolValue]);


    
    NSLog(@"%@",[NSString stringWithUTF8String:"\101"]);

    
    self.testLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
    self.testLabel.shadowOffset = CGSizeMake(0.0, 1.0f);
    
    btn.titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
    btn.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0f);
    NSString* str = @"edfdf124d";
    NSLog(@"%@",[str uppercaseString]);

    
    NSArray* arr = [NSArray arrayWithObjects:@"yangOne",@"DongTwo",@"MingThree", nil];
    NSLog(@"arr[%p]",arr);
    [arr objectAtIndex:3];

    
    NSLog(@"%d, %d, %d, %d", 1 << 0, 1 << 1, 1 << 2, 1 << 3);

    
    //NSURL* url = [[NSURL alloc] initWithString:nil];
    NSURLRequest* req = [[NSURLRequest alloc] initWithURL:nil];

    NSString* recomCode = @"11252076";
    NSString* recomStr = @"向你推荐Q拍乐: 攒积分+玩游戏+赢金币+抢现金！推荐码: (11252076), http://www.qpaile.com";
    //用户登录后推荐码变了 -- 11036790
    NSString* currentRecomStr = [recomStr stringByReplacingOccurrencesOfString:recomCode withString:@"11036790"];
    NSLog(@"当前用户的推荐字符串: %@", currentRecomStr);

    NSString* test1 = [self strNumberToCurrencyWithStr:@"1000.01"];
    NSString* test2 = [self strNumberToCurrencyWithStr:@"-88.02"];
    NSString* test3 = [self strNumberToCurrencyWithStr:@"9,999"];
    NSLog(@"test1:%@\ntest2:%@\ntest3:%@",test1,test2,test3);

    [self regexFunExample_1];
    printf("\n--------------------------\n");
    [self isValidPhoneNoForPhoneStr:@"18614970611"];

    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *defaultPath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"defaultPath:%@",defaultPath);
    NSError *error;
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:defaultPath                                                                          error:&error];
    NSLog(@"%@",directoryContents);

    
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"One",@"1", @"Two",@"2", nil];
    for(NSString *key in dict.allKeys){
        NSLog(@"key = %@",key);
    }
    
    NSLog(@"--测试点点点%@--",[self strNumberToCurrencyWithStr:@""]);

    
    NSURL* imgUrl = [NSURL URLWithString:@"http://oss.aliyuncs.com/qpaile/feedback/feedback_1394410214.jpg"];
    NSData* downloadedImgData = [NSData dataWithContentsOfURL:imgUrl];
    UIImage* downloadImg = [UIImage imageWithData:downloadedImgData];
    NSLog(@"图片宽：%f; 高：%f",downloadImg.size.width,downloadImg.size.height);

    UIImage* imageLeft = [UIImage imageNamed:@"背景-1.png"];
    UIImage* imageRight = [UIImage imageNamed:@"背景-2.png"];
    [UIImageJPEGRepresentation(imageLeft, 0.7) writeToFile:@"/Users/wisecan/Desktop/imgleft.jpg" atomically:NO];
    [UIImageJPEGRepresentation(imageRight, 0.7) writeToFile:@"/Users/wisecan/Desktop/imgright.jpg" atomically:NO];;

    NSString* inputDateStr = @"2014-09-19 08:01:34";
    NSString* resStr = [self dateAnalyseWithDateStr:inputDateStr];
    NSLog(@"输出的时间为:%@", resStr);

    [self pngToJpgWithPngImgName:@"Default" jpgName:@"iphone.jpg"];
    [self pngToJpgWithPngImgName:@"Default-568h" jpgName:@"iphone5.jpg"];
    [self pngToJpgWithPngImgName:@"Default-4_7inch" jpgName:@"iphone6.jpg"];
    [self pngToJpgWithPngImgName:@"Default-5_5inch" jpgName:@"iphone6plus.jpg"];

    
    
    /****** 从plist文件中取出资源 ******/
    //寻找数据源文件的路径
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
    NSArray* areaList = [NSArray arrayWithContentsOfFile:plistPath];
    NSLog(@"\n areaList: %@",areaList);

    
    NSLog(@"设备系统: %@;  设备名称:%@;   %@",[[UIDevice currentDevice] systemVersion], [[UIDevice currentDevice] name], [[UIDevice currentDevice] localizedModel]);

    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"one",@"1", @"two",@"2", @"three",@"3", nil];
    NSLog(@"dict:%@",dict);
    [dict removeObjectForKey:@"2"];
    NSLog(@"dict:%@",dict);

    
    NSLog(@"-%@-",[[NSBundle mainBundle] pathForResource:@"aaaaaaa.jpg" ofType:@"" inDirectory:@"www"]);
    NSLog(@"-%@-",[[NSBundle mainBundle] pathForResource:@"1410747861.jpg" ofType:@""]);

    NSArray* arr = [@"http://api.dev.woshimote.cn/index.html" componentsSeparatedByString:@"/"];
    NSLog(@"%@",arr);

    NSArray* array = [[NSArray alloc] init];
    NSString* str = @"ccccc";
    NSString* str2 = @"ddddd";
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:str,@"1",str2,@"2", nil];
    NSLog(@"%@",dict);

    NSString* str = @"15,30,";
    NSLog(@"%@",[str componentsSeparatedByString:@","]);

    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    // app名称
    NSString *app_Name = [infoDict objectForKey:@"CFBundleDisplayName"];
    // app版本
    NSString *app_Version = [infoDict objectForKey:@"CFBundleShortVersionString"];
    // app build版本
    NSString *app_build = [infoDict objectForKey:@"CFBundleVersion"];
    NSLog(@"\n%@\n%@\n%@",app_Name,app_Version,app_build);

    //
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"ten",@"10", @"six",@"6", nil];
    NSLog(@"%@",[[dict allKeysForObject:@"six"] firstObject]);

    NSMutableArray* arr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSArray* subArr = [NSArray arrayWithObjects:@"21",@"22",@"23",@"24", nil];
    [arr insertObjects:subArr atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, [subArr count])]];
    NSLog(@"%@", arr);

    NSString* string = @"1,2";
    NSArray* arr = [string componentsSeparatedByString:@","];
    NSLog(@"%@",arr);

    NSMutableArray* arr = [NSMutableArray arrayWithObjects:@"3",@"2",@"4", nil];
    [arr sortUsingFunction:intSortUp context:NULL];
    NSLog(@"%@",arr);

    
    [self isValidURLStr:@"httpss://"];

    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSLog(@"adId：%@",adId);

    NSLog(@"%@   %f",[[UIDevice currentDevice] systemVersion],  [[[UIDevice currentDevice] systemVersion] floatValue]);

    
    NSString* sting = @"nihao";
    NSAssert(sting == nil, @"Method setupStream invoked multiple times");
    NSLog(@"哈哈哈哈");

    
    NSLog(@"2014-11-24 13:14:00  %@",[self dateAnalyseWithDateStr:@"2014-11-24 13:14:00"]);
    NSLog(@"2014-11-24 09:50:00  %@",[self dateAnalyseWithDateStr:@"2014-11-24 09:50:00"]);
    NSLog(@"2014-11-24 23:14:00  %@",[self dateAnalyseWithDateStr:@"2014-11-24 23:14:00"]);
    NSLog(@"2014-11-23 06:14:00  %@",[self dateAnalyseWithDateStr:@"2014-11-23 06:14:00"]);
    NSLog(@"2014-10-24 05:14:00  %@",[self dateAnalyseWithDateStr:@"2014-10-24 05:14:00"]);
    

    //时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSArray* arr = [NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期午",@"星期六", nil];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"c"];
    NSString* timeStr = [formatter stringFromDate:[NSDate date]];
    NSLog(@"当前的时间1为：%@",arr[[timeStr integerValue]-1]);
    
    //日历
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* compInput =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit| NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:[NSDate date]];
    
    NSString* dateStr = [NSString stringWithFormat:@"%04d-%02d-%02d %02d:%02d",(int)compInput.year,(int)compInput.month,(int)compInput.day,(int)compInput.hour,(int)compInput.minute];
    NSLog(@"当前的时间2为：%@",dateStr);
    
    
    NSURL* url = [NSURL URLWithString:@"http://www.viggiosoft.com/media/data/blog/newsstand/magazine-0.pdf/ma.pdf-1"];
    NSLog(@"%@  --- %@",[[url path] lastPathComponent], [[url path] pathExtension]);
    

    NSNumber* num = nil;
    NSLog(@"%d",[num intValue]);
    
    
    NSNumber* num1 = [NSNumber numberWithInt:1];
    NSNumber* num2 = [NSNumber numberWithInt:2];
    if ([num1 compare:num2] == NSOrderedAscending) {
        NSLog(@"升序");
    }
    else
    {
        NSLog(@"降序序");
    }
    
    //产生震动
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);

    
    UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bgButton.frame = CGRectMake(10, 66, 300, 44);
    [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
    [bgButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    [bgButton setTitle:@"家庭" forState:UIControlStateNormal];
    [bgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    bgButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    bgButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.view addSubview:bgButton];

    NSString* str1 = @"Asdf563f";
    
    if (![self isValidComposeCapOrNum:str1]) {
        NSLog(@"不满足条件");
    }
    else
        NSLog(@"满足条件");

    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"one",@"1", @"two",@"2", @"three",@"3", nil];
    NSLog(@"之前的：\n%@",dict);
    [dict removeObjectForKey:@"2"];
    NSLog(@"之后的：\n%@",dict);

    
    
    NSLog(@"今天--1. %@--", [self getDateStrFromDate:@"2015-03-18 07:58:00"]);
    NSLog(@"昨天--2. %@--", [self getDateStrFromDate:@"2015-03-17 09:13:00"]);
    NSLog(@"前天--3. %@--", [self getDateStrFromDate:@"2015-03-16 23:12:00"]);
    NSLog(@"5天前--4. %@--", [self getDateStrFromDate:@"2015-03-13 06:16:00"]);
    NSLog(@"5天前--5. %@--", [self getDateStrFromDate:@"2015-03-13 13:10:00"]);
    NSLog(@"6天前--5. %@--", [self getDateStrFromDate:@"2015-03-12 10:56:00"]);
    NSLog(@"1月前--6. %@--", [self getDateStrFromDate:@"2015-02-16 10:05:00"]);
    NSLog(@"未来--7. %@--", [self getDateStrFromDate:@"2015-04-25 10:14:00"]);

    
    self.myImageView.image = [UIImage imageNamed:@"screenShap.png"];
    self.myImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.myImageView.clipsToBounds = YES;

    UIImageView* imgView = [[UIImageView alloc] init];
    NSLog(@"【%p】",imgView);
    NSMutableArray* arr = [NSMutableArray arrayWithCapacity:1];
    [arr addObject:imgView];
    [arr addObject:imgView];
    NSLog(@"【%p】",arr[0]);
    NSArray* arr2 = [NSArray arrayWithArray:arr];
    NSLog(@"【%p】",arr2[0]);
    
    NSMutableSet *set1 = [[NSMutableSet alloc] initWithObjects:imgView,imgView, nil];
    NSLog(@"%d",set1.count);
  
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"今天您没有机会了" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
 
    
    [self youjiangwendaJson];

    //获取字符串的最后一个字符
    NSString* str = @"";
    NSLog(@"%@",[str substringFromIndex:[str length]-1]);

    //数组各个元素以某个字符串分隔，然后拼接为一个字符串
    NSArray* strArr = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    NSString* resStr = [strArr componentsJoinedByString:@","];
    NSLog(@"拼接后的字符串为 %@",resStr);
    /*打印结果
      拼接后的字符串为 1,2,3,4,5
     */
    NSString* numObj1 = [[NSString alloc] initWithString:@"123"];
    NSLog(@"numObj1 = [%p]",numObj1);
    NSString* numObj2 = [[NSString alloc] initWithString:@"123"];
    NSLog(@"numObj2 = [%p]",numObj2);
    NSString* numObj3 = @"234";
    NSLog(@"numObj3 = [%p]",numObj3);

    NSLog(@"%@",[UIApplication sharedApplication].windows);

    NSMutableArray* mutableArr = [NSMutableArray arrayWithObjects:@"11",@"22",@"33",@"44", nil];
    [mutableArr removeObject:nil];

    
    //数组各个元素以某个字符串分隔，然后拼接为一个字符串
    NSArray* strArr = [NSArray arrayWithObjects:@"1",nil];
    NSString* resStr = [strArr componentsJoinedByString:@","];
    NSLog(@"拼接后的字符串为 %@",resStr);

    NSMutableArray* arr = [[NSMutableArray alloc]initWithArray:nil];
    NSLog(@"%p",arr);
    [arr insertObject:@"89" atIndex:0];
    NSLog(@"%p %@",arr, arr);

    
    NSString* string = @"-1";
    NSLog(@"%ld",(long)[string integerValue]);

    
    NSLog(@"%d",getMaxofThree(20, 30, 20)) ;
    NSLog(@"%d",getMaxofThree(20, 30, 30));
    NSLog(@"%d",getMaxofThree(20, 30, 40));
    NSLog(@"%d",getMaxofThree(30, 30, 30));
 
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"删除" forState:UIControlStateNormal];
    //[btn setTitleColor:[UIColor colorWithRed:51/255.0f green:153/255.0f blue:204/255.0f alpha:1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:51/255.0f green:153/255.0f blue:235/255.0f alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:btn];

    
    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:1];
    [dict setObject:@"object One" forKey:@"photo1"];
     [dict setObject:@"object Two" forKey:@"photo2"];
     [dict setObject:@"object Three" forKey:@"photo3"];
     [dict setObject:@"object Four" forKey:@"photo4"];
    NSLog(@"%@",dict);
    
#pragma 新增加的-测试打印-开始
    //字典转为json字符串
    if (dict) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
        NSString *serializInfo =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"json:%@",serializInfo);
    }
#pragma 新增加的-测试打印-结束
#endif 
    
    NSLog(@"当前时间为：%@",[self dateGeneralStrFromDate:[NSDate date]]);
}

- (NSString*) dateGeneralStrFromDate:(NSDate*)inputDate
{
    if (inputDate)
    {
        //当前日历
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* compInput =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit| NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:inputDate];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSString* timeStr = [formatter stringFromDate:inputDate];
        return timeStr;
    }
    
    return @"";
}

//正则判断是不是8位字母和数字的组合（如：12345678、12uiki90,ioujmkln 这几种情况都符合）
//(返回值 YES:有效； NO:无效)
- (BOOL) isValidComposeCapOrNum:(NSString*)inputstr
{
    /*
     注：判断规则是 ①需满足8位；②这8位要么是字母,要么是数字,要么是字母和数字的组合
     */
    NSString* regex = @"^[A-Za-z0-9]{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([predicate evaluateWithObject:inputstr])
        return YES;
    else
        return NO;
}

//用正则表达式初步判读是不是有效的网址  (返回值 YES:被初步判定为有效网址； NO:非有效网址)
- (BOOL) isValidURLStr:(NSString*)urlStr;
{
    /*
     注：判断规则是以http://开头或https://开头被初步认定为是网址
     */
    NSString* regex = @"^https?://[\\s\\S]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([predicate evaluateWithObject:urlStr])
        return YES;
    else
        return NO;
}



-(void) pngToJpgWithPngImgName:(NSString*)pngImgName jpgName:(NSString*)jpgName
{
    UIImage* image = [UIImage imageNamed:pngImgName];
    [UIImageJPEGRepresentation(image, 0.7) writeToFile:[NSString stringWithFormat:@"/Users/wisecan/Desktop/%@",jpgName] atomically:NO];
}

- (NSString*) dateAnalyseWithDateStr:(NSString*)dateString
{
    NSTimeInterval secondsPerDay = 24 * 60 * 60; //一天共有的秒数
    NSTimeInterval secondsPerHour = 60*60; //一小时共有的秒数
    NSTimeInterval secondsperMinute = 60;//一分钟的秒数
    NSDate* currentDate = [NSDate date];//当前日期
    
    
    //根据字符串转换成一种时间格式 供下面解析
    //传入的时间字符串解析
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:dateString];
    
    
    //计算两个时间的时间差
    NSTimeInterval dateInterval = [currentDate timeIntervalSinceDate:inputDate];
    
    if (dateInterval/secondsPerDay < 1) //1天之内
    {
        int minutes = dateInterval / secondsperMinute;
        int hours = dateInterval / secondsPerHour;
        if (minutes < 5) {
            return @"刚刚"; //5分钟内（刚刚）
        }
        else if (minutes >=5 && minutes <=59) {
            return [NSString stringWithFormat:@"%d分钟前",minutes];//5--59分钟内（几分钟前）
        }
        else{
            return [NSString stringWithFormat:@"%d小时前",hours];
        }
    }
    else if (dateInterval/secondsPerDay < 30) //一个月之内（返回-几天前）
    {
        int days = dateInterval / secondsPerDay;
        return [NSString stringWithFormat:@"%d天前",days];
    }
    else //(返回-几个月前)
    {
        int months = dateInterval / (secondsPerDay*30);
        return [NSString stringWithFormat:@"%d个月前",months];
    }
}



-(void) regexFunExample_1
{
/*****例子1：从原始字符串中取出所有的数字，即过滤出数字字符串******/
    NSString* needMatchStr=@"137-8362-8970";
    NSString* regTags = @"[0-9]+";
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:regTags options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray* matches = [regex matchesInString:needMatchStr options:0 range:NSMakeRange(0, [needMatchStr length])];
    NSLog(@"-测试打印-属于类：%@",NSStringFromClass([matches[0] class]));
    NSMutableString* needResultStr = [NSMutableString stringWithCapacity:1];//被过滤后的字符串(最后需要的字符串)
    for (NSTextCheckingResult* match in matches) {
        NSRange range = [match range];
        NSLog(@"range[%d,%d]; 这个字符串为 %@",range.location,range.length,[needMatchStr substringWithRange:range]);
        [needResultStr appendString:[needMatchStr substringWithRange:range]];
        
        /*
        //capture groups
        for (int i = 0; i< [match numberOfRanges]; i++) {
            NSRange range1 = [match rangeAtIndex:i];
            NSLog(@"%d :%@",i,[needMatchStr substringWithRange:range1]);
        }
         */
    }
    NSLog(@"例子1的结果：%@",needResultStr);
}

-(void) regexFunExample_2
{
/*****例子2：从原始字符串中取出所有的(数字\大小写英文字母)******/
    NSString* needMatchStr=@"yangdongming1988@163.com";
    NSString* regTags = @"[A-Za-z0-9]+";
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:regTags options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray* matches = [regex matchesInString:needMatchStr options:0 range:NSMakeRange(0, [needMatchStr length])];
    NSLog(@"-测试打印-属于类：%@",NSStringFromClass([matches[0] class]));
    NSMutableString* needResultStr = [NSMutableString stringWithCapacity:1];//被过滤后的字符串(最后需要的字符串)
    for (NSTextCheckingResult* match in matches) {
        NSRange range = [match range];
        NSLog(@"range[%d,%d]; 这个字符串为 %@",range.location,range.length,[needMatchStr substringWithRange:range]);
        [needResultStr appendString:[needMatchStr substringWithRange:range]];
        
        /*
         //capture groups
         for (int i = 0; i< [match numberOfRanges]; i++) {
         NSRange range1 = [match rangeAtIndex:i];
         NSLog(@"%d :%@",i,[needMatchStr substringWithRange:range1]);
         }
         */
    }
    NSLog(@"例子2的结果：%@",needResultStr);
}

-(void)isValidPhoneNoForPhoneStr:(NSString*)phoneStr
{
    //^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|2|5|6|7|8|9])\\d{8}$
    NSString* regexTag1 = @"1\\d{10}";
    NSString* regexTag2 = @"^1\\d{10}$";
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:regexTag2 options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:phoneStr options:NSMatchingReportProgress range:NSMakeRange(0,[phoneStr length])];
    
    NSLog(@"---numberofMatch = %d",numberofMatch);
    
    //以131,132,....139 开头 以145,147 开头 以150,151...159开头,以180,182,183,185,187,188,189 后跟8位数字
    /*
     目前全国有27种手机号段。
     移动有16个号段：
     134、135、136、137、138、139、147、150、151、152、157、158、159、182、187、188。其中147、157、188是3G号段，其他都是2G号段。
     
     联通有7种号段：130、131、132、155、156、185、186。其中186是3G（WCDMA）号段，其余         为2G号段。
     
     电信有4个号段：133、153、180、189。其中189是3G号段（CDMA2000），133号段主要用作无线网卡号。
     150、151、152、153、155、156、157、158、159                  九个
     130、131、132、133、134、135、136、137、138、139            十个
     180、182、185、186、187、188、189                              七个
     13、15、18三个号段共30个号段，154、181、183、184暂时没有，加上147共27个。
     */
}




-(void) hiddenAlert
{
    [_alert dismissWithClickedButtonIndex:0 animated:YES];
}

- (IBAction)textFieldend:(id)sender {
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (!textField.window.keyWindow) {
        [textField.window makeKeyAndVisible];
    }
}
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

#pragma mark - UITextViewDelegate
-(void) textViewDidChange:(UITextView *)textView
{
    CGFloat newSizeH = textView.contentSize.height;
    NSLog(@"textView的新高度为%f",newSizeH);
    [UIView animateWithDuration:0.1f
                          delay:0
                        options:(UIViewAnimationOptionAllowUserInteraction|
                                 UIViewAnimationOptionBeginFromCurrentState)
                     animations:^(void) {
                         CGRect textViewFrame = textView.frame;
                         CGFloat y_Offset = newSizeH - textView.frame.size.height;
                         textViewFrame.size.height = newSizeH;
                         
                         textViewFrame.origin.y -= y_Offset;
                         
                         
                         textView.frame = textViewFrame;
                     }
                     completion:^(BOOL finished) {
                         //
                     }];
    
}

- (NSString*) getDateStrFromDate:(NSString*)dateString
{
    //传入的时间字符串解析
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:dateString];
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60; //一天共有的秒数
    NSDate* currentDate = [NSDate date];//当前日期
    NSDate* yesterdayDate = [currentDate dateByAddingTimeInterval:-secondsPerDay];//昨天日期
    NSDate* fivedaysAgoDate = [currentDate dateByAddingTimeInterval:-secondsPerDay*5];//5天前的日期
    
    //当前日历
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* compInput =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit| NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:inputDate];
    NSDateComponents* compCurrentDate =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:currentDate];
    NSDateComponents* compYesterDate =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit) fromDate:yesterdayDate];
    NSDateComponents* compfiveAgoDate =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit) fromDate:fivedaysAgoDate];
    
    NSLog(@"时：%ld",(long)compInput.hour);
    
    if ((compInput.year==compCurrentDate.year) && (compInput.month==compCurrentDate.month) && (compInput.day==compCurrentDate.day)) //今天(当天)
    {
        //时间格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setAMSymbol:@"上午"];
        [formatter setPMSymbol:@"下午"];
        [formatter setDateFormat:@"a h:mm"];//大H是24小时制，h是12小时制； a是上午下午的格式标记
        NSString* timeStr = [formatter stringFromDate:inputDate];
        
        return timeStr;
    }
    else if ([inputDate compare:currentDate]==NSOrderedAscending && [inputDate compare:fivedaysAgoDate]==NSOrderedDescending)
    {
        if ((compInput.year==compYesterDate.year) && (compInput.month==compYesterDate.month) && (compInput.day==compYesterDate.day))
        {
            return @"昨天";
        }
        else//5天内除昨天外的其他天
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            NSArray* arr = [NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
            [formatter setDateStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"c"];
            NSString* timeStr = [formatter stringFromDate:inputDate];
            if ([timeStr integerValue]>=1 && [timeStr integerValue]<=7) {
                return arr[[timeStr integerValue]-1];//返回“星期几”
            }
        }
    }
    else
    {
        if ((compInput.year==compfiveAgoDate.year) && (compInput.month==compfiveAgoDate.month) && (compInput.day==compfiveAgoDate.day)) //5天前的那一天
        {
            //如果是5天前的那一天，但inputDate小于fivedaysAgoDate时会进入该处理块
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            NSArray* arr = [NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
            [formatter setDateStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"c"];
            NSString* timeStr = [formatter stringFromDate:inputDate];
            if ([timeStr integerValue]>=1 && [timeStr integerValue]<=7) {
                return arr[[timeStr integerValue]-1];//返回“星期几”
            }
        }
        else
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"yyyy/MM/dd"];
            NSString* timeStr = [formatter stringFromDate:inputDate];
            return timeStr;
        }
    }
    
    return @"";
}

- (NSString*) getDateDetailStrFromDate:(NSString*)dateString
{
    //传入的时间字符串解析
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:dateString];
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60; //一天共有的秒数
    NSDate* currentDate = [NSDate date];//当前日期
    NSDate* yesterdayDate = [currentDate dateByAddingTimeInterval:-secondsPerDay];//昨天日期
    NSDate* fivedaysAgoDate = [currentDate dateByAddingTimeInterval:-secondsPerDay*5];//5天前的日期
    
    //当前日历
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* compInput =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit| NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:inputDate];
    NSDateComponents* compCurrentDate =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:currentDate];
    NSDateComponents* compYesterDate =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit) fromDate:yesterdayDate];
    NSDateComponents* compfiveAgoDate =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit) fromDate:fivedaysAgoDate];
    
    if ((compInput.year==compCurrentDate.year) && (compInput.month==compCurrentDate.month) && (compInput.day==compCurrentDate.day)) //今天(当天)
    {
        //时间格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setAMSymbol:@"上午"];
        [formatter setPMSymbol:@"下午"];
        [formatter setDateFormat:@"a hh:mm"];//大H是24小时制，h是12小时制； a是上午下午的格式标记
        NSString* timeStr = [formatter stringFromDate:inputDate];
        
        return timeStr;
    }
    else if ([inputDate compare:currentDate]==NSOrderedAscending && [inputDate compare:fivedaysAgoDate]==NSOrderedDescending)
    {
        NSString* prefixStr;
        if ((compInput.year==compYesterDate.year) && (compInput.month==compYesterDate.month) && (compInput.day==compYesterDate.day))
        {
            prefixStr = @"昨天";
        }
        else//5天内除昨天外的其他天
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            NSArray* arr = [NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
            [formatter setDateStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"c"];
            NSString* timeStr = [formatter stringFromDate:inputDate];
            if ([timeStr integerValue]>=1 && [timeStr integerValue]<=7) {
                prefixStr = arr[[timeStr integerValue]-1];//返回“星期几”
            }
        }
        
        //
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setAMSymbol:@"上午"];
        [formatter setPMSymbol:@"下午"];
        [formatter setDateFormat:@"ah:mm"];//大H是24小时制，h是12小时制； a是上午下午的格式标记
        NSString* suffixStr = [formatter stringFromDate:inputDate];
        
        return [NSString stringWithFormat:@"%@ %@",prefixStr,suffixStr];
    }
    else
    {
        NSString* prefixStr;
        if ((compInput.year==compfiveAgoDate.year) && (compInput.month==compfiveAgoDate.month) && (compInput.day==compfiveAgoDate.day)) //5天前的那一天
        {
            //如果是5天前的那一天，但inputDate小于fivedaysAgoDate时会进入该处理块
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            NSArray* arr = [NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
            [formatter setDateStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"c"];
            NSString* timeStr = [formatter stringFromDate:inputDate];
            if ([timeStr integerValue]>=1 && [timeStr integerValue]<=7) {
                prefixStr = arr[[timeStr integerValue]-1];//返回“星期几”
            }
        }
        else
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"yyyy年M月d日"];
            NSString* timeStr = [formatter stringFromDate:inputDate];
            prefixStr = timeStr;
        }
        
        //
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setAMSymbol:@"上午"];
        [formatter setPMSymbol:@"下午"];
        [formatter setDateFormat:@"ah:mm"];//大H是24小时制，h是12小时制； a是上午下午的格式标记
        NSString* suffixStr = [formatter stringFromDate:inputDate];
        
        return [NSString stringWithFormat:@"%@ %@",prefixStr,suffixStr];
    }
    
    return @"";
}

-(void) youjiangwendaJson
{
    
    NSMutableArray* questionArr = [NSMutableArray arrayWithCapacity:1];
    
    //问题1及回答结果
    NSDictionary* question1 = [NSDictionary dictionaryWithObjectsAndKeys:@"idxValue",@"idx",@"1,2,3", @"answer", nil];
    [questionArr addObject:question1];
    
    //问题2及回答结果
    NSDictionary* question2 = [NSDictionary dictionaryWithObjectsAndKeys:@"idxValue",@"idx",@"1,4", @"answer", nil];
    [questionArr addObject:question2];
    
    
    NSDictionary* themeDict = [NSDictionary dictionaryWithObjectsAndKeys:@"idxValue",@"idx", questionArr,@"question", nil];
    NSDictionary* postDict = [NSDictionary dictionaryWithObjectsAndKeys:themeDict,@"theme", nil];

    //字典转为json字符串，然后打印出发送的json数据
    if (postDict) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postDict options:NSJSONWritingPrettyPrinted error:nil];
        NSString *serializInfo =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"json:\n%@",serializInfo);
    }
}
@end
