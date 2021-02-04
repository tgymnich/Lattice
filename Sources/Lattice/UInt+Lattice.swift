//
//  UInt+Lattice.swift
//  
//
//  Created by Tim Gymnich on 5.2.21.
//

extension UInt: PartialOrder {
    public static func relation(_ lhs: UInt, rhs: UInt) -> Bool {
        return lhs <= rhs
    }
}

extension UInt: JoinSemilattice {
    public static func join(_ lhs: UInt, _ rhs: UInt) -> UInt {
        return Swift.max(lhs, rhs)
    }
}

extension UInt: MeetSemilattice {
    public static func meet(_ lhs: UInt, _ rhs: UInt) -> UInt {
        return Swift.min(lhs, rhs)
    }
}

extension UInt: Lattice { }

extension UInt: BoundedJoinSemilattice {
    public static var bottom: UInt { 0 }
}

extension UInt: BoundedMeetSemilattice {
    public static var top: UInt { UInt.max }
}

/// **Theorem:** Finite lattices are complete
extension UInt: CompleteLattice {
    public static func greatestLowerBound(_ x: Set<UInt>) -> UInt {
        return x.reduce(bottom) { (acc, element) in
            join(acc, element)
        }
    }

    public static func leastUpperBound(_ x: Set<UInt>) -> UInt {
        return x.reduce(top) { (acc, element) in
            meet(acc, element)
        }
    }
}
