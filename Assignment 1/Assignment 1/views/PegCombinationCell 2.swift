//
//  PegCombinationCell.swift
//
//  Assignment 1 - COMP228
//  Ali Abod
//  ID: 201267800
//
//  Created by Ali Abod on 04/11/2019.
//  Copyright © 2019 Ali Abod. All rights reserved.
//

import Foundation
import UIKit

class PegCombinationCell: UITableViewCell {
    var pegCombination : PegCombination!
    
    @IBOutlet weak var APegImageView: UIImageView!
    @IBOutlet weak var BPegImageView: UIImageView!
    @IBOutlet weak var CPegImageView: UIImageView!
    @IBOutlet weak var DPegImageView: UIImageView!
    
    @IBOutlet weak var blobCombination: BlobCombination!

    // setup of table view cell for each input
    func setupCell(pegCombination: PegCombination) {
        // set respective ImageViews to each peg's image
        APegImageView.image = pegCombination.APeg.image
        BPegImageView.image = pegCombination.BPeg.image
        CPegImageView.image = pegCombination.CPeg.image
        DPegImageView.image = pegCombination.DPeg.image
        
        // set blob ImageViews to nil
        blobCombination.arrayBolbs.forEach({$0.image = #imageLiteral(resourceName: "empty")})
        
        let whiteBlobAmount = pegCombination.whiteBlob
        let blackBlobAmount = pegCombination.blackBlob
        var whiteIndexStartPoint = 0
        guard (blackBlobAmount + whiteBlobAmount) <= 4 else { return }
        // append the number of black/white blobs to the ImageView array (see below class BlobCombination)
        for index in 0..<blackBlobAmount {
            blobCombination.arrayBolbs[index].image = #imageLiteral(resourceName: "black blob")
            whiteIndexStartPoint = index + 1
        }
        for index in 0..<whiteBlobAmount {
            blobCombination.arrayBolbs[index + whiteIndexStartPoint].image = #imageLiteral(resourceName: "white blob")
        }
    }
    
}

class BlobCombination: UIView {
    @IBOutlet weak var topLeftBlob: UIImageView!
    @IBOutlet weak var topRightBlob: UIImageView!
    @IBOutlet weak var bottomLeftBlob: UIImageView!
    @IBOutlet weak var bottomRightBlob: UIImageView!
    var arrayBolbs: [UIImageView] {
            return [topLeftBlob, topRightBlob, bottomLeftBlob, bottomRightBlob]
        }
}
