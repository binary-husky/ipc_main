
#include <pybind11/pybind11.h>
#include <signal.h>
#include <iostream>
#include <string>
#include <thread>
#include <chrono>
#include <atomic>

#include "libipc/ipc.h"

namespace py = pybind11;

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
        ipc::buff_t recv;

        // listen until something is received
        // py::gil_scoped_release release;
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
    ~Animal() { 

            std::cout << "[Animal] ~Animal()" << std::endl;

    }
    virtual std::string go(int n_times) = 0;
};

class Dog : public Animal {
public:
    std::string go(int n_times) override {
        std::string result;
        for (int i=0; i<n_times; ++i)
            result += "woof! ";
        return result;
    }

};
std::string call_go(Animal *animal) {
    return animal->go(3);
}

















PYBIND11_MODULE(cppipc_python, m) {


    m.def("add", &add,  py::arg("i"), py::arg("j"), py::arg("k"));

    m.def("subtract", [](int i, int j) { return i - j; });

    py::class_<Animal>(m, "Animal")
        .def("go", &Animal::go);

    py::class_<Dog, Animal>(m, "Dog")
        .def(py::init<>());

    py::class_<ShareMemServer>(m, "ShareMemServer")
        .def(py::init([](std::string c, bool db) {
            return std::unique_ptr<ShareMemServer>(new ShareMemServer(c, db));
        }))
        .def("wait_next_dgram", &ShareMemServer::wait_next_dgram)
        .def("reply", &ShareMemServer::reply);


    py::class_<ShareMemClient>(m, "ShareMemClient")
        .def(py::init([](std::string c, bool db) {
            return std::unique_ptr<ShareMemClient>(new ShareMemClient(c, db));
        }))
        .def("send_dgram_to_target", &ShareMemClient::send_dgram_to_target)
        .def("send_and_wait_reply", &ShareMemClient::send_and_wait_reply);




#define STRINGIFY(x) #x
#define MACRO_STRINGIFY(x) STRINGIFY(x)
#ifdef VERSION_INFO
    m.attr("__version__") = MACRO_STRINGIFY(VERSION_INFO);
#else
    m.attr("__version__") = "dev";
#endif
}
