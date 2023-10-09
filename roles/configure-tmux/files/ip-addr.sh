#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

extract_eth_addresses() {
  eth_addresses=$(ip addr show | awk '/inet / { split($2, a, "/"); if ($NF ~ /^eth/) printf "| %s %s | ", $NF, a[1] }')
  echo "${eth_addresses% }"
}


main() {
  network=$(ip addr show tun0 up 2>&1)

  if [[ $network == 'Device "tun0" does not exist.' ]]; then
    network=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
    extract_eth_addresses
    exit 0
  else
    network=$(ip addr show tun0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
    tun="tun0 $network"
    eth=$(extract_eth_addresses)
    echo "$tun | $eth"
  fi
}

main