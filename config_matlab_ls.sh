#!/usr/bin/env bash
set -e
git clone https://github.com/mathworks/MATLAB-language-server.git "$HOME/build/MATLAB-language-server"
cd "$HOME/build/MATLAB-language-server"
npm install
npm run compile
npm run package
