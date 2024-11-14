//
//  contractWidgetLiveActivity.swift
//  contractWidget
//
//  Created by Leen Almejarri on 20/04/1446 AH.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct contractWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct contractWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: contractWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension contractWidgetAttributes {
    fileprivate static var preview: contractWidgetAttributes {
        contractWidgetAttributes(name: "World")
    }
}

extension contractWidgetAttributes.ContentState {
    fileprivate static var smiley: contractWidgetAttributes.ContentState {
        contractWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: contractWidgetAttributes.ContentState {
         contractWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: contractWidgetAttributes.preview) {
   contractWidgetLiveActivity()
} contentStates: {
    contractWidgetAttributes.ContentState.smiley
    contractWidgetAttributes.ContentState.starEyes
}
