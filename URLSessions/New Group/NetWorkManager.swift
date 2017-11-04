//
//  NetWorkManager.swift
//  URLSessions
//
//  Created by Kumar, Sravan on 04/11/17.
//  Copyright © 2017 Kumar, Sravan. All rights reserved.
//

import UIKit

protocol NetWorkManagerDelegate: class {
    //func didUpdateProgress(_ progress: CGFloat, withRemain remain: Double)
    
    /**A delegate method called each time whenever any download task's progress is updated
     */
    func downloadRequestDidUpdateProgress(_ progress: CGFloat)

    /**A delegate method called each time whenever new download task is start downloading
     */
    func downloadRequestStarted()
    /**A delegate method called each time whenever running download task is paused. If task is already paused the action will be ignored
     */
    func downloadRequestDidPaused()
    /**A delegate method called each time whenever any download task is resumed. If task is already downloading the action will be ignored
     */
    func downloadRequestDidResumed()

    /**A delegate method called each time whenever any download task is cancelled by the user
     */
    func downloadRequestCanceled()
    /**A delegate method called each time whenever any download task is finished successfully
     */
    func downloadRequestFinished(to destinationURL: URL)
    /**A delegate method called each time whenever any download task is failed due to any reason
     */
    func downloadRequestDidFailedWithError(_ error: NSError)
}

extension NetWorkManagerDelegate {
    //func didUpdateProgress(_ progress: CGFloat, withRemain remain: Double) {}
    func downloadRequestDidUpdateProgress(_ progress: CGFloat) {
        
    }
    func downloadRequestStarted() {
        
    }
    func downloadRequestDidPaused() {
        
    }
    func downloadRequestDidResumed() {
        
    }
    func downloadRequestCanceled() {
        
    }
    func downloadRequestFinished(to destinationURL: URL) {
        
    }
    func downloadRequestDidFailedWithError(_ error: NSError) {
        
    }
}

class NetWorkManager: NSObject {

    static let shared: NetWorkManager = NetWorkManager()
    var delegate: NetWorkManagerDelegate!
    
    private override init() {
        super.init()
    }
    
    lazy private var session: URLSession! = {
       
        let urlSessionConfig = URLSessionConfiguration.background(withIdentifier: "com.URLSession.backgroundSession")
        let sessionObj = URLSession(configuration: urlSessionConfig, delegate: self, delegateQueue: nil)
        return sessionObj
    }()
    
    func downloadFile(_ url: URL) {
        session.downloadTask(with: url).resume()
    }
}

extension NetWorkManager: URLSessionDelegate, URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("didFinishDownloadingTo: \(location)")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(downloadTask.countOfBytesReceived) / Float(downloadTask.countOfBytesExpectedToReceive)
        delegate.downloadRequestDidUpdateProgress(CGFloat(progress))
    }
}
