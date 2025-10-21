//
//  IterableEmbeddedViewWrapper.swift
//  saTechChallenge
//  Created by Alejandra Perez on 10/19/25.
//
import SwiftUI
import IterableSDK

struct IterableEmbeddedViewWrapper: UIViewRepresentable {
    let embeddedMessage: IterableEmbeddedMessage
    let viewType: IterableEmbeddedViewType
    
    func makeUIView(context: Context) -> IterableEmbeddedView {
        let config = IterableEmbeddedViewConfig(
            backgroundColor: UIColor.white,
            borderColor: UIColor.purple,
            borderWidth: 1.0,
            borderCornerRadius: 8.0,
            primaryBtnBackgroundColor: UIColor.purple,
            primaryBtnTextColor: UIColor.white,
            secondaryBtnBackgroundColor: UIColor.white,
            secondaryBtnTextColor: UIColor.purple,
            titleTextColor: UIColor.black,
            bodyTextColor: UIColor.black
        )
        
        let embeddedView = IterableEmbeddedView(
            message: embeddedMessage,
            viewType: viewType,
            config: config
        )
        
        return embeddedView
    }
    
    func updateUIView(_ uiView: IterableEmbeddedView, context: Context) {
     
    }
}

