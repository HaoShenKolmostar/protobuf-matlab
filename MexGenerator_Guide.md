# MexGenerator Guide

首先请确保已经安装好了Protobuf,否则请先阅读Protobuf_Install.md。
其次请访问 https://developers.google.com/protocol-buffers/docs/overview 了解Protobuf的基本使用。

## 使用的条件限制

1.C程序的所有参数必须是指针类型，返回类型为void。如 void（int * i,proto_type * proto)
2.Matlab中接收的返回必须是.proto中定义的类型(后续可能会添加对C语言原生类型的支持)
3.不能直接使用proto中定义的类型的数组。如果需要使用数组，需要额外为其定义一个List类型。参考使用方式如下.

首先定义your_proto_file.proto
```protobuf
message your_proto{
    int32 an_attribute = 1;
}
message List_your_proto{
    repeated your_proto items = 1;
}
```
其次定义your_proto_file.options
```c
List_your_proto.items max_count:777
```

## 配置文件格式

配置文件使用标准的.conf格式定义，具体结构如下。

```python
[YourMexName]
#Matlab中的调用名
Function : Name_Of_C_Function
#调用的C函数的名称
Params : int,char,float,double,type1,out type2
#C函数参数的类型列表
#如果某个参数是Matlab中想得到的输出结果，需要在参数的声明前额外加上'out '进行标识。
#protobuf定义的类型可以作为输入和输出，C语言原生类型只能作为输入
#目前支持的原生类型包括int,char,float和double
Protos : proto1,proto2
#这里写定义的xx.proto文件的名称，会添加xx.pb.h和xx.pb.c的引用
Includes : include1,include2
#这里写引用的其他的C头文件，会添加xx.h的引用
```

运行 /python/auto_mex.py your_config.conf,会生成 YourMexName.c 文件。在Matlab中使用mex编译YourMexName.c文件即可生成可在Matlab中调用的.mexmaci64文件。具体命令请参考sample.md。