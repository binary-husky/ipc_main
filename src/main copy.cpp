
#include <pybind11/pybind11.h>
#include <signal.h>
#include <iostream>
#include <string>
#include <thread>
#include <chrono>
#include <atomic>

#include "libipc/ipc.h"

namespace py = pybind11;

#define send_tm 1000
#define recv_tm 1000


class ipc_channel_bind: public ipc::channel
{
    ipc::channel:ipc::channel
};

class ipc_route_bind: public ipc::route
{
    
};






class ShareMemServer
{
public:
    std::string server_listen_channel; 
    std::string client_listen_channel; 
    
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
        server_listen_ipc->reconnect(ipc::receiver);
        client_listen_ipc->reconnect(ipc::sender);
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
    std::string wait_next_dgram() 
    {

        ipc::buff_t recv;
        if (debug) 
        {
            std::cout << "wait_next_dgram" << std::endl;
        }


        // listen until something is received
        for (;;) {
            if (PyErr_CheckSignals() != 0)
                throw py::error_already_set();

            // fucking python GIL
            py::gil_scoped_release release;
            recv = server_listen_ipc->recv(1000);
            py::gil_scoped_acquire acquire;
            
            if (!recv.empty()){
                break;
            }
            if (debug) 
            {
                std::cout << "[server] no recv,  keep waiting" << std::endl;
            }
        }
        // py::gil_scoped_acquire acquire;

        std::string dat { recv.get<char const *>(), recv.size() - 1 };
        if (debug) 
        {
            std::cout << "[wait_next_dgram] get data" << dat << std::endl;
        }
        return dat;
    }
    void disconnect() {
        server_listen_ipc->reconnect(ipc::receiver);
        client_listen_ipc->reconnect(ipc::sender);
    }

    void reply(std::string reply_buffer) {

        bool success = false;
        while(!success){
            if (PyErr_CheckSignals() != 0)
                throw py::error_already_set();
            if (debug) 
            {
                std::cout << "reply sending: " << reply_buffer << std::endl;
            }
            py::gil_scoped_release release;
            success = client_listen_ipc->try_send(reply_buffer, send_tm/*tm*/);
            py::gil_scoped_acquire acquire;

        }

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
    
    ipc::channel *server_listen_ipc = nullptr;
    ipc::channel *client_listen_ipc = nullptr;
    bool debug = true;

    // Factory function:
    static ShareMemClient create(std::string channel, bool debug_network) 
    { 
        return ShareMemClient(channel, debug_network); 
    }

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
        server_listen_ipc->reconnect(ipc::sender);
        client_listen_ipc->reconnect(ipc::receiver);

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

        bool success = false;
        while(!success){
            if (debug) 
            {
                std::cout << "sending: " << buffer << std::endl;
            }
            py::gil_scoped_release release;
            success = server_listen_ipc->try_send(buffer, send_tm/*tm*/);
            py::gil_scoped_acquire acquire;
        }

        if (debug) 
        {
            std::cout << "success?" << success << std::endl;
        }
    }
    void disconnect() {
        server_listen_ipc->reconnect(ipc::receiver);
        client_listen_ipc->reconnect(ipc::sender);
    }

    std::string  send_and_wait_reply(std::string buffer) {
        
        // send
        bool success = false;
        while(!success){
            if (PyErr_CheckSignals() != 0)
                throw py::error_already_set();

            if (debug) 
            {
                std::cout << "sending: " << buffer << std::endl;
            }
            py::gil_scoped_release release;
            success = server_listen_ipc->try_send(buffer, send_tm/*tm*/);
            py::gil_scoped_acquire acquire;
        }


        if (debug) 
        {
            std::cout << "success?" << success << std::endl;
        }

        // wait_reply
        if (debug) 
        {
            std::cout << "send_and_wait_reply" << std::endl;
        }
        ipc::buff_t recv;

        // listen until something is received
        for (;;) {
            if (PyErr_CheckSignals() != 0)
                throw py::error_already_set();

            // fucking python GIL
            py::gil_scoped_release release;
            recv = client_listen_ipc->recv(1000);
            py::gil_scoped_acquire acquire;

            if (!recv.empty()){
                break;
            }
            if (debug) 
            {
                std::cout << "[client] no recv,  keep waiting" << std::endl;
            }
        }
        // py::gil_scoped_acquire acquire;


        std::string dat { recv.get<char const *>(), recv.size() - 1 };
        if (debug) 
        {
            std::cout << "[send_and_wait_reply] get data" << dat << std::endl;
        }
        return dat;
    }

};






















int add(int i, int j, int k) {
    return i + j + k;
}

class Animal {
public:
    int age = 0;
    ~Animal() 
    { 
        std::cout << "[Animal] ~Animal()" << std::endl;
    }
    std::string go(int n_times)
    {
        std::cout << "go" << std::endl;
        return "ok";
    }
};

// class Dog : public Animal 
// {
//     using Animal::Animal;
// };

// Dog* d = new Dog{1};
// // d->go(1)


PYBIND11_MODULE(cppipc_python, m) {


    m.def("add", &add,  py::arg("i"), py::arg("j"), py::arg("k"));

    m.def("subtract", [](int i, int j) { return i - j; });

    // py::class_<Dog>(m, "Dog")
    //     .def(py::init([](std::string c) {
    //         return std::unique_ptr<Dog>(new Dog{1});
    //     }));

    // py::class_<Dog, Animal>(m, "Dog")
    //     .def(py::init<>());

    // py::class_<ipc_channel_bind>(m, "ipc_channel_bind")
    //     .def(py::init([](std::string channel, std::string role) {
    //         // if (role=="receiver")
    //         return std::unique_ptr<ipc_channel_bind>(new ipc_channel_bind{"ewg", ipc::sender});
    //             // return std::unique_ptr<ipc_channel_bind>(
    //             //     new ipc::channel{channel.c_str(), ipc::receiver}
    //             // );
    //         // else if (role=="sender")
    //         //     return std::unique_ptr<ipc_channel_bind>(
    //         //         new ipc::channel{channel.c_str(), ipc::sender}
    //         //     );
    //     }));

    // py::class_<ipc_channel_bind>(m, "ipc_channel_bind")
    //     .def(py::init([](std::string c, bool db) {
    //         auto t = new ipc_channel_bind{c.c_str(), ipc::sender};
    //         return t;
    //     }));


    py::class_<ShareMemServer>(m, "ShareMemServer")
        .def(py::init([](std::string c, bool db) {
            return std::unique_ptr<ShareMemServer>(new ShareMemServer(c, db));
        }))
        .def("wait_next_dgram", &ShareMemServer::wait_next_dgram)
        .def("disconnect", &ShareMemServer::disconnect)
        .def("reply", &ShareMemServer::reply);


    py::class_<ShareMemClient>(m, "ShareMemClient")
        .def(py::init([](std::string c, bool db) {
            return std::unique_ptr<ShareMemClient>(new ShareMemClient(c, db));
        }))
        .def("send_dgram_to_target", &ShareMemClient::send_dgram_to_target)
        .def("disconnect", &ShareMemClient::disconnect)
        .def("send_and_wait_reply", &ShareMemClient::send_and_wait_reply);




#define STRINGIFY(x) #x
#define MACRO_STRINGIFY(x) STRINGIFY(x)
#ifdef VERSION_INFO
    m.attr("__version__") = MACRO_STRINGIFY(VERSION_INFO);
#else
    m.attr("__version__") = "dev";
#endif
}
