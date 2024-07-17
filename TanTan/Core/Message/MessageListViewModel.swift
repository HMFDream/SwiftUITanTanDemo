//
//  MessageListViewModel.swift
//  TanTan
//
//  Created by hmf on 2024/7/17.
//

import SwiftUI

@Observable class MessageListViewModel {
    var messagePreviews:[MessagePreview] = []
    
    init() {
        loadPreviewMessages() 
    }
    
    func loadPreviewMessages() {
        messagePreviews = MessagePreview.examples
    }
}
