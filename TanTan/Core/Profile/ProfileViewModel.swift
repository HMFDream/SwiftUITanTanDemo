//
//  ProfileViewModel.swift
//  TanTan
//
//  Created by hmf on 2024/7/17.
//

import SwiftUI
import PhotosUI

@Observable final class ProfileViewModel {
    var selectedImage:UIImage? = nil
    var imageSelection:PhotosPickerItem? = nil {
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    
    func setImage(from imageSelection:PhotosPickerItem?) {
        guard let imageSelection else { return }
        Task {
            if let data = try?await imageSelection.loadTransferable(type: Data.self) {
                if let uiimage = UIImage(data: data) {
                    selectedImage = uiimage
                    
                }
            }
        }
         
    }
}
