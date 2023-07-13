//
//  AppIntent.swift
//  WidgetExtension
//
//  Created by Johnny on 2023/7/13.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    @Parameter(title: "Bus Stop", size: 3)
    var busStop: [BusStop]
}

struct BusStop: AppEntity {
    static var defaultQuery: BusStopQuery = BusStopQuery()

    var id: String = UUID().uuidString
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = .init(name: "Bus Stop")
    
    var displayRepresentation: DisplayRepresentation = DisplayRepresentation(title: "\(UUID().uuidString)")
}

struct BusStopQuery: EntityQuery {
    func entities(for identifiers: [BusStop.ID]) async throws -> [BusStop] {
        [BusStop(), BusStop(), BusStop()]
     }
     
     func suggestedEntities() async throws -> [BusStop] {
         [BusStop(), BusStop(), BusStop()]
     }
     
     func defaultResult() async -> BusStop? {
         BusStop()
     }
}
