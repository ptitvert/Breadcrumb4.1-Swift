//
//  GenericArithmetic.swift
//  OOPUtils
//  Adapted to Swift 1.2 beta2 on 2015/2/24.
//
//  Created by OOPer in cooperation with shlab.jp, on 2015/1/12.
//
//
/*
Copyright (c) 2015, OOPer(NAGATA, Atsuyuki)
All rights reserved.

Use of any parts(functions, classes or any other program language components)
of this file is permitted with no restrictions, unless you
redistribute or use this file in its entirety without modification.
In this case, providing any sort of warranties or not is the user's responsibility.

Redistribution and use in source and/or binary forms, without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import CoreGraphics

protocol ArithmeticType: Comparable {
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func %(lhs: Self, rhs: Self) -> Self
    
    prefix func ++ (inout val: Self) -> Self
    prefix func -- (inout val: Self) -> Self
    postfix func ++ (inout val: Self) -> Self
    postfix func -- (inout val: Self) -> Self
}
protocol IntegerInitializable: IntegerLiteralConvertible {
    init(_: Int)
    init(_: UInt)
    init(_: Int8)
    init(_: UInt8)
    init(_: Int16)
    init(_: UInt16)
    init(_: Int32)
    init(_: UInt32)
    init(_: Int64)
    init(_: UInt64)
}
protocol IntegerArithmeticType: IntegerInitializable, ArithmeticType {
    func &+(lhs: Self, rhs: Self) -> Self
    func &-(lhs: Self, rhs: Self) -> Self
    //    func &/(lhs: Self, rhs: Self) -> Self
    func &*(lhs: Self, rhs: Self) -> Self
    //    func &%(lhs: Self, rhs: Self) -> Self
    
    func << (lhs: Self, rhs: Self) -> Self
    func >> (lhs: Self, rhs: Self) -> Self
}
protocol SignedIntegerArithmeticType: IntegerArithmeticType, SignedNumberType {}
protocol FloatInitializable: FloatLiteralConvertible, IntegerInitializable {
    init(_: Float)
    init(_: Double)
    init(_: CGFloat)
}
protocol FloatArithmeticType: FloatInitializable, ArithmeticType, AbsoluteValuable {}

extension UInt: IntegerArithmeticType {}
extension UInt8: IntegerArithmeticType {}
extension UInt16: IntegerArithmeticType {}
extension UInt32: IntegerArithmeticType {}
extension UInt64: IntegerArithmeticType {}
extension Int: SignedIntegerArithmeticType {}
extension Int8: SignedIntegerArithmeticType {}
extension Int16: SignedIntegerArithmeticType {}
extension Int32: SignedIntegerArithmeticType {}
extension Int64: SignedIntegerArithmeticType {}
extension Float: FloatArithmeticType {}
extension Double: FloatArithmeticType {}
extension CGFloat: FloatArithmeticType {
    init(_ val: CGFloat) {
        self = val
    }
}
