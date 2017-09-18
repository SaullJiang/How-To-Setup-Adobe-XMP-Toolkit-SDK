//
//  XMPUtils.m
//  XMPToolKitSDK-iOS-Sample
//
//  Created by 石塚隆一 on 2017/09/16.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPUtils.h"
#include <string>

//#define ENABLE_XMP_CPP_INTERFACE 1

// Must be defined to instantiate template classes
#define TXMP_STRING_TYPE std::string

// Must be defined to give access to XMPFiles
#define XMP_INCLUDE_XMPFILES 1

#define XMPUtilsDomain @"org.ryu1.xmptoolkit.ios.sample.XMPToolKitSDK-iOS-Sample"

// Ensure XMP templates are instantiated
#include "XMP.incl_cpp"

// Provide access to the API
#include "XMP.hpp"

#include <iostream>
#include <fstream>

@implementation XMPUtils

+ (void)writeRate:(NSString *)rate withFile:(NSString *)path error:(NSError **) error
{
    std::string filename = [path UTF8String];

    if(!SXMPMeta::Initialize())
    {
        std::cout << "Could not initialize toolkit!";
        if (error) {
            *error = [NSError errorWithDomain:XMPUtilsDomain code:-1 userInfo:@{@"message": @"Could not initialize toolkit!"}];
            return;
        }
    }

    XMP_OptionBits options = 0;

    // Must initialize SXMPFiles before we use it
    if(SXMPFiles::Initialize(options))
    {
        try
        {
            // Options to open the file with - open for editing and use a smart handler
            XMP_OptionBits opts = kXMPFiles_OpenForUpdate | kXMPFiles_OpenUseSmartHandler;

            bool ok;
            SXMPFiles myFile;
            std::string status = "";

            // First we try and open the file
            ok = myFile.OpenFile(filename, kXMP_UnknownFile, opts);
            if( ! ok )
            {
                status += "No smart handler available for " + filename + "\n";
                status += "Trying packet scanning.\n";

                // Now try using packet scanning
                opts = kXMPFiles_OpenForUpdate | kXMPFiles_OpenUsePacketScanning;
                ok = myFile.OpenFile(filename, kXMP_UnknownFile, opts);
            }

            // If the file is open then read get the XMP data
            if(ok)
            {
                std::cout << status << std::endl;
                std::cout << filename << " is opened successfully" << std::endl;
                // Create the XMP object and get the XMP data
                SXMPMeta meta;
                myFile.GetXMP(&meta);

                ///////////////////////////////////////////////////
                // Now modify the XMP
//                if(meta.DoesPropertyExist(kXMP_NS_XMP, "Rating"))
//                {
                    // Update xap:Rating - we don't need to set any option bits
                    meta.SetProperty(kXMP_NS_XMP, "Rating", [rate UTF8String], 0);
//                }

                // Display the properties again to show changes
                std::cout << "After update:" << std::endl;
                
                // Check we can put the XMP packet back into the file
                if (myFile.CanPutXMP(meta)) {
                    // If so then update the file with the modified XMP
                    myFile.PutXMP(meta);
                } else {
                    *error = [NSError errorWithDomain:XMPUtilsDomain code:-2 userInfo:@{@"message": @"write error!"}];
                }
                
                // Close the SXMPFile.  This *must* be called.  The XMP is not
                // actually written and the disk file is not closed until this call is made.
                myFile.CloseFile();
            }
            else
            {
                std::cout << "Unable to open " << filename << std::endl;
                *error = [NSError errorWithDomain:XMPUtilsDomain code:-3 userInfo:@{@"message": @"Unable to open"}];
            }
        }
        catch(XMP_Error & e)
        {
            std::cout << "ERROR: " << e.GetErrMsg() << std::endl;
            *error = [NSError errorWithDomain:XMPUtilsDomain code:-3 userInfo:@{@"message": @"write other error"}];
        }
        
        // Terminate the toolkit
        SXMPFiles::Terminate();
        SXMPMeta::Terminate();
        
    }
    else
    {
        std::cout << "Could not initialize SXMPFiles.";
        *error = [NSError errorWithDomain:XMPUtilsDomain code:-4 userInfo:@{@"message": @"Could not initialize SXMPFiles."}];
    }
}

+ (NSString *)readRateWithFile:(NSString *)path error:(NSError **)error
{
    std::string simpleValue = "";  //Stores the value for the property
    std::string filename = [path UTF8String];

    if(!SXMPMeta::Initialize())
    {
        std::cout << "Could not initialize toolkit!";
        *error = [NSError errorWithDomain:XMPUtilsDomain code:-1 userInfo:@{@"message": @"Could not initialize toolkit!"}];
        return nil;
    }

    XMP_OptionBits options = 0;

    // Must initialize SXMPFiles before we use it
    if (!SXMPFiles::Initialize(options))
    {
        std::cout << "Could not initialize SXMPFiles.";
        *error = [NSError errorWithDomain:XMPUtilsDomain code:-4 userInfo:@{@"message": @"Could not initialize SXMPFiles."}];
    }

    try
    {
        // Options to open the file with - read only and use a file handler
        XMP_OptionBits opts = kXMPFiles_OpenForRead | kXMPFiles_OpenUseSmartHandler;

        bool ok;
        SXMPFiles myFile;
        std::string status = "";

        // First we try and open the file
        ok = myFile.OpenFile(filename, kXMP_UnknownFile, opts);
        if( ! ok )
        {
            status += "No smart handler available for " + filename + "\n";
            status += "Trying packet scanning.\n";

            // Now try using packet scanning
            opts = kXMPFiles_OpenForUpdate | kXMPFiles_OpenUsePacketScanning;
            ok = myFile.OpenFile(filename, kXMP_UnknownFile, opts);
        }

        // If the file is open then read the metadata
        if(ok)
        {
            std::cout << status << std::endl;
            std::cout << filename << " is opened successfully" << std::endl;
            // Create the xmp object and get the xmp data
            SXMPMeta meta;
            myFile.GetXMP(&meta);

            bool exists;

            // Read a simple property
            exists = meta.GetProperty(kXMP_NS_XMP, "Rating", &simpleValue, NULL);
            if(exists)
                std::cout << "Rating = " << simpleValue << std::endl;
            else
                simpleValue.clear();

            // Close the SXMPFile.  The resource file is already closed if it was
            // opened as read only but this call must still be made.
            myFile.CloseFile();
        }
        else
        {
            std::cout << "Unable to open " << filename << std::endl;
            *error = [NSError errorWithDomain:XMPUtilsDomain code:-3 userInfo:@{@"message": @"Unable to open"}];
        }
    }
    catch(XMP_Error & e)
    {
        std::cout << "ERROR: " << e.GetErrMsg() << std::endl;
        *error = [NSError errorWithDomain:XMPUtilsDomain code:-3 userInfo:@{@"message": @"read other error"}];

    }
    
    // Terminate the toolkit
    SXMPFiles::Terminate();
    SXMPMeta::Terminate();

    return [NSString stringWithUTF8String:simpleValue.c_str()];
}

@end
