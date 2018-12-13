//
//  Changeset.swift
//  RxDataSources
//
//  Created by Krunoslav Zaher on 5/30/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

public struct Changeset<S: SectionModelType> {
    public typealias I = S.Item

    public let reloadData: Bool

    public let originalSections: [S]
    public let finalSections: [S]

    public let insertedSections: [Int]
    public let deletedSections: [Int]
    public let movedSections: [(from: Int, to: Int)]
    public let updatedSections: [Int]

    public let insertedItems: [ItemPath]
    public let deletedItems: [ItemPath]
    public let movedItems: [(from: ItemPath, to: ItemPath)]
    public let updatedItems: [ItemPath]

    init(reloadData: Bool = false,
        originalSections: [S] = [],
        finalSections: [S] = [],
        insertedSections: [Int] = [],
        deletedSections: [Int] = [],
        movedSections: [(from: Int, to: Int)] = [],
        updatedSections: [Int] = [],

        insertedItems: [ItemPath] = [],
        deletedItems: [ItemPath] = [],
        movedItems: [(from: ItemPath, to: ItemPath)] = [],
        updatedItems: [ItemPath] = []
    ) {
        self.reloadData = reloadData

        self.originalSections = originalSections
        self.finalSections = finalSections

        self.insertedSections = insertedSections
        self.deletedSections = deletedSections
        self.movedSections = movedSections
        self.updatedSections = updatedSections

        self.insertedItems = insertedItems
        self.deletedItems = deletedItems
        self.movedItems = movedItems
        self.updatedItems = updatedItems
    }

    public static func initialValue(_ sections: [S]) -> Changeset<S> {
        return Changeset<S>(
            reloadData: true,
            finalSections: sections,
            insertedSections: Array(0 ..< sections.count) as [Int]
        )
    }
}

extension ItemPath
    : CustomDebugStringConvertible {
    public var debugDescription : String {
        return "(\(sectionIndex), \(itemIndex))"
    }
}

extension Changeset
    : CustomDebugStringConvertible {

    public var debugDescription : String {
        let serializedSections = "[\n" + finalSections.map { "\($0)" }.joined(separator: ",\n") + "\n]\n"
        return " >> Final sections"
        + "   \n\(serializedSections)"
        + (!insertedSections.isEmpty || !deletedSections.isEmpty || !movedSections.isEmpty || !updatedSections.isEmpty ? "\nSections:" : "")
        + (!insertedSections.isEmpty ? "\ninsertedSections:\n\t\(insertedSections)" : "")
        + (!deletedSections.isEmpty ?  "\ndeletedSections:\n\t\(deletedSections)" : "")
        + (!movedSections.isEmpty ? "\nmovedSections:\n\t\(movedSections)" : "")
        + (!updatedSections.isEmpty ? "\nupdatesSections:\n\t\(updatedSections)" : "")
            + (!insertedItems.isEmpty || !deletedItems.isEmpty || !movedItems.isEmpty || !updatedItems.isEmpty ? "\nItems:" : "")
        + (!insertedItems.isEmpty ? "\ninsertedItems:\n\t\(insertedItems)" : "")
        + (!deletedItems.isEmpty ? "\ndeletedItems:\n\t\(deletedItems)" : "")
        + (!movedItems.isEmpty ? "\nmovedItems:\n\t\(movedItems)" : "")
        + (!updatedItems.isEmpty ? "\nupdatedItems:\n\t\(updatedItems)" : "")
    }
}
