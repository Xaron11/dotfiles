export ASDF_DATA_DIR="$HOME/.asdf"

typeset -U path PATH
path+=("$ASDF_DATA_DIR/shims")
path+=("$HOME/.local/bin") 
path+=("$HOME/Scripts")
path+=("$HOME/Packages/stripe-cli")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.yarn/bin")
path+=("$HOME/.config/yarn/global/node_modules/.bin")
path+=("$HOME/development/flutter/bin")
path+=("$HOME/.dotnet/tools")
path+=("/opt/cuda/bin")
export PATH


export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

export PYTHON_HOST_PROG="$HOME/.asdf/shims/python"
export PYTHON3_HOST_PROG="$HOME/.asdf/shims/python"

export XDG_CONFIG_HOME="$HOME/.config"

export ANDROID_HOME="/opt/android-sdk/"

export QT_STYLE_OVERRIDE=kvantum

export PANEL_HEIGHT=24


