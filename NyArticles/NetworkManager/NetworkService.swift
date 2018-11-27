//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Moya_ObjectMapper
import ObjectMapper

final class NetworkService {
     
    static let shared: NetworkService = NetworkService()
    private let reachabilityManager = NetworkReachabilityManager()
    
    var serviceProvider = MoyaProvider<ServiceProvider>(plugins: [NetworkLoggerPlugin(verbose: AppConst.currentEnvironment == .development ? true : false)])

    private init() {}
    
    func configureNetworkReachability() {
        reachabilityManager?.listener = { _ in
            if let isNetworkReachable = self.reachabilityManager?.isReachable,
                isNetworkReachable == true {
            } else {
                WeatherUtility.shared.showAlertViewController(title: AppString.Opps, message: AppString.NoInternetConnection, okayCallBack: nil,cancelCallBack: nil)
            }
        }
        reachabilityManager?.startListening()
    }
    
    func callService<T: Mappable, TT:TargetType, P: MoyaProvider<TT>>(_ provider:P, type:TT,
                                                                      success: @escaping ((T) -> Void),
                                                                      failure: @escaping ((NSError) -> Void)) {
        
        provider.request(type) { (result) in
            switch result {
            case let .success(response):
                do {
                    let _ = try response.filterSuccessfulStatusCodes()
                    let modelObj = try response.mapObject(T.self)
                    success(modelObj)
                } catch {
                    failure(error as NSError)
                }
            case let .failure(error):
                failure(error as NSError)
            }
        }
    }
    
    func callServiceReturnArray<T: Mappable, TT:TargetType, P: MoyaProvider<TT>>(_ provider:P, type:TT,
                                                                                 success: @escaping (([T]) -> Void),
                                                                                 failure: @escaping ((NSError) -> Void)) {
        provider.request(type) { (result) in
            switch result {
            case let .success(response):
                do {
                    let _ = try response.filterSuccessfulStatusCodes()
                    let modelObj = try response.mapArray(T.self)
                    success(modelObj)
                } catch {
                    failure(error as NSError)
                }
            case let .failure(error):
                failure(error as NSError)
            }
        }
    }
}
