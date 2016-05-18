//
//  main.m
//  JSONMenuIDs


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line1 = @"{\"menu\": {\"header\": \"menu\", \"items\": [{\"id\": 27}, {\"id\": 0, \"label\": \"Label 0\"}, null, {\"id\": 93}, {\"id\": 85}, {\"id\": 54}, null, {\"id\": 46, \"label\": \"Label 46\"}]}}";
        NSString *line2 = @"{\"menu\": {\"header\": \"menu\", \"items\": [{\"id\": 81}]}}";
        NSString *line3 = @"{\"menu\": {\"header\": \"menu\", \"items\": [{\"id\": 70, \"label\": \"Label 70\"}, {\"id\": 85, \"label\": \"Label 85\"}, {\"id\": 93, \"label\": \"Label 93\"}, {\"id\": 2}]}}";
        NSString *line4 = @"{\"menu\": {\"header\": \"menu\", \"items\": [{\"id\": 4}, {\"id\": 28, \"label\": \"Label 28\"}, {\"id\": 75}, null, {\"id\": 67}, null, null]}}";
        
        NSString *line5 = @"{\"menu\": {\"header\": \"menu\", \"items\": [{\"id\": 28, \"label\": \"Label 28\"}, null, {\"id\": 32}, {\"id\": 89}, {\"id\": 23}, {\"id\": 43}, {\"id\": 49, \"label\": \"Label 49\"}, {\"id\": 69}, {\"id\": 66, \"label\": \"Label 66\"}]}}";
        
        NSArray *arrayOfLines = @[line1, line2, line3, line4, line5];
        
        
        for (NSString *JSONstring in arrayOfLines) {
            NSInteger sum = 0;
            
            NSArray *firstBracketSeperation =[JSONstring componentsSeparatedByString:@"["];
            NSArray *closingBracketSeperation = [[firstBracketSeperation objectAtIndex:1] componentsSeparatedByString:@"]"];
            NSArray *stringsInsideItemsArray = [[closingBracketSeperation objectAtIndex:0] componentsSeparatedByString:@"},"];
            
            for (NSString *itemString in stringsInsideItemsArray) {
//                NSLog(@"%@", itemString);
                
                NSArray *sep1 = [itemString componentsSeparatedByString:@"\"label\": \"Label "];
                if (sep1.count > 1)  {
//                    NSLog(@"%@", [sep1 objectAtIndex:1]);
                    NSArray *finalSep = [[sep1 objectAtIndex:1] componentsSeparatedByString:@"\""];
//                    NSLog(@"Int: %ld", [[finalSep objectAtIndex:0] integerValue]);
                    sum += [[finalSep objectAtIndex:0] integerValue];
                }
            }
        
            NSLog(@"line %ld has sum = %ld", [arrayOfLines indexOfObject:JSONstring] + 1, sum);
        }
        
        
    }
    return 0;
}

//THIS WORKS BUT CODEEVAL NOT ACCEPTING because of inclusion of null in items array
//NSInteger sum = 0;
//
//NSData *data = [JSONstring dataUsingEncoding:NSUTF8StringEncoding];
//NSDictionary *dictFromJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//
////            NSLog(@"JSON DICT: %@", dictFromJSON);
//
////            NSArray *IDsArray = dictFromJSON[@"menu"][@"items"];
//NSDictionary *menuDict = [dictFromJSON objectForKey:@"menu"];
//NSArray *IDsArray = [menuDict objectForKey:@"items"];
//
////            NSLog(@"\nIDsArray:%@\n\n", IDsArray);
////            NSLog(@"\nIDsArray.count:%ld\n\n", IDsArray.count);
//
//
//NSInteger i = 0;
//for (i = 0; i < IDsArray.count; i++) {
//    //                NSLog(@"class: %@", [[IDsArray objectAtIndex:i] class]);
//    
//    NSDictionary *dictsInsideArray = [IDsArray objectAtIndex:i];
//    
//    if (![dictsInsideArray isEqual:[NSNull null]] && [[dictsInsideArray allKeys] containsObject:@"label"]) {
//        //                  NSLog(@"dictionary:%@\n", dictsInsideArray[@"id"]);
//        sum += [[dictsInsideArray objectForKey:@"id" ] integerValue];
//    }
//}
//
//NSLog(@"line %ld has sum = %ld", [arrayOfLines indexOfObject:JSONstring] + 1, sum);
//}


