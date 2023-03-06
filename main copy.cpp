
#include <signal.h>

#include <iostream>
#include <string>
#include <thread>
#include <chrono>
#include <atomic>

#include "libipc/ipc.h"


class ShareMemServer
{
public:
    std::string server_listen_channel; 
    std::string client_listen_channel; 
    std::atomic<bool> is_quit__ {false};
    
    ipc::channel *ipc__ = nullptr;
    ipc::channel *ipc__2 = nullptr;
    static void signalHandler(int signal) {
        std::cout << "Caught signal " << signal << std::endl;
    }

    ShareMemServer(std::string channel) { // Constructor with parameters
        server_listen_channel = channel + "-server";
        client_listen_channel = channel + "-client";

        signal(SIGINT, ShareMemServer::signalHandler);


        ipc::channel ipc {server_listen_channel.c_str(), ipc::sender};
        ipc__ = &ipc;

        ipc::channel ipc2 {client_listen_channel.c_str(), ipc::receiver};
        ipc__2 = &ipc2;
    }

public:
    void wait_next_dgram() 
    {

        while (!is_quit__.load(std::memory_order_acquire)) 
        {
            ipc::buff_t recv;
            recv = ipc__->recv();
            std::string dat { recv.get<char const *>(), recv.size() - 1 };
            std::cout << "recv size: " << recv.size() << "\n";
            // std::cout << recv << "\n";
        }

    }

    void reply_last_client() {
    }

};

class ShareMemClient
{
public:
    std::string server_listen_channel; 
    std::string client_listen_channel; 
    std::atomic<bool> is_quit__ {false};
    
    ipc::channel *ipc__ = nullptr;
    ipc::channel *ipc__2 = nullptr;
    static void signalHandler(int signal) {
        std::cout << "Caught signal " << signal << std::endl;
    }
    ShareMemClient(std::string channel) { // Constructor with parameters
        server_listen_channel = channel + "-server";
        client_listen_channel = channel + "-client";



        ipc::channel ipc {server_listen_channel.c_str(), ipc::sender};
        ipc__ = &ipc;

        ipc::channel ipc2 {client_listen_channel.c_str(), ipc::receiver};
        ipc__2 = &ipc2;
        
        signal(SIGINT, ShareMemClient::signalHandler);
    }

public:
    void send_dgram_to_target(std::string buffer) 
    {
        std::cout << "send size: " << buffer.size() + 1 << "\n";
        ipc__->send(buffer, 0/*tm*/);
    }

    void send_and_wait_reply() {
    }

};



namespace {

std::atomic<bool> is_quit__ {false};
ipc::channel *ipc__ = nullptr;

void do_send(int size, int interval) {
    ipc::channel ipc {"ipc", ipc::sender};
    ipc__ = &ipc;
    std::string buffer(size, 'A');
    while (!is_quit__.load(std::memory_order_acquire)) {
        std::cout << "send size: " << buffer.size() + 1 << "\n";
        ipc.send(buffer, 0/*tm*/);
        std::this_thread::sleep_for(std::chrono::milliseconds(interval));
    }
}

void do_recv(int interval) {
    ipc::channel ipc {"ipc", ipc::receiver};
    ipc__ = &ipc;
    while (!is_quit__.load(std::memory_order_acquire)) {
        ipc::buff_t recv;
        recv = ipc__->recv();
        std::string dat { recv.get<char const *>(), recv.size() - 1 };
        std::cout << "recv size: " << recv.size() << dat << "\n";
    }
}

} // namespace

int main(int argc, char ** argv) {
    if (argc < 3) return -1;

    auto exit = [](int) {
        is_quit__.store(true, std::memory_order_release);
        if (ipc__ != nullptr) ipc__->disconnect();
    };
    ::signal(SIGINT  , exit);
    ::signal(SIGABRT , exit);
    ::signal(SIGSEGV , exit);
    ::signal(SIGTERM , exit);
#if defined(WIN64) || defined(_WIN64) || defined(__WIN64__) || \
    defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__) || \
    defined(WINCE) || defined(_WIN32_WCE)
    ::signal(SIGBREAK, exit);
#else
    ::signal(SIGHUP  , exit);
#endif

    std::string mode {argv[1]};
    if (mode == "send") {
        if (argc < 4) return -1;
        do_send(std::stoi(argv[2]) /*size*/, 
                std::stoi(argv[3]) /*interval*/);
    } else if (mode == "recv") {
        do_recv(std::stoi(argv[2]) /*interval*/);
    }
    return 0;
}
