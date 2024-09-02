//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Анна Белова on 01.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...1)
    @State private var greenSliderValue = Double.random(in: 0...1)
    @State private var blueSliderValue = Double.random(in: 0...1)
   
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack {
                ColoredRectangleView(redSliderValue: redSliderValue, greenSliderValue: greenSliderValue, blueSliderValue: blueSliderValue)
                    .padding(.bottom, 30)
                SliderView(sliderValue: $redSliderValue, color: Color.red)
                SliderView(sliderValue: $greenSliderValue, color: Color.green)
                SliderView(sliderValue: $blueSliderValue, color: Color.blue)
                
            }
            .padding(.bottom, 400)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct ColoredRectangleView: View {
    var redSliderValue: Double
    var greenSliderValue: Double
    var blueSliderValue: Double

    var body: some View {
       RoundedRectangle(cornerRadius: 20)
            .frame(width: 350, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
            .foregroundStyle(Color(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue))
           
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var color: Color
    
    var body: some View {
        HStack {
            Text(String(format:"%.2f", sliderValue))
                .foregroundStyle(.white)
            Slider(value: $sliderValue, in: 0...1, step: 0.1)
                .tint(color)
        }
        
    }
}
