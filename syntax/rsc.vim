" Vim syntax file
" Language:    RouterOS scripts
" Maintainer:  zainin
" Last Change: 2015-01-17

syntax clear
if exists("b:current_syntax")
        if b:current_syntax =~ "rsc"
                finish
        else
                unlet b:current_syntax
        endif
endif

syn case ignore

" set iskeyword=@,-,_,.
set iskeyword=A-Z,a-z,48-57,-,/,,

" comments
syn match     rscComment      /^#.*/

"syn region      rscContext      start=+/+ end=+\n+ contains=rscTopContext
" options submenus: /interface ether1 etc
syn match     rscSubMenu      "\([a-z]\)\@<!/[a-zA-Z-]*"
syn match     rscSubMenu      "\([a-z]\)\@<!/ [a-zA-Z-]*"


"syn keyword   rscContext      certificate driver file interface ip ipv6 log mpls port queue
"syn keyword   rscContext      radius routing snmp special-login store system tool user

" variables are matched by looking at strings ending with "=", e.g. var=
syn match     rscVariable     "[a-zA-Z0-9-/]*\(=\)\@="
syn match     rscVariable     "$[a-zA-Z0-9-]*"

" colored for clarity
syn match     rscDelimiter    "[,=]"
" match slash in CIDR notation (1.2.3.4/24)
syn match     rscDelimiter    "\(\d\)\@<=\/\(\d\)\@="
" dash in IP ranges
syn match     rscDelimiter    "\(\d\)\@<=-\(\d\)\@="

" match service names after "set", like in original routeros syntax
syn match     rscService      "\(set\)\@<=\s\(api-ssl\|api\|dns\|ftp\|http\|https\|pim\|ntp\|smb\|ssh\|telnet\|winbox\|www\|www-ssl\)"

" colors various interfaces
syn match     rscInterface    "bridge\d\|ether\d\|wlan\d\|pppoe-\(out\|in\)\d"

syn keyword   rscBoolean      yes no

syn keyword   rscConditional  if

" operators
syn match     rscOperator     " [\+\-\*\<\>\=\!\~\^\&\.\,] "
syn match     rscOperator     "[\<\>\!]="
syn match     rscOperator     "\(<<\|>>\)"
syn match     rscOperator     "[\+\-]\(\d\)\@="

" commands
syn keyword   rscCommands     beep delay put len typeof pick log time set find environment
syn keyword   rscCommands     terminal error parse resolve toarray tobool toid toip toip6
syn keyword   rscCommands     tonum tostr totime add remove enable disable set get print
syn keyword   rscCommands     export edit find append as-value brief detail count-only file
syn keyword   rscCommands     follow follow-only from interval terse value-list without-paging

"-----------
syn keyword   rscAction       accept add beep delay do drop execute export find get import
syn keyword   rscAction       log parse pick ping print put quit redirect redo resolve set get undo

syn keyword   rscFunction     len setup typeof
syn keyword   rscFunction     toarray tobool toid toip toip6 tonum tostr totime

syn keyword   rscKeyword      detail error file info led nothing password time

syn keyword   rscRepeat       for foreach while
syn match     rscSpecial      "[():\[\]{|}]"

syn region    rscString       start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=rscSpecial

syn keyword   rscType         global local


  "syn keyword   rscKeyword      aaa accessible-via-web accounting account-local-traffic ac-name action
  "syn keyword   rscKeyword      active-flow-timeout active-mode add-default-route ageing-time align
  "syn keyword   rscKeyword      always-from-cache area area-id arp as authenticate authoritative
  "syn keyword   rscKeyword      automatic-supout auto-negotiation autonomous auto-send-supout backup-allowed
  "syn keyword   rscKeyword      bandwidth-server baud-rate bfd bidirectional-timeout blank-interval
  "syn keyword   rscKeyword      bootp-support bridge-mode broadcast broadcast-addresses cable-settings
  "syn keyword   rscKeyword      cache-administrator cache-entries cache-hit-dscp cache-max-ttl cache-on-disk
  "syn keyword   rscKeyword      cache-size chain channel channel-time check-interval cipher client
  "syn keyword   rscKeyword      client-to-client-reflection comment community config connection addresses
  "syn keyword   rscKeyword      connection-bytes connection-idle-timeout connection-state console contact
  "syn keyword   rscKeyword      contrast cpu customer data-bits default default-ap-tx-limit default-client-tx-limit
  "syn keyword   rscKeyword      default-forwarding default-group default-profile default-route-distance
  "syn keyword   rscKeyword      dhcp-client dhcp-option dhcp-server dh-group dial-on-demand directory disabled
  "syn keyword   rscKeyword      disable-running-check discovery disk-file-count disk-file-name
  "syn keyword   rscKeyword      disk-lines-per-file disk-stop-on-full display-time distance distribute-default
  "syn keyword   rscKeyword      distribute-for-default-route domain dpd-interval dpd-maximum-failures
  "syn keyword   rscKeyword      dynamic-label-range eap-methods e-mail enabled enc-algorithm enc-algorithms
  "syn keyword   rscKeyword      encryption-password encryption-protocol engine-id exchange-mode exclude-groups
  "syn keyword   rscKeyword      file-limit file-name filter filter-port filter-stream firewall firmware
  "syn keyword   rscKeyword      flow-control forward-delay frame-size frames-per-second from full-duplex
  "syn keyword   rscKeyword      garbage-timer gateway gateway-class gateway-keepalive gateway-selection
  "syn keyword   rscKeyword      generate-policy generic-timeout gps graphing group group-ciphers
  "syn keyword   rscKeyword      group-key-update hardware hash-algorithm health hide-ssid hop-limit hotspot
  "syn keyword   rscKeyword      hotspot-address html-directory http-cookie-lifetime http-proxy icmp-timeout
  "syn keyword   rscKeyword      identity idle-timeout igmp-proxy ignore-as-path-len inactive-flow-timeout
  "syn keyword   rscKeyword      incoming in-filter in-interface instance interface interfaces interim-update
  "syn keyword   rscKeyword      interval ipsec-protocols irq jump-target keepalive-timeout keep-max-sms
  "syn keyword   rscKeyword      kind latency-distribution-scale lcd lease-time level lifebytes lifetime
  "syn keyword   rscKeyword      line-count list local-address location logging login login-by log-prefix
  "syn keyword   rscKeyword      loop-detect lsr-id managed-address-configuration management-protection
  "syn keyword   rscKeyword      management-protection-key mangle manual manycast max-cache-size max-fresh-time
  "syn keyword   rscKeyword      max-message-age max-mru max-mtu max-sessions max-station-count memory-limit
  "syn keyword   rscKeyword      memory-lines memory-scroll memory-stop-on-full metric-connected metric-default
  "syn keyword   rscKeyword      metric-static min-rx mirror mme mode mpls mpls-mtu mq-pfifo-limit mrru
  "syn keyword   rscKeyword      mtu multicast multi-cpu multiple-channels multiplier my-id-user-fqdn name
  "syn keyword   rscKeyword      nat nat-traversal nd neighbor netmask network no-ping-delay note on-backup
  "syn keyword   rscKeyword      only-headers only-one on-master origination-interval other-configuration
  "syn keyword   rscKeyword      out-filter out-interface page page-refresh parent parent-proxy
  "syn keyword   rscKeyword      parent-proxy-port parity passthrough password path-vector-limit peer
  "syn keyword   rscKeyword      permissions pfifo-limit pfs-group policy pool port ports preemption-mode
  "syn keyword   rscKeyword      preferred-gateway preferred-lifetime prefix priority profile propagate-ttl
  "syn keyword   rscKeyword      proposal proposal-check proprietary-extensions protocol protocol-mode proxy
  "syn keyword   rscKeyword      query-interval query-response-interval queue quick-leave ranges rate-limit
  "syn keyword   rscKeyword      reachable-time read-access read-only receive-all receive-enabled
  "syn keyword   rscKeyword      receive-errors remember remote remote-address remote-port remote-ipv6-prefix-pool
  "syn keyword   rscKeyword      resource retransmit-interval route router-id routing routing-table
  "syn keyword   rscKeyword      sa-dst-address sa-src-address scope screen script secret send-initial-contact
  "syn keyword   rscKeyword      set-system-time settings sfq-allot sfq-perturb shared-users shares
  "syn keyword   rscKeyword      show-at-login show-dummy-rule signup-allowed sip-direct-media skin sms
  "syn keyword   rscKeyword      sniffer snooper socks source speed split-user-domain ssid ssid-all
  "syn keyword   rscKeyword      state-after-reboot status-autorefresh stop-bits store-every store-leases-disk
  "syn keyword   rscKeyword      supplicant-identity system target target-scope term test-id threshold timeout
  "syn keyword   rscKeyword      timeout-timer to-addresses tool topics tracking traffic-flow traffic-generator
  "syn keyword   rscKeyword      transmit-hold-count transparent-proxy transport-address ttl tunnel type
  "syn keyword   rscKeyword      unicast-ciphers upgrade upnp user-manager users v3-protocol valid-lifetime
  "syn keyword   rscKeyword      vcno version vrid watch-address watchdog watchdog-timer web-access wireless
  "
  "syn keyword   rscKeyword      address address-list address-pool
  "syn keyword   rscKeyword      addresses-per-mac admin-mac advertise-mac-address auto-mac filter-mac filter-mac-address filter-mac-protocol mac-addressmac-server mac-winbox
  "syn keyword   rscKeyword      advertise-dns dns-name dns-server use-peer-dns
  "syn keyword   rscKeyword      allow allow-disable-external-interface allowed-number allow-guests allow-remote-requests
  "syn keyword   rscKeyword      audio-max audio-min audio-monitor
  "syn keyword   rscKeyword      auth auth-algorithms auth-method
  "syn keyword   rscKeyword      authentication authentication-password authentication-protocol authentication-types default-authentication
  "syn keyword   rscKeyword      bsd-syslog syslog-facility syslog-severity
  "syn keyword   rscKeyword      clock time-zone time-zone-name
  "syn keyword   rscKeyword      connection-mark new-connection-mark new-packet-mark new-routing-mark routing-mark
  "syn keyword   rscKeyword      dst-address dst-address-list dst-delta dst-end dst-port dst-start address-list-timeout
  "syn keyword   rscKeyword      max-client-connections max-connections max-server-connections serialize-connections
  "syn keyword   rscKeyword      metric-ospf metric-other-ospf redistribute-ospf redistribute-other-ospf
  "syn keyword   rscKeyword      metric-rip redistribute-rip ripng
  "syn keyword   rscKeyword      ntp-server primary-ntp secondary-ntp use-peer-ntp
  "syn keyword   rscKeyword      paypal-accept-pending paypal-allowed paypal-secure-response
  "syn keyword   rscKeyword      primary-server secondary-server
  "syn keyword   rscKeyword      ra-delay ra-interval ra-lifetime
  "syn keyword   rscKeyword      radius radius-eap-accounting radius-mac-accounting radius-mac-authentication radius-mac-caching radius-mac-format radius-mac-mode
  "syn keyword   rscKeyword      red-avg-packet red-burst red-limit red-max-threshold red-min-threshold
  "syn keyword   rscKeyword      redistribute-connected redistribute-static
  "syn keyword   rscKeyword      require-client-certificate tls-certificate tls-mode verify-client-certificate
  "syn keyword   rscKeyword      security security-profile security-profiles
  "syn keyword   rscKeyword      server servers
  "syn keyword   rscKeyword      service service-name service-port
  "syn keyword   rscKeyword      smtp-server wins-server
  "syn keyword   rscKeyword      src-address src-address-list src-port
  "syn keyword   rscKeyword      static-algo-0 static-algo-1 static-algo-2 static-algo-3 static-sta-private-algo
  "syn keyword   rscKeyword      static-key-0 static-key-1 static-key-2 static-key-3 static-sta-private-key static-transmit-key
  "syn keyword   rscKeyword      streaming-enabled streaming-max-rate streaming-server
  "syn keyword   rscKeyword      switch-to-spt switch-to-spt-bytes switch-to-spt-interval
  "syn keyword   rscKeyword      trap-generators trap-target trap-version trap-community
  "
  "syn keyword   rscKeyword      update-stats-interval update-timer
  "syn keyword   rscKeyword      use-compression use-encryption use-explicit-null use-ipv6 use-mpls
  "syn keyword   rscKeyword      use-radius use-service-tag use-vj-compression
  "
  "syn keyword   rscKeyword      wmm-support wpa-pre-shared-key wpa2-pre-shared-key write-access</Keywords>
  "
  "syn keyword   rscKeyword      metric-bgp redistribute-bgp redistribute-other-bgp
  "
  "syn keyword   rscKeyword      change-tcp-mss tcp-close-timeout tcp-close-wait-timeout tcp-established-timeout
  "
  "syn keyword   rscKeyword      tcp-fin-wait-timeout tcp-last-ack-timeout tcp-syn-received-timeout
  "syn keyword   rscKeyword      tcp-syn-sent-timeout tcp-syncookie tcp-time-wait-timeout
  "
  "syn keyword   rscKeyword      allocate-udp-ports-from max-udp-packet-size udp-stream-timeout udp-timeout
  "
  "syn keyword   rscKeyword      use-ip-firewall-for-vlan vlan-id
  "syn keyword   rscKeyword      filter-ip-address filter-ip-protocol use-ip-firewall-for-pppoe use-ip-firewall
  "
  "syn keyword   rscKeyword      wds-cost-range wds-default-bridge wds-default-cost wds-ignore-ssid wds-mode
  "syn keyword   rscInterface    sstp-client sstp-server traffic-eng vlan vpls vrrp
  "syn keyword   rscInterface    6to4 bonding bridge eoip eoipv6 ethernet gre gre6 ipip ipipv6 isdn-client
  "syn keyword   rscInterface    isdn-server l2tp-client l2tp-server lte mesh ovpn-client ovpn-server
  "syn keyword   rscInterface    ppp-client pppoe-client pppoe-server ppp-server pptp-client pptp-server
  "syn keyword rscKeyword
  "\ country frequency band antenna-gain hw-protection-mode wireless-protocol
  "\ adaptive-noise-immunity default-name
  "syn keyword   rscService      api api-ssl dns ftp http https pim ntp smb ssh
  "syn keyword   rscService      telnet winbox www www-ssl

  "syn match     rscService      "^set.\(api\|api-ssl\|dns\|ftp\|http\|https\|pim\|ntp\|smb\|ssh\|telnet\|winbox\|www\|www-ssl\)"

syn keyword   rscProtocol     bgp ip ipsec ipv6 ldp ospf ospf-v3 ppp rip snmp  tcp udp

syn keyword   rscConnState    new related established invalid


"
"  *Comment  any comment
"
"  *Constant any constant
"   String   a string constant: "this is a string"
"   Character  a character constant: 'c', '\n'
"   Number   a number constant: 234, 0xff
"   Boolean  a boolean constant: TRUE, false
"   Float    a floating point constant: 2.3e10
"
"  *Identifier any variable name
"   Function function name (also: methods for classes)
"
"  *Statement  any statement
"   Conditional  if, then, else, endif, switch, etc.
"   Repeat   for, do, while, etc.
"   Label    case, default, etc.
"   Operator "sizeof", "+", "*", etc.
"   Keyword  any other keyword
"   Exception  try, catch, throw
"
"  *PreProc  generic Preprocessor
"   Include  preprocessor #include
"   Define   preprocessor #define
"   Macro    same as Define
"   PreCondit  preprocessor #if, #else, #endif, etc.
"
"  *Type   int, long, char, etc.
"   StorageClass static, register, volatile, etc.
"   Structure  struct, union, enum, etc.
"   Typedef  A typedef
"
"  *Special  any special symbol
"   SpecialChar  special character in a constant
"   Tag    you can use CTRL-] on this
"   Delimiter  character that needs attention
"   SpecialComment special things inside a comment
"   Debug    debugging statements
"
"  *Underlined text that stands out, HTML links
"
"  *Ignore   left blank, hidden  |hl-Ignore|
"
"  *Error    any erroneous construct
"
"  *Todo   anything that needs extra attention; mostly the
"      keywords TODO FIXME and XXX
"

hi link rscSubMenu              Function
hi link rscDelimiter            Operator
hi link rscInterface            Type
hi link rscVariable             Identifier
hi link rscBoolean              Boolean
hi link rscOperator             Operator
hi link rscCommands             Operator

hi link rscAction               Statement
hi link rscConditional          Conditional
hi link rscRepeat               Repeat
hi link rscComment              Comment
hi link rscConnState            Type
hi link rscContext              Type
hi link rscFlow                 Statement
hi link rscFunction             Function
hi link rscKeyword              Identifier
hi link rscLabel                Label
hi link rscNumber               Number
hi link rscProtocol             Type
hi link rscService              Type
hi link rscSpecialChar          SpecialChar
hi link rscSpecial              Delimiter
hi link rscString               String
hi link rscType                 Type

" source <sfile>:p:h/rsc.vim

let b:current_syntax = "rsc"
