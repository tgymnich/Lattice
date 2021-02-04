//
//  File.swift
//  
//
//  Created by Tim Gymnich on 4.2.21.
//

public enum ABC: Hashable {
    case a
    case b
    case c
}

extension Set: PartialOrder where Element == ABC {
    public static func relation(_ lhs: Set<ABC>, rhs: Set<ABC>) -> Bool {
        return lhs.isSuperset(of: rhs)
    }
}

extension Set: JoinSemilattice where Element == ABC {
    public static func join(_ lhs: Set<ABC>, _ rhs: Set<ABC>) -> Set<ABC> {
        return lhs.union(rhs)
    }
}

extension Set: MeetSemilattice where Element == ABC {
    public static func meet(_ lhs: Set<ABC>, _ rhs: Set<ABC>) -> Set<ABC> {
        return lhs.intersection(rhs)
    }
}

extension Set: Lattice where Element == ABC { }

extension Set: BoundedJoinSemilattice where Element == ABC {
    public static var bottom: Set<ABC> = []
}

extension Set: BoundedMeetSemilattice where Element == ABC {
    public static var top: Set<ABC> = [.a, .b, .c]
}

extension Set: BoundedLattice where Element == ABC { }

extension Set: CompleteLattice where Element == ABC {
    public static func greatestLowerBound(_ x: Set<Set<ABC>>) -> Set<ABC> {
        return x.reduce(bottom) { (acc, element) in
            join(acc, element)
        }
    }

    public static func leastUpperBound(_ x: Set<Set<ABC>>) -> Set<ABC> {
        return x.reduce(top) { (acc, element) in
            meet(acc, element)
        }
    }
}
