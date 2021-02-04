//
//  Lattice.swift
//  
//
//  Created by Tim Gymnich on 4.2.21.
//

/// A binary relation that is reflexive, antisymmetric, and transitive
public protocol PartialOrder {
    static func relation(_ lhs: Self, rhs: Self) -> Bool
}

/// A Join-Semilattice is a partially ordered set that defines a join operation (that is, has an
/// operation that computes the least upper bound).
public protocol JoinSemilattice: PartialOrder {
    static func join(_ lhs: Self, _ rhs: Self) -> Self
}

/// A Meet-Semilattice is a partially ordered set that defines a meet operation (that is, has an
/// operation that computes the greatest lower bound).
public protocol MeetSemilattice: PartialOrder {
    static func meet(_ lhs: Self, _ rhs: Self) -> Self
}

/// A Lattice is a partially ordered set that defines both a meet and join operation.
public protocol Lattice: JoinSemilattice, MeetSemilattice { }

/// A Bounded Join-Semilattice is a partially ordered set that defines a join operation and
/// distinguishes a least (bottom) element.
public protocol BoundedJoinSemilattice: JoinSemilattice {
    static var bottom: Self { get }
}

/// A Bounded Meet-Semilattice is a partially ordered set that defines a join operation and
/// distinguishes a greatest (top) element.
public protocol BoundedMeetSemilattice: MeetSemilattice {
    static var top: Self { get }
}

/// A Bounded Lattice is a partially ordered set that defines a both meet and join operation and
/// distinguishes both a least and greatest element.
public protocol BoundedLattice : BoundedJoinSemilattice, BoundedMeetSemilattice { }


/// A complete lattice is a partial ordering where every subset X ⊆ D has a least upper bound
public protocol CompleteLattice: BoundedLattice, Hashable {
    static func greatestLowerBound(_ x: Set<Self>) -> Self
    static func leastUpperBound(_ x: Set<Self>) -> Self
}
