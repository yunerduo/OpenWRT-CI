#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (C) 2026 VIKINGYFY
# 自动应用补丁脚本

echo "正在应用补丁..."

# 应用 vlmcsd GNUmakefile 修复补丁
if [ -d "feeds/packages/net/vlmcsd" ]; then
    echo "修复 vlmcsd 编译问题..."
    cd feeds/packages/net/vlmcsd
    
    # 如果还没有打过补丁，则应用补丁
    if ! grep -q "%.o: %.c" src/GNUmakefile 2>/dev/null; then
        patch -p1 < $GITHUB_WORKSPACE/Patches/vlmcsd-fix-makefile.patch || true
        echo "vlmcsd 补丁已应用"
    fi
    
    cd ../../..
fi

echo "补丁应用完成!"
