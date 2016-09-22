//
//  FFNetworkManager.swift
//  SwiftZZ
//
//  Created by 陈飞 on 16/9/7.
//  Copyright © 2016年 陈飞. All rights reserved.
//

import UIKit
import Alamofire
import ReachabilitySwift
import CoreTelephony.CTTelephonyNetworkInfo
import AdSupport
import SwiftyJSON

class FFNetworkManager: NSObject {
    
    var deveice_id: String? = NSUserDefaults.standardUserDefaults().objectForKey(FFUserDeveiceID) as? String
    
    /// 单例
    static let sharedInstance = FFNetworkManager()
    
    func request(method: Alamofire.Method = .POST,
                 urlString: String,
                 parameters: [String: AnyObject]?,
                 result: (responseDict: [String: AnyObject]?, error: NSError?, success: Bool) -> Void) {
        let param = requestParam(urlString, parameters: parameters)
        Alamofire.Manager.instance.request(method, ApiUrl, parameters: param, encoding: .URL, headers: loadDefaultHeaders()).responseData { (response) in
            if response.result.isSuccess {
                guard let data = response.data else {
                    let error = NSError(domain: "com.xiaofei.error", code: -1001, userInfo: ["errorMessage": "数据为空"])
                    result(responseDict: nil, error: error, success: true)
                    return
                }
                
                do {
                    let resultDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]
                    result(responseDict: resultDict, error: response.result.error, success: true)
                } catch {
                    let error = NSError(domain: "com.xiaofei.error", code: -1002, userInfo: ["errorMessage": "数据解析异常"])
                    result(responseDict: nil, error: error, success: true)
                }
                
            } else {
                result(responseDict: nil, error: response.result.error, success: false)
            }
        }
    }
    
    func upload(method: Alamofire.Method = .POST,
                urlString: String,
                parameters: [String: AnyObject]?,
                data: NSData?,
                result: (responseDict: [String: AnyObject]?, error: NSError?, success: Bool) -> Void){
        let param = requestParam(urlString, parameters: parameters)
        
        Alamofire.Manager.instance.upload(.POST, ApiUrl, multipartFormData: { (formData) in
            if let imageData = data {
                formData.appendBodyPart(data: imageData, name: "avatar", fileName: "avatar.jpg", mimeType: "image/jpeg")
            }
            formData.appendBodyPart(data: param["method"]!.dataUsingEncoding(NSUTF8StringEncoding)!, name: "method")
            formData.appendBodyPart(data: param["timestamp"]!.dataUsingEncoding(NSUTF8StringEncoding)!, name: "timestamp")
            formData.appendBodyPart(data: param["param"]!.dataUsingEncoding(NSUTF8StringEncoding)!, name: "param")
            formData.appendBodyPart(data: param["sig"]!.dataUsingEncoding(NSUTF8StringEncoding)!, name: "sig")
        }) { (theResult) in
            switch theResult {
            case .Success(request: let req, streamingFromDisk: _, streamFileURL: _):
                req.progress({ (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
                    
                }).responseJSON(completionHandler: { (response) in
                    if response.result.isSuccess {
                        guard let data = response.data else {
                            let error = NSError(domain: "com.xiaofei.error", code: -1001, userInfo: ["errorMessage": "数据为空"])
                            result(responseDict: nil, error: error, success: true)
                            return
                        }
                        
                        do {
                            let resultDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]
                            result(responseDict: resultDict, error: response.result.error, success: true)
                        } catch {
                            let error = NSError(domain: "com.xiaofei.error", code: -1002, userInfo: ["errorMessage": "数据解析异常"])
                            result(responseDict: nil, error: error, success: true)
                        }
                        
                    } else {
                        result(responseDict: nil, error: response.result.error, success: false)
                    }
                })
                break
            case .Failure( _):
                let error = NSError(domain: "com.xiaofei.error", code: -1003, userInfo: ["errorMessage": "上传图片失败"])
                result(responseDict: nil, error: error, success: false)
                break
            }
        }
    }
    
    private func requestParam(urlString: String, parameters: [String: AnyObject]?) -> [String: AnyObject] {
        let time = (NSString(format: "%.0f", NSDate().timeIntervalSince1970) as String)
        var paramJson: String = "{}"
        if let param = parameters{
            let data : NSData! = try? NSJSONSerialization.dataWithJSONObject(param, options: [])
            paramJson = NSString (data: data, encoding:NSUTF8StringEncoding) as! String
        }
        let str = AppToken + time + paramJson
        let sig =  NSString.md5(str) as String
        return ["method" : urlString,
                "timestamp" : time,
                "param" : paramJson,
                "sig" : sig];
    }
    
    private func loadDefaultHeaders() -> [String: String] {
        var headers = [String: String]()
        headers["zzlVersion"] = AppVersion
        headers["zzlType"] = "iPhone OS"
        headers["zzlSystemVersion"] = UIDevice.currentDevice().systemVersion
        headers["zzlModel"] = UIDevice.currentDevice().model
        headers["zzlChannel"] = ChannelId
        headers["zzDid"] = ""
        headers["zzUid"] = ""
        headers["zzVendor"] = "Apple"
        headers["zzResolution"] = resolutionStr()
        headers["zzNetworking"] = networkStr()
        headers["zzOperators"] = operatorCodeStr()
        headers["zzOperatorsName"] = operatorNameStr()
        headers["zzNetworkingType"] = netTypeStr()
        return headers
    }
    
    private func resolutionStr() -> String {
        let widthSize = ScreenScale * ScreenWidth
        let heightSize = ScreenScale * ScreenHeight
        return "\(min(widthSize, heightSize))*\(max(widthSize, heightSize))"
    }
    
    private func networkStr() -> String {
        do {
            let reachability = try Reachability.reachabilityForInternetConnection()
            if reachability.isReachable() {
                if reachability.currentReachabilityStatus == .ReachableViaWiFi {
                    return "WiFi"
                } else if reachability.currentReachabilityStatus == .ReachableViaWWAN {
                    let networkType = CTTelephonyNetworkInfo().currentRadioAccessTechnology
                    if let type = networkType {
                        return type
                    }
                    return "CellNetwork"
                }
            }
        } catch {
            return "0"
        }
        return "0"
    }
    
    private func operatorCodeStr() -> String {
        guard let provider = CTTelephonyNetworkInfo().subscriberCellularProvider else {
            return ""
        }
        guard let countryCode = provider.mobileCountryCode else {
            return ""
        }
        guard let netCode = provider.mobileCountryCode else {
            return ""
        }
        return countryCode + netCode
    }
    
    private func operatorNameStr() -> String {
        guard let provider = CTTelephonyNetworkInfo().subscriberCellularProvider else {
            return ""
        }
        guard let name = provider.carrierName else {
            return ""
        }
        return name
    }
    
    private func netTypeStr() -> String {
        
        do {
            let reachability = try Reachability.reachabilityForInternetConnection()
            if reachability.isReachable() {
                if reachability.currentReachabilityStatus == .ReachableViaWiFi {
                    return "WiFi"
                } else if reachability.currentReachabilityStatus == .ReachableViaWWAN {
                    let networkType = CTTelephonyNetworkInfo().currentRadioAccessTechnology
                    switch networkType! {
                    case CTRadioAccessTechnologyGPRS,
                         CTRadioAccessTechnologyCDMA1x,
                         CTRadioAccessTechnologyEdge:
                        return "2G"
                    case CTRadioAccessTechnologyWCDMA,
                         CTRadioAccessTechnologyHSDPA,
                         CTRadioAccessTechnologyHSUPA,
                         CTRadioAccessTechnologyCDMAEVDORev0,
                         CTRadioAccessTechnologyCDMAEVDORevA,
                         CTRadioAccessTechnologyCDMAEVDORevB,
                         CTRadioAccessTechnologyeHRPD:
                        return "3G"
                    case CTRadioAccessTechnologyLTE:
                        return "4G"
                    default:
                        return ""
                    }
                }
            }
        } catch {
            return ""
        }
        return ""
    }
    
    @objc func advertisingUniqueId() -> String {
        let str = UIDevice.currentDevice().platformStr()
        if str == "x86_64" {
            return "1"
        } else {
            return ASIdentifierManager.sharedManager().advertisingIdentifier.UUIDString
        }
    }
}

extension Alamofire.Manager {
    public static let instance: Alamofire.Manager = {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 15
        return Manager(configuration: configuration)
    }()
}
