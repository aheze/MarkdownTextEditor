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
        HStack {
            VStack {
                Text("Markdown")
                    .fontWeight(.bold)
                
                TextEditor(text: $markdownText)
                    .frame(width: 400)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(16)
                    .padding(.bottom, 16)
            }
            
            VStack {
                Text("Output")
                    .fontWeight(.bold)
                
                Text(getAttributedString(markdownText))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(16)
                    .padding(.bottom, 16)
            }
        }
        .font(.title2)
        .padding()
    }
    
    func getAttributedString(_ markdown: String) -> AttributedString {
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
