# 原项目信息
protobuf-matlab - FarSounder's Protobuf compiler for Matlab
Copyright 2011 FarSounder, Inc.
http://code.google.com/p/protobuf-matlab/

# 安装包含C和Matlab的Protobuf

以下步骤并不是唯一可行的安装方案，也不是最方便呃，但是应该是最容易成功的，建议大家在了解以下安装思路的基础上，再进根据自己的实际情况进行适合自己的安装方式

## 安装Protobuf

请参考 https://github.com/Kolmostar/nanopb 中的步骤“安装Protobuf”部分，以完成对Protobuf本身的安装。下面这部分shell指令是对原文档的拷贝。

```shell
# 下载protobuf的源代码 可以到github上下载最新版本
wget https://github.com/google/protobuf/releases/download/v3.4.0/protobuf-python-3.4.0.zip
# 解压进入文件夹
unzip protobuf-python-3.4.0.zip
cd protobuf-python-3.4.0

# 安装一些依赖
# 如果是linux ubuntu系统
sudo apt install -y automake autoconf libtool make cmake g++
# 如果是mac系统 用brew 怎么安装brew自行查找
brew install automake autoconf libtool cmake

# 正式安装
./configure
make check
sudo make install

# mac系统最后执行
update_dyld_shared_cache
# linux系统最后执行
ldconfig
```

## 为 Protobuf 安装 Matlab插件

原项目地址https://github.com/farsounder/protobuf-matlab 
本Repo中进行了一定的修改，请使用这个版本的代码

我们的目标是将Matlab中的代码并入Protobuf中，一起进行编译生成与安装。

首先将本Repo中的'src'文件夹与Protobuf中的'src'文件夹进行合并。

接下来需要修改两个配置文件。一个是/src/google/Makefile.am 。需要添加两处内容

```shell
#找到此处
nobase_include_HEADERS =                                       \
  google/protobuf/stubs/common.h                               \
  #跳过中间
  google/protobuf/compiler/python/python_generator.h           \
  #添加下面的一行
  farsounder/protobuf/compiler/matlab/matlab_generator.h

#找到此处
libprotoc_la_SOURCES =                                         \
  google/protobuf/compiler/code_generator.cc                   \
  #跳过中间
  google/protobuf/compiler/python/python_generator.cc          \
  #添加下面的一行
  farsounder/protobuf/compiler/matlab/matlab_generator.cc
```

另外一个需要修改的文件是/src/google/protobuf/compiler/main.cc

```c
//在include部分加入这一行
#include <farsounder/protobuf/compiler/matlab/matlab_generator.h>

//在main里面加入如下代码
   farsounder::protobuf::compiler::matlab::MatlabGenerator matlab_generator;
  cli.RegisterGenerator("--matlab_out", &matlab_generator,
                        "Generate Matlab M files.");
```

以上修改全部完成后，重新执行”安装Protobuf“的脚本中的“正式安装”部分，即可完成安装。

## 安装Nanopb

原项目地址 https://github.com/nanopb/nanopb 。可以按照说明完成安装。可以参考 https://github.com/Kolmostar/nanopb 对安装Nanopb的说明。

除此正规方法之外，我还想为大家额外介绍一种取巧的办法。
首先到 https://jpa.kapsi.fi/nanopb/download/ 下载可执行文件。解压后，会看到里面有一个generator-bin文件夹。这个文件夹里面的protoc是我们要运行nanopb所使用的，而非之前安装的那个protoc。请注意该文件夹下还有一个protoc.bin。使用命令"which protoc"，找到之前的Protoc安装的位置，用这个protoc可执行文件替换generator-bin中的protoc.bin文件即可。
