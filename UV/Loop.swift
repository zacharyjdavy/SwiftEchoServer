import libUV

public class Loop : UV<uv_loop_t> {
    public static let defaultLoop: Loop = Loop(uv_default_loop())

    public override init(_ ref: Pointer) {
        super.init(ref)
    }
}
