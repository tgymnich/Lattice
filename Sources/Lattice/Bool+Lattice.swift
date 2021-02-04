//
//  Bool+Lattice.swift
//  
//
//  Created by Tim Gymnich on 4.2.21.
//

import Foundation

extension Bool: PartialOrder {
    public static func relation(_ lhs: Bool, rhs: Bool) -> Bool {
        return (lhs ? 1 : 0) <= (rhs ? 1: 0)
    }
}

extension Bool: JoinSemilattice {
    public static func join(_ lhs: Bool, _ rhs: Bool) -> Bool {
        return lhs || rhs
    }
}

extension Bool : MeetSemilattice {
    public static func meet(_ lhs: Bool, _ rhs: Bool) -> Bool {
        return lhs && rhs
    }
}

extension Bool : Lattice { }

extension Bool : BoundedJoinSemilattice {
    static public var bottom: Bool { false }
}

extension Bool : BoundedMeetSemilattice {
    public static var top: Bool { true }
}

extension Bool : BoundedLattice { }
