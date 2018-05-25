$TTL    604800
@       IN      SOA     ns1.iglu.com. admin.ns1.iglu.com. (
                              3         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
; name servers - NS records
    IN      NS      ns1.iglu.com.

; name servers - A records
ns1.iglu.com.          IN      A       172.100.0.2

; 10.113.0.0/16 - A records
