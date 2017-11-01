//
//  URLManager.swift
//  URLSessions
//
//  Created by manjutilak on 11/1/17.
//  Copyright © 2017 Kumar, Sravan. All rights reserved.
//

import UIKit

class URLManager: NSObject {
    
    private var modelArray = [URLDownloadModel]()
    static let shared:URLManager = URLManager()
    
    /// Returns ModelArray
    var fetchDataModel: [URLDownloadModel] {
        
        get{
            return modelArray
        }
    }
    
    override init() {
        
        super.init()
        createModelObjects()
        
    }
    
    //MARK: Private Methods
    private func createModelObjects() {
        
        let obj1 : URLDownloadModel = URLDownloadModel("AIRPORTS_WORLD_WIDE","https://www.prod.mygdc.com/dpubs/ipad_downloads/AIRPORTS_WORLD_WIDE_NEW_201711.zip" )
        let obj2:URLDownloadModel = URLDownloadModel("IPAD_DOWNLOADS", "http://www.mygdc.com/dpubs/ipad_downloads/airac.sqlite.zip?time=1")
        let obj3:URLDownloadModel = URLDownloadModel("VECTOR_BASE_MAP","https://www.prod.mygdc.com/~download/vector_base_map2_Places2.zip")
        let obj4:URLDownloadModel = URLDownloadModel("AIRPORTS_CHARTS", "https://www.prod.mygdc.com/dpubs/ipad_downloads/AIRPORT_CHARTS_AR_NEW_201711.zip")
        
        modelArray.append(obj1)
        modelArray.append(obj2)
        modelArray.append(obj3)
        modelArray.append(obj4)
        
    }
    
    

}
