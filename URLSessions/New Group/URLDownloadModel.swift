//
//  URLDownloadModel.swift
//  URLSessions
//
//  Created by Kumar, Sravan on 01/11/17.
//  Copyright © 2017 Kumar, Sravan. All rights reserved.
//

import UIKit

struct URLDownloadModel {

    private var fileTitle: String
    private var fileURL: String
    /// it will retuns file title and file url
    var fetchValues: (String, String) {
        get {
            return (fileTitle, fileURL)
        }
    }
    init(_ fileTitle: String, _ fileURL: String) {
        self.fileTitle = fileTitle
        self.fileURL = fileURL
    }
}
