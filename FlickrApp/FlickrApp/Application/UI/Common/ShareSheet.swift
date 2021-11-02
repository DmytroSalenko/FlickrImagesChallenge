//
//  ShareSheet.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-02.
//

import Foundation
import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
  var items: [Any]
  func makeUIViewController(context: Context) -> UIActivityViewController {
    let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
    return controller
  }
  
  func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    
  }
}
