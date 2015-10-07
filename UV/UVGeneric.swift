import libUV

public class UV<CType> {
    public typealias Pointer = UnsafeMutablePointer<CType>
    public let pointer: Pointer

    public init() {
        pointer = Pointer.alloc(sizeof(CType))
    }

    public init(_ ref: Pointer) {
        pointer = ref
    }
}
