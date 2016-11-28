#!/bin/bash

function download_latest_pivnet_rc() {
  bucket="pivnet-cli"

  version_file=$(mktemp -t pivnet-current-version.XXXXXXXX)
  download_file=$(mktemp -t pivnet-rc-latest.XXXXXXXX)

  # shellcheck disable=SC2064
  trap "rm -rf ${version_file} ${download_file}" EXIT

  system_uname=$(uname -a)
  if [[ ${system_uname} == *"Ubuntu"* ]]; then
    my_os="linux"
  elif [[ ${system_uname} == *"Darwin"* ]]; then
    my_os="darwin"
  else
    echo "Unrecognized system uname: ${system_uname} - exiting"
    return
  fi

  echo -n "Getting current version... "
  aws s3 cp "s3://${bucket}/current-version" "${version_file}" 1>/dev/null
  echo "complete"

  current_version=$(cat "${version_file}")
  : "${current_version:?"most recent version not found"}"
  echo "Current version: ${current_version}"

  echo -n "Downloading to ${download_file}... "
  aws s3 cp "s3://${bucket}/pivnet-${my_os}-amd64-${current_version}" "${download_file}" 1>/dev/null
  echo "complete"

  echo -n "Installing to /usr/local/bin/pivnet-rc... "
  cp "${download_file}" /usr/local/bin/pivnet-rc
  chmod +x /usr/local/bin/pivnet-rc
  echo "complete"

  rm -rf "${version_file}" "${download_file}"
}
