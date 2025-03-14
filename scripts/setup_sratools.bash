#!/bin/bash
if [[ $RUNNER_OS == *"Linux"* ]]; then
    SRATOOLS_URL="https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.1.0/sratoolkit.3.1.0-ubuntu64.tar.gz"
fi

if [[ $RUNNER_OS == *"macOS"* ]]; then
    SRATOOLS_URL="https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.1.0/sratoolkit.3.1.0-mac-arm64.tar.gz"
fi

wget $SRATOOLS_URL -O sra_toolkit.tar.gz
mkdir sra_toolkit
tar -xzf sra_toolkit.tar.gz -C sra_toolkit --strip-components 1
echo "sra_toolkit/bin" >> "$GITHUB_PATH"