//
//  ContentView.swift
//  mytimer
//
//  Created by 劉明正 on 2024/04/13.
//

import SwiftUI

class TimerModel: ObservableObject{
    var timer:Timer?
    @Published var count=0
    func timerStart(){
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in
            self.count+=1
        }
    }
}
struct ContentView: View {
    @EnvironmentObject var timer:TimerModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("count:\(timer.count)")
        }
        .padding()
        .onAppear{
            self.timer.timerStart()
        }
    }
}

#Preview {
    ContentView()
}
