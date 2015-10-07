import libUV

public class EchoServer: UV<uv_tcp_t> {
    let loop: Loop

        public init(_ loop: Loop) {
            self.loop = loop
            super.init()

            uv_tcp_init(self.loop.pointer, self.pointer)
        }

    public func listen(port: Int) {
        Address.IP4(port, self.pointer).listen { request, _ in
            Client(request).read { client, bytesRead, buffer in
                WriteRequest(buffer, bytesRead).write(client)
            }
        }

        uv_run(self.loop.pointer, UV_RUN_DEFAULT)
    }
}
