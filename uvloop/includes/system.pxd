cdef extern from "arpa/inet.h" nogil:

    int ntohl(int)
    int htonl(int)
    int ntohs(int)


cdef extern from "sys/socket.h" nogil:

    struct sockaddr:
        unsigned short sa_family
        char           sa_data[14]

    struct addrinfo:
        int            ai_flags
        int            ai_family
        int            ai_socktype
        int            ai_protocol
        size_t         ai_addrlen
        sockaddr*      ai_addr
        char*          ai_canonname
        addrinfo*      ai_next

    struct sockaddr_in:
        unsigned short sin_family
        unsigned short sin_port
        # ...

    struct sockaddr_in6:
        unsigned short sin6_family
        unsigned short sin6_port
        unsigned long  sin6_flowinfo
        # ...
        unsigned long  sin6_scope_id

    struct sockaddr_storage:
        unsigned short ss_family
        # ...

    const char *gai_strerror(int errcode)

    int socketpair(int domain, int type, int protocol, int socket_vector[2])

    ssize_t send(int sockfd, const void *buf, size_t len, int flags);

    int setsockopt(int socket, int level, int option_name,
                   const void *option_value, int option_len)


cdef extern from "errno.h" nogil:

    cdef:
        # cython.errno doesn't have EWOULDBLOCK defined.
        int EINTR
        int EAGAIN
        int EWOULDBLOCK
        int EINPROGRESS
        int EALREADY
        int ENOTSOCK
        int EBADF
        int ENOSYS
