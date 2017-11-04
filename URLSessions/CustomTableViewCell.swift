//
//  CustomTableViewCell.swift
//  URLSessions
//
//  Created by Kumar, Sravan on 31/10/17.
//  Copyright © 2017 Kumar, Sravan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(model:URLDownloadModel)
     {
        let data = model.fetchValues
        self.titleLbl.text = data.0
        self.urlLbl.text = data.1
       // self.titleLbl.text = model.fileTitle
      //  self.urlLbl.text  = model.fileURL
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        
        print("Download buttn Tapped")
    }
    
    
//    @IBAction fileprivate func downloadButtonTapped(_ sender: Any)
//    
//    {
//     
//        print("download button tapped")
//        
//    }
}
