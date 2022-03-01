//
//  Logger.swift
//  ozan-case-study
//
//  Created by Developer on 1.03.2022.
//

class Logger {
    
    static func log(_ items: Any...) {
        #if DEBUG
        print(items)
        #endif
    }
}
