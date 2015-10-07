import libUV

class Client: UV<uv_tcp_t> {
    let request: UnsafeMutablePointer<uv_stream_t>
    var stream: UnsafeMutablePointer<uv_stream_t>!

    init(_ request: UnsafeMutablePointer<uv_stream_t>) {
        self.request = request
        super.init()

        uv_tcp_init(request.memory.loop, self.pointer)
        self.stream = UnsafeMutablePointer<uv_stream_t>(self.pointer)
    }

    func read(onRead: uv_read_cb!) {
        uv_accept(self.request, self.stream)
        uv_read_start(self.stream, Callback.onAlloc, onRead)
    }
}
