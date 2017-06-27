//
//  CustomInvalidDateFormatter.swift
//  FeedKit
//
//  Created by Greg Pardo on 6/27/17.
//
//

import Foundation

/**
 
 Converts date and time textual representations within the RFC822
 date specification into `Date` objects
 
 */

 // NOTE: This is for a specific invalid rss I need to parse
// Do not add this into codebase
class CustomInvalidDateFormatter: DateFormatter {
    
    let dateFormats = [
        "M/d/y h:m:00 a"
    ]
    
    override init() {
        super.init()
        self.timeZone = TimeZone(secondsFromGMT: 0)
        self.locale = Locale(identifier: "en_US_POSIX")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not supported")
    }
    
    override func date(from string: String) -> Date? {
        for dateFormat in self.dateFormats {
            self.dateFormat = dateFormat
            if let date = super.date(from: string) {
                return date
            }
        }
        return nil
    }
    
}
