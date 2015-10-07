import libUV
import Darwin

struct Address {
    class IP4: UV<sockaddr_in> {
        let tcp: UnsafeMutablePointer<uv_tcp_t>

        init(_ port: Int, _ tcp: UnsafeMutablePointer<uv_tcp_t>) {
            self.tcp = tcp
            super.init()

            uv_ip4_addr("0.0.0.0", Int32(port), self.pointer)
            uv_tcp_bind(self.tcp, UnsafePointer<sockaddr>(self.pointer), UInt32(AF_INET))
        }

        func listen(handle: uv_connection_cb!) {
            uv_listen(UnsafeMutablePointer<uv_stream_t>(self.tcp), SOMAXCONN, handle)
        }
    }
}
