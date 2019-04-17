//
//  URLSession+Rx.swift
//  MustacheLib
//
//  Created by Tommy Hinrichsen on 17/08/2018.
//  Copyright © 2018 Mustache ApS. All rights reserved.
//

import Foundation
import RxSwift

public extension URLSession {

    public func dataTask(with request: URLRequest) -> Observable<(Data?, URLResponse?)> {
        return Observable.create { (observer: AnyObserver<(Data?, URLResponse?)>) in
            let task = self.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                if let error = error {
                    observer.onError(error)
                }
                observer.onNext((data, response))
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
