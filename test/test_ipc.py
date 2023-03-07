from cppipc_python import Dog, ShareMemClient, ShareMemServer
import time, threading

server = ShareMemServer("qq", True)
client = ShareMemClient("qq", True)


# import numpy as np

# server = UdpServer(ip_port, obj='pickle')
# client = UdpTargetedClient(ip_port, obj='pickle')

def server_fn():
    data = server.wait_next_dgram()
    server.reply("np.array([4,5,6])")

def client_fn():
    rep = client.send_and_wait_reply("np.array([1,2,3])")
    pass


thread_hi = threading.Thread(target=server_fn)
thread_hello = threading.Thread(target=client_fn)
# 启动线程
print('thread_hi.start()')
thread_hi.start()

print('thread_hello.start()')
thread_hello.start()
# python test/test_ipc.py 
input('')