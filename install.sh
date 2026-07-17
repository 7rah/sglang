#!/usr/bin/env bash
set -euxo pipefail

cd /root/sglang

export UV_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
mkdir -p /opt/cargo
if ! grep -q 'tuna' /opt/cargo/config.toml 2>/dev/null; then
  cat >> /opt/cargo/config.toml <<'EOF'
[source.tuna]
registry = "sparse+https://mirrors.tuna.tsinghua.edu.cn/crates.io-index/"

[source.crates-io]
replace-with = "tuna"
EOF
fi

uv venv --python 3.12 --clear /root/sglang/.venv
source /root/sglang/.venv/bin/activate

python --version
which python
rustc --version
cargo --version
rustup toolchain install stable || true

uv pip install -e /root/sglang/python

echo "INSTALL_DONE_MARKER"
