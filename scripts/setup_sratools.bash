#!/bin/bash
wget $SOFTWARE_URL -O sra_toolkit.tar.gz
mkdir sra_toolkit
tar -xzf sra_toolkit.tar.gz -C sra_toolkit --strip-components 1
echo "sra_toolkit/bin" >> "$GITHUB_PATH"