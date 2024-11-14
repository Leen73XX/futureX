//
//  contractWidget.swift
//  contractWidget
//
//  Created by Leen Almejarri on 20/04/1446 AH.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), widgetFamily: context.family)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), widgetFamily: context.family)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let entries = [SimpleEntry(date: Date(), widgetFamily: context.family)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let widgetFamily: WidgetFamily
}

struct contractWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack{
            VStack (alignment: .center) {
                Text(entry.date, formatter: DateFormatter.monthAndDay)
                    .foregroundColor(.white)
                Image(systemName: "arrowshape.up")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(
                               LinearGradient(gradient: Gradient(colors: [
                                   Color(red: 0.18, green: 1, blue: 0.91),   // First color
                                   Color(red: 0.6, green: 0.87, blue: 0.3),   // Second color
                                   Color(red: 0.93, green: 0.69, blue: 0.26)  // Third color
                               ]), startPoint: .top, endPoint: .bottom)
                           )
                    
                Text("RECI").bold()
                   
                    .foregroundStyle(
                               LinearGradient(gradient: Gradient(colors: [
                                   Color(red: 0.18, green: 1, blue: 0.91),   // First color
                                   Color(red: 0.6, green: 0.87, blue: 0.3),   // Second color
                                   Color(red: 0.93, green: 0.69, blue: 0.26)  // Third color
                               ]), startPoint: .top, endPoint: .bottom)
                           )
                   
                
                HStack{
                    Text("+$ 639.96")
                        .foregroundColor(.green)
                  
                }
            }
           
        }
       
        .containerBackground(for: .widget) {
              Color(hex: "172918")
        }
    }
  
  
}
extension DateFormatter {
    static var monthAndDay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d" //full month name
        return formatter
    }
}

struct contractWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            contractWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}



extension Color {
    init(hex: String) {
        if hex == "green" || hex == "blue" || hex == "purple" || hex == "highlighted" {
            self.init(hex)
        } else {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
                case 3: // RGB (12-bit)
                    (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
                case 6: // RGB (24-bit)
                    (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
                case 8: // ARGB (32-bit)
                    (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
                default:
                    (a, r, g, b) = (1, 1, 1, 0)
            }
            
            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
    }
}


