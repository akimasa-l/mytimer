//
//  ContentView.swift
//  mytimer
//
//  Created by 劉明正 on 2024/04/13.
//

import SwiftUI
import CoreMotion

class TimerModel: ObservableObject{
    var timer:Timer?
    var motionManager = CMMotionManager()
    @Published var count=0
    @Published var x=0.0
    @Published var y=0.0
    @Published var z=0.0
    func timerStart(){
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in
            self.count+=1
        }
        if motionManager.isDeviceMotionAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: .main){
                (data,error) in
                guard let data else{return}
                self.x=data.acceleration.x
                self.y=data.acceleration.y
                self.z=data.acceleration.z
            }
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
            Text("x:\(timer.x)")
            Text("y:\(timer.y)")
            Text("z:\(timer.z)")
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
