//
//  MailingManager.swift
//  hackathonProject
//
//  Created by Zhanxi Ni on 7/19/18.
//

import Foundation
import UIKit

struct MailingManager {
    
    static func sendMail(draft: Draft,from userID: String,to recipient: String, callback: @escaping() -> ()) {
        let link = "https://api.lob.com/v1/letters"
        let url = URL(string: link)!
        var request = URLRequest(url: url)
        
        
        
        let body = ["from": userID, "to": recipient, "color": "false", "file": ""]

        
    }
    
    static func getRecipientMailID(name: String, address: Address, callback:@escaping  (String) -> Void) {

        // get link
        let link = "https://api.lob.com/v1/addresses"
        
        // turn link to url
        let url = URL(string: link)!
       
        // create a url request
        var request = URLRequest(url: url)
        
        //define body using by filling in models
        let body = ["name":name, "address_line1":address.street, "address_city":address.city, "address_state":address.state, "address_zip": address.zipCode]
        
        //turns body info into JSON data
        let bodyData = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        
        //add the body into the request
        request.httpBody = bodyData
        
        // add authorization into header
        request.setValue("Basic dGVzdF82M2ZmMDgwNWNjZTFjZDI5OTg5N2ZmMzZkYzJiYjU0NjJkNjo=", forHTTPHeaderField: "Authorization")
        
        //create a url session
        let session = URLSession.shared
        
        //create a task within the url session
        let task = session.dataTask(with: request) { (data, response, error) in
           
            guard let data = data else {
                return
            }
            let dataID = try! JSONDecoder().decode(DataID.self, from: data)
            callback((dataID.data.first?.id)!)
        }
        task.resume()
    }


static func getUserMailID(name: String, address: UserAddress, callback:@escaping  (String) -> Void) {
    
    // get link
    let link = "https://api.lob.com/v1/addresses"
    
    // turn link to url
    let url = URL(string: link)!
    
    // create a url request
    var request = URLRequest(url: url)
    
    //define body using by filling in models
    let body = ["name":name, "address_line1":address.street, "address_city":address.city, "address_state":address.state, "address_zip": address.zipCode]
    
    //turns body info into JSON data
    let bodyData = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    
    //add the body into the request
    request.httpBody = bodyData
    
    // add authorization into header
    request.setValue("Basic dGVzdF82M2ZmMDgwNWNjZTFjZDI5OTg5N2ZmMzZkYzJiYjU0NjJkNjo=", forHTTPHeaderField: "Authorization")
    
    //create a url session
    let session = URLSession.shared
    
    //create a task within the url session
    let task = session.dataTask(with: request) { (data, response, error) in
        
        guard let data = data else {
            return
        }
        let dataID = try! JSONDecoder().decode(DataID.self, from: data)
        callback((dataID.data.first?.id)!)
    }
    task.resume()
}
//    static func htmlMailBody(content: String, date: Date) -> String{
//
//        let htmlString = "\(<html> <head> <meta charset=")\("UTF-8")"><link href="\("https:")//fonts.googleapis.com/css?family=Signika" rel="stylesheet" type="text/css"><title>Lob.com Sample Welcome Next Steps Letter</title><style>*, *:before, *:after {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;}body {width: 8.5in;height: 11in;margin: 0;padding: 0;
//            }
//            .page {
//                page-break-after: always;
//                position: relative;
//                width: 8.5in;
//                height: 11in;
//            }
//            .page-content {
//                position: absolute;
//                width: 8.125in;
//                height: 10.625in;
//                left: 0.1875in;
//                top: 0.1875in;
//                background-color: rgba(0,0,0,0);
//                }
//                .text {
//                    position: relative;
//                    top: 317px;
//                    width: 7in;
//                    margin: 0 auto;
//                    font-family: 'Signika';
//                    font-size: 12pt;
//                    line-height: 13pt;
//                }
//                .green-text {
//                    color: #73a044;
//                    }
//                    .date {
//                        float:right;
//        }
//        #footer {
//            position: absolute;
//            left:64px;
//            bottom: 32px;
//            font-family: 'Signika';
//            font-size: 10pt;
//            text-align: left;
//            color: #73a044;
//        }
//        #line {
//            position: absolute;
//            left: 123px;
//            top: -20px;
//            width:5.5in;
//            height:5px;
//            border-top: 1px solid #106387;
//        }
//        /* your main logo should have dimensions of at least 240x220 pixels. */
//        #main-logo {
//            position: absolute;
//            left: 515px;
//            top: 4px;
//            width: 2in;
//            height:.3in;
//        }
//        </style>
//        </head>
//
//        <body>
//        <div class="page">
//        <div class="page-content">
//        <div class="text">
//        <span class="date">\(date)</span>
//        <br><br>
//        INTRODUCTION LINE<br><br>
//        \(content)
//        <br><br>
//        CLOSING TAG<br><br>
//        <span class="green-text">SENDERS NAME</span>
//        </div>
//        </div>
//        </div>
//
//        </body>
//
//        </html> "
//    }
}

struct DataID: Decodable{
    let data: [IdModel]
}
struct IdModel: Decodable{
    let id: String
}




