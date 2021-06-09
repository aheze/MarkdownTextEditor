//
//  ContentView.swift
//  MarkdownTextEditor
//
//  Created by Zheng on 6/9/21.
//

import SwiftUI

struct ContentView: View {
    @State var markdownText = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Markdown")
            TextEditor(text: $markdownText)
                .frame(height: 400)
                .border(Color.blue)
            
            Text("Output")
            Text(getAttributedString(markdown: markdownText))
                .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                .border(Color.blue)
            
            Spacer()
        }
        .font(.title2)
        .padding()
    }
    
    func getAttributedString(markdown: String) -> AttributedString {
        do {
            let attributedString = try AttributedString(markdown: markdown)
            return attributedString
        } catch {
            print("Couldn't parse: \(error)")
        }
        return AttributedString("Error parsing markdown")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
