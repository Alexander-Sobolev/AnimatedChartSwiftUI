//
//  ContentView.swift
//  AnimatedChartSwiftUI
//
//  Created by Alexander Sobolev on 21.09.2021.
//

import SwiftUI

struct PieChart: View {
    @ObservedObject var chartDataObj = PieceOfPieContainer()
    @State private var indexOfTappedSlice = -1
    var body: some View {
        VStack {
            chartCircleView
                .frame(width: 100, height: 200)
                .onAppear() {
                    self.chartDataObj.culcOfPath()
                }
            chartListView
                .padding(8)
                .frame(width: 300, alignment: .trailing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}

extension PieChart {
    private var chartCircleView: some View {
        ZStack {
            ForEach(0..<chartDataObj.chartData.count) { index in
                Circle()
                    .trim(from: index == 0 ? 0.0 : chartDataObj.chartData[index - 1].value / 100, to: chartDataObj.chartData[index].value / 100)
                    .stroke(chartDataObj.chartData[index].color, lineWidth: 100)
                    .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                    .animation(.spring())
                
            }
        }
    }
    private var chartListView: some View {
        ForEach(0..<chartDataObj.chartData.count) { index in
            HStack {
                Text(String(format: "%2.f", Double(chartDataObj.chartData[index].percent)) + "%")
                    .onTapGesture {
                        indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                    }
                    .font(indexOfTappedSlice == index ? .headline : .subheadline)
                RoundedRectangle(cornerRadius: 3)
                    .fill(chartDataObj.chartData[index].color)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
