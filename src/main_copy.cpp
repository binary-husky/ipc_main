
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
    
    ipc::channel *server_listen_ipc = nullptr;
    ipc::channel *client_listen_ipc = nullptr;
    bool debug = true;


    ShareMemServer(std::string channel, bool debug_network) { // Constructor with parameters
        debug = debug_network;
        server_listen_channel = channel + "-server";
        client_listen_channel = channel + "-client";
        if (debug) 
        {
            std::cout << "server_listen_channel: " << server_listen_channel << std::endl;
            std::cout << "client_listen_channel: " << client_listen_channel << std::endl;
        }
        server_listen_ipc = new ipc::channel {server_listen_channel.c_str(), ipc::receiver};
        client_listen_ipc = new ipc::channel {client_listen_channel.c_str(), ipc::sender};
    }
    ~ShareMemServer() {
        server_listen_ipc->disconnect();
        client_listen_ipc->disconnect();
        if (debug) 
        {
            std::cout << "server_listen_ipc->disconnect(); " << std::endl;
            std::cout << "client_listen_ipc->disconnect(); " << std::endl;
        }
    }
public:
    std::string wait_next_dgram() 
    {
        if (debug) 
        {
            std::cout << "wait_next_dgram" << std::endl;
        }
        ipc::buff_t recv = server_listen_ipc->recv();
        std::string dat { recv.get<char const *>(), recv.size() - 1 };
        if (debug) 
        {
            std::cout << "[wait_next_dgram] get data" << dat << std::endl;
        }
        return dat;
    }

    void reply(std::string reply_buffer) {
        if (debug) 
        {
            std::cout << "reply sending: " << reply_buffer << std::endl;
        }
        bool success = client_listen_ipc->try_send(reply_buffer, 0/*tm*/);
        if (debug) 
        {
            std::cout << "reply success?" << success << std::endl;
        }

    }

};

class ShareMemClient
{
public:
    std::string server_listen_channel; 
    std::string client_listen_channel; 
    std::atomic<bool> is_quit__ {false};
    
    ipc::channel *server_listen_ipc = nullptr;
    ipc::channel *client_listen_ipc = nullptr;
    bool debug = true;


    ShareMemClient(std::string channel, bool debug_network) { // Constructor with parameters
        debug = debug_network;
        server_listen_channel = channel + "-server";
        client_listen_channel = channel + "-client";
        if (debug) 
        {
            std::cout << "server_listen_channel: " << server_listen_channel << std::endl;
            std::cout << "client_listen_channel: " << client_listen_channel << std::endl;
        }
        server_listen_ipc = new ipc::channel {server_listen_channel.c_str(), ipc::sender};
        client_listen_ipc = new ipc::channel {client_listen_channel.c_str(), ipc::receiver};
    }
    ~ShareMemClient() {
        server_listen_ipc->disconnect();
        client_listen_ipc->disconnect();
        if (debug) 
        {
            std::cout << "server_listen_ipc->disconnect(); " << std::endl;
            std::cout << "client_listen_ipc->disconnect(); " << std::endl;
        }
    }
    void send_dgram_to_target(std::string buffer) 
    {
        if (debug) 
        {
            std::cout << "sending: " << buffer << std::endl;
        }
        bool success = server_listen_ipc->try_send(buffer, 0/*tm*/);
        if (debug) 
        {
            std::cout << "success?" << success << std::endl;
        }
    }

    std::string  send_and_wait_reply(std::string buffer) {
        // send
        if (debug) 
        {
            std::cout << "sending: " << buffer << std::endl;
        }
        bool success = server_listen_ipc->try_send(buffer, 0/*tm*/);
        if (debug) 
        {
            std::cout << "success?" << success << std::endl;
        }

        // wait_reply
        if (debug) 
        {
            std::cout << "send_and_wait_reply" << std::endl;
        }
        ipc::buff_t recv = client_listen_ipc->recv();
        std::string dat { recv.get<char const *>(), recv.size() - 1 };
        if (debug) 
        {
            std::cout << "[send_and_wait_reply] get data" << dat << std::endl;
        }
        return dat;
    }

};


std::atomic<bool> is_quit__ {false};

int main(int argc, char ** argv) {
    if (argc < 3) return -1;

    std::string mode {argv[1]};



    if (mode == "client") 
    {

        auto exit = [](int) {
            is_quit__.store(true, std::memory_order_release);
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


        std::string channel = "debug2";
        ShareMemClient client(channel, true);
        
        if (client.server_listen_ipc){
            std::cout << "ok ";
        }
        int cnt = 0;
        while (!is_quit__.load(std::memory_order_acquire))
        {
            cnt ++;

            std::string input;
            std::cout << "Enter a line of text: ";
            std::getline(std::cin, input);
            std::cout << "You entered: " << input << std::endl;
            auto reply = client.send_and_wait_reply(input);
            std::cout << "server reply: " << reply << std::endl;
            
            // client.send_dgram_to_target("Current Cnt:" + std::to_string(cnt));
            // std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }
    } 
    else if (mode == "server") 
    {

        std::string channel("debug2");
        ShareMemServer server(channel, true);
        while (!is_quit__.load(std::memory_order_acquire))
        {
            std::string get = server.wait_next_dgram();
            server.reply(get);
        }

    }
    return 0;
}
