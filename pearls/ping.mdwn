Tests whether a particular host is reachable, or the speed of a network
connection.

* `ping host` - Repeatedly sends an ICMP ECHO_REQUEST request to hostname
`host`. For example, `ping google.com` may display:

        PING google.com (209.85.171.100) 56(84) bytes of data.
        64 bytes from cg-in-f100.google.com (209.85.171.100): icmp_seq=1 ttl=235 time=196 ms
        64 bytes from cg-in-f100.google.com (209.85.171.100): icmp_seq=2 ttl=235 time=192 ms
        64 bytes from cg-in-f100.google.com (209.85.171.100): icmp_seq=3 ttl=235 time=193 ms
        64 bytes from cg-in-f100.google.com (209.85.171.100): icmp_seq=4 ttl=235 time=192 ms
        ^C
        --- google.com ping statistics ---
        5 packets transmitted, 4 received, 20% packet loss, time 4005ms
        rtt min/avg/max/mdev = 192.101/193.581/196.030/1.573 ms

 * The first line indicates that 'google.com' resolves to the IP address
209.85.171.100.
 * Line two to five describe four pings to the aforementioned IP address. The
"time=" text at the end of each these lines describes how many milliseconds it
"took for the request to reach Google, then return to the user. 
 * The program will run repeatedly until stopped with `<ctrl>+<c>`. The '^C'
on the sixth line above indicates when the program was stopped.
 * After being terminated, aggregate statistics are printed.
 * In this example, five packets were sent to Google, but only four were
received by us. This translates to 20% of the packets being 'lost'.
 * The last line displays *r*ound *t*rip *t*ime (RTT) statistics, reporting that the
shortest RTT was 192.101 milliseconds, the average was 193.581 milliseconds,
the longest was 196.030 milliseconds, and the standard deviation was 1.573
milliseconds.

* `<ctrl>+</>` displays the aggregate statistics without terminating the
program. 
