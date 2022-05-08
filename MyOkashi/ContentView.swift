//
//  ContentView.swift
//  MyOkashi
//
//  Created by 児島　陸斗 on 2022/05/08.
//

import SwiftUI

struct ContentView: View {
    @StateObject var okashiDataList = OkashiData()
    @State var inputText = ""

    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText,
                      prompt: Text("キーワードを入力してください"))
            .onSubmit {
                Task {
                    await okashiDataList.searchOkashi(keyword: inputText)
                }
            }
            .submitLabel(.search)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
