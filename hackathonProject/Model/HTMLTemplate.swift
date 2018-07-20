//
//  HTMLTemplate.swift
//  hackathonProject
//
//  Created by Zhanxi Ni on 7/20/18.
//

import Foundation

struct HTMLTemplate {
    var body: String
    var salutations: String
    var closing: String
    var senderName: String
    
    func getHTML() -> String {
        let htmlTemplate = """
        <html>

        <head>

        </head>

        <div style="width: 400px; background-color: #fff; padding: 15px;">
        <p>

        \(salutations) </p>

        <p>

        \(body)

        </p>

        <div align="left">

        \(closing) <br/>

        \(senderName)

        </div>

        </div>

        </body>

        </html>
        """
        
        
        return htmlTemplate.replacingOccurrences(of: "\n", with: "")
    }
}
