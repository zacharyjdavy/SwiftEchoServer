import libUV
import Darwin

public class WriteRequest: UV<uv_write_t> {
    typealias Buffer = UnsafeMutablePointer<uv_buf_t>
    let buffer: Buffer

    init(_ ref: UnsafePointer<uv_buf_t>, _ bytesRead: Int) {
        self.buffer = Buffer.alloc(sizeof(uv_buf_t))
        super.init()

        self.buffer.memory = uv_buf_init(ref.memory.base, UInt32(bytesRead))
    }

    func write(stream: UnsafeMutablePointer<uv_stream_t>) {
        uv_write(self.pointer, stream, self.buffer, 1) { request, _ in free(request) }
        uv_close(UnsafeMutablePointer<uv_handle_t>(stream)) { handle in free(handle) }
    }
}

