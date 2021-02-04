//
//  Int+Lattice.swift
//  
//
//  Created by Tim Gymnich on 5.2.21.
//

extension Int: PartialOrder {
    public static func relation(_ lhs: Int, rhs: Int) -> Bool {
        return lhs <= rhs
    }
}

extension Int: JoinSemilattice {
    public static func join(_ lhs: Int, _ rhs: Int) -> Int {
        return Swift.max(lhs, rhs)
    }
}

extension Int: MeetSemilattice {
    public static func meet(_ lhs: Int, _ rhs: Int) -> Int {
        return Swift.min(lhs, rhs)
    }
}

extension Int: Lattice { }

extension Int: BoundedJoinSemilattice {
    public static var bottom: Int { Int.min }
}

extension Int: BoundedMeetSemilattice {
    public static var top: Int { Int.max }
}

/// **Theorem:** Finite lattices are complete
extension Int: CompleteLattice {
    public static func greatestLowerBound(_ x: Set<Int>) -> Int {
        return x.reduce(bottom) { (acc, element) in
            join(acc, element)
        }
    }

    public static func leastUpperBound(_ x: Set<Int>) -> Int {
        return x.reduce(top) { (acc, element) in
            meet(acc, element)
        }
    }
}
