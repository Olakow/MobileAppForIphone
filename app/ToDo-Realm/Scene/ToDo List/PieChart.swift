//
//  PieChart.swift
//  Budget-planner
//
//  Created by Aleksandra Kowalczyk on 13/06/2021.
//  Copyright © 2021 Aleksandra Kowalczyk. All rights reserved.
//

import Foundation

import UIKit
import Charts

class PieChartClass {

    
    public class func customizeChart(dataPoints: [String], values: [Double]) -> PieChartData {
      
      var dataEntries: [ChartDataEntry] = []
      for i in 0..<dataPoints.count {
        let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
        dataEntries.append(dataEntry)
      }
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
      pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
      let pieChartData = PieChartData(dataSet: pieChartDataSet)
      let format = NumberFormatter()
      format.numberStyle = .none
      let formatter = DefaultValueFormatter(formatter: format)
      pieChartData.setValueFormatter(formatter)
    
    return pieChartData
        
    }
    public class func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
    
        
        let red_color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        let green_color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        let yellow_color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        let blue_color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        let purple_color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        let pink_color = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        let dark_color = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)

        if(numbersOfColor == 2){
        colors.append(red_color)
        colors.append(green_color)
        }
        
        if(numbersOfColor == 6){
        colors.append(yellow_color)
        colors.append(blue_color)
        colors.append(purple_color)
        colors.append(green_color)
        colors.append(pink_color)
        colors.append(dark_color)
        }
  
      return colors
    }
    
    
}
