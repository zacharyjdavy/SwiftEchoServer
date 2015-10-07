import libUV

struct Callback {
    static var onAlloc: uv_alloc_cb! = { (_, size, buffer) in
        buffer.memory = uv_buf_init(UnsafeMutablePointer.alloc(size), UInt32(size))
    }
}
