//
//  CustomTableViewCell.swift
//  URLSessions
//
//  Created by Kumar, Sravan on 31/10/17.
//  Copyright © 2017 Kumar, Sravan. All rights reserved.
//

import UIKit

protocol CustomTableViewCellProtocol {
    func tableViewCell(_ customCell: CustomTableViewCell, _ didTapDownloadButton: UIButton)
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var urlLbl: UILabel!
    @IBOutlet private weak var downloadButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var PauseBtn: UIButton!
    @IBOutlet weak var resumeBtn: UIButton!
    
    
    var modelObj: (String, String)!
    var delegate: CustomTableViewCellProtocol?
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(model:URLDownloadModel) {
        let data = model.fetchValues
        modelObj = data
        self.titleLbl.text = data.0
        self.urlLbl.text = data.1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction private func downloadButtonTapped(_ sender: Any) {
        delegate?.tableViewCell(self, downloadButton)
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        let url = URL(string: modelObj.1)
        NetWorkManager.shared.pauseDownload(url!)
    }
    
    @IBAction func resumeButtonTapped(_ sender: Any) {
        let url = URL(string: modelObj.1)
        NetWorkManager.shared.resumeDownload(url!)
    }
    
}


