### 原项目信息
protobuf-matlab - FarSounder's Protobuf compiler for Matlab
Copyright 2011 FarSounder, Inc.
http://code.google.com/p/protobuf-matlab/

## 关于本项目
本项目包括了两部分相关度并不大的内容。一是改良过的Matlab版的Protobuf，在Fork原项目的基础上做了一定的修改。另一部分是MexGenerator，是一个可以根据配置自动生成指定标准的带有MexFunction的C程序的工具。

### 使用Protobuf写程序
1.根据需要，定义数据结构，写成xx.proto文件
2.编译xx.proto文件，生成各语言的数据结构定义代码（ xx.pb.h | xx.pb.c | b_descriptor_xx.m | pb_read_xx.m | xx_pb2.py）
3.引用生成的数据结构代码，进行对应语言中的功能编码。

### 在Matlab中调用C函数
1.选好要使用的C函数，将各函数的定义和引用写到配置文件中
2.根据配置文件，自动为每个函数生成带有MexFunction的.c文件。
3.mex编译生成的.c文件，生成可被Matlab直接调用的mexmaci64文件

想要了解Protobuf的安装，请参阅 Protobuf_Install.md
想要了解MexGenerator ，请参阅 MexGenerator_Guide.md
想要运行MexGenerator示例，请参阅/sample/sample.md