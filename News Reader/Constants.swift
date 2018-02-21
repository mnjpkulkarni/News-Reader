//
//  Constants.swift
//  News Reader
//
//  Created by Manoj Kulkarni on 1/24/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import Foundation
import AWSCore

let BASE_URL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8643bcf10ecc4a76977a62242caf0f05"

typealias DownloadComplete = () -> ()

let AwsRegion = AWSRegionType.USEast1 // e.g. AWSRegionType.USEast1
let CognitoIdentityPoolId = "us-east-1:3cab1e23-7d5b-4ac6-8c01-c4dcffcc98b2"
