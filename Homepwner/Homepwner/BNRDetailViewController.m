//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by xiaobo on 2018/6/22.
//  Copyright © 2018年 xiaobo. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRDetailViewController () <UINavigationBarDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation BNRDetailViewController
- (IBAction)takePicture:(id)sender {
    UIImagePickerController * imagePick = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePick.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePick.delegate = self;
    [self presentViewController:imagePick animated:YES completion:nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    BNRItem * kitem  = self.item;
    UIImage * image = nil;
    self.nameField.text = kitem.itemName;
    NSLog(@"itemName %@, Serial No %@", kitem.itemName, kitem.serialNumber);
    self.serialNumberField.text = kitem.serialNumber;
    self.valueField.text = [NSString stringWithFormat: @"%d", kitem.valueInDollars];
    
    static NSDateFormatter * dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    if ((image = [[BNRImageStore sharedStore] imageForKey: kitem.itemkey])) {
        _imageView.image = image;
    }
    
    self.dateField.text = [dateFormatter stringFromDate:kitem.dateCreated];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    // 取消编辑
    [self.view endEditing:YES];
    
    BNRItem * item = self.item;
    
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    
    //string to number
    item.valueInDollars = [self.valueField.text intValue];
    
}

-(void) setItem:(BNRItem *) item
{
    _item = item;
    UINavigationItem * navItem = self.navigationItem;
    navItem.title = _item.itemName;
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    [[BNRImageStore sharedStore] setImage:image forKey:self.item.itemkey];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}



@end
