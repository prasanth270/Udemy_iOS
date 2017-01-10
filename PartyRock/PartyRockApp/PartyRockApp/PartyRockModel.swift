//
//  PartyRockModel.swift
//  PartyRockApp
//
//  Created by Prasanth Ramineni on 1/8/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import Foundation

/*
 Model Class to Hold Image URL, Video URL and Video Title
 */
class PartyRockModel {
    
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    /* ---- Getters ---- */
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }
    /* ---- Getters ---- */
    
    /* Constructor */
    init(imageURL: String, videoURL: String, videoTitle: String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
    
    
}
