//
//  Ext+String.swift
//  StackOverflowQuestion
//
//  Created by Agung Dwi Saputra on 18/11/23.
//

import Down
import UIKit

extension String {
    
    func attributedStringFromMarkdown(markdownString: String) -> NSAttributedString? {
        do {
            let down = Down(markdownString: markdownString)
            let attributedString = try down.toAttributedString()
            return attributedString
        } catch {
            print("Error converting Markdown to attributed string: \(error)")
            return nil
        }
    }

    
}
