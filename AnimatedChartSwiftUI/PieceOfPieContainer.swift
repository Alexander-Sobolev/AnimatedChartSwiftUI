//
//  PieceOfPieContainer.swift
//  AnimatedChartSwiftUI
//
//  Created by Alexander Sobolev on 21.09.2021.
//

import Foundation
import SwiftUI

class PieceOfPieContainer: ObservableObject {
    @Published var chartData = [
        PieceOfPie(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), percent: 8, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), percent: 32, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), percent: 45, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), percent: 15, value: 0)
    ]
    
    func culcOfPath() {
        var value: CGFloat = 0
        
        for index in 0..<chartData.count {
            value += chartData[index].percent
            chartData[index].value = value
        }
    }
}
