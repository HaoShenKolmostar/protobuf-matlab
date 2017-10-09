# Sample sol_personal

如果你对Protobuf的使用还有疑问，请参阅Protobuf_Install.md和Protobuf_Guide.md。

在sol_personal文件夹中，我们已经预先准备好了定义的一些.proto文件，并将编译结果放在了proto_output文件夹下。

## 拷贝Matlab库

执行脚本
```shell
mkdir sample/sol_personal/matlab_lib
sudo cp -r  protobuflib/* sample/sol_personal/matlab_lib
```

## 生成MexFunction源码文件

在本Repo路径下，执行如下命令，会在python文件夹下生成eph_to_pos.c和many_eph.c两个文件。想要了解函数的具体实现，请查看c_lib下的C_Functions.c

```shell
python3 python/auto_mex.py sample/sol_personal/example.conf
mv python/eph_to_pos.c sample/sol_personal
mv python/many_eph.c sample/sol_personal
```

## 编译成Mex文件

请在Matlab里执行 mex -setup C 以验证能否正常使用Mex。如果出现问题的是2016或更低版本，请检查并修改文件 /Users/sol/Library/Application Support/MathWorks/MATLAB/R2016b/mex_C_maci64.xml ，并在配置文件中添加当前的MacOSX SDK信息

```matlab

cd /your-path/protobuf-matlab/sample/sol_personal

mex -output eph_to_pos eph_to_pos.c c_lib/C_Funtions.c proto_output/pos.pb.c proto_output/eph.pb.c c_lib/pb_common.c c_lib/pb_decode.c c_lib/pb_encode.c -v -Ic_lib -Iproto_output

mex -output many_eph many_eph.c c_lib/C_Funtions.c proto_output/pos.pb.c proto_output/eph.pb.c c_lib/pb_common.c c_lib/pb_decode.c c_lib/pb_encode.c -v -Ic_lib -Iproto_output
```

## 调用Mex

执行如下语句。不报错，并且不输出空的数据结构，则说明程序已经成功执行。

```matlab
current_folder = pwd;addpath(genpath(current_folder));

%测试程序1
eph = pb_read_GPS_EPHEMERIS([])
pos = pb_read_PositioningReceiverInfo([])
pos.lla = pb_read_PositioningLatLonAlt()
eph.svid = 1
eph.ecc = 2.2
eph.af0 = 3.3
pos.lla.lat = 1.1
pos.lla.lon = 2.2
pos.lla.alt = 3.3
pos.receiver_time = [4,5,6]
eph_bytes = pblib_generic_serialize_to_string(eph)
pos_bytes = pblib_generic_serialize_to_string(pos)
pos_bytes = eph_to_pos(eph_bytes,pos_bytes)
pos_res = pb_read_PositioningLatLonAlt(pos_bytes)

%测试代码2
bytes_eph_many = many_eph(3,[1.1,2.2,3.3],[11.11,22.22,33.33],[6,7,8],[66,77,88])
eph_many = pb_read_List_GPS_EPHEMERIS(bytes_eph_many)
eph_many.items(1)
eph_many.items(2)
eph_many.items(3)
```

