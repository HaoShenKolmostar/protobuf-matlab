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
pos_bytes = eph_to_pos(eph_bytes,pos_bytes,[])
pos_res = pb_read_PositioningLatLonAlt(pos_bytes)

%测试代码2
[bytes_1,bytes_2,res] = many_eph(3,[],[1.1,2.2,3.3],[11.11,22.22,33.33],[6,7,8],[66,77,88],[]);
eph_many = pb_read_List_GPS_EPHEMERIS(bytes_1);
eph_many.items(1)
eph_many.items(2)
eph_many.items(3)
eph_many = pb_read_List_GPS_EPHEMERIS(bytes_2);
eph_many.items(1)
eph_many.items(2)
eph_many.items(3)
res
```


# Sample positioning_correction

文件结构和上一个sample略有不同。特别将c_code文件夹单独提了出来，并且添加100%原汁原味的原始代码c_code_origin用来进行对比。两份代码的主要差异就在于，c_code_origin中数据结构全部放在positioning_type.h中，而c_code中将protobuf定义的数据结构移到了positioning.pb.h中。此外c_code文件夹中的数据定义将uint8_t和int16_t都换成了int32_t。具体使用指令见下

命令行
```shell
mkdir sample/positioning_correction/matlab_lib
sudo cp -r  protobuflib/* sample/positioning_correction/matlab_lib
python3 python/auto_mex.py sample/positioning_correction/positioning.conf
mv python/PositioningRelativisticCorr.c sample/positioning_correction
mv python/PositioningGpsIonoDelay.c sample/positioning_correction
mv python/PositioningBdsIonoDelay.c sample/positioning_correction
mv python/PositioningIonoDelay.c sample/positioning_correction
mv python/PositioningTropoDelay.c sample/positioning_correction
```

Matlab

```matlab
cd /your-path/protobuf-matlab/sample/positioning_correction
mex -output PositioningBdsIonoDelay PositioningBdsIonoDelay.c c_code/positioning_correction.c c_code/positioning.pb.c c_lib/pb_common.c c_lib/pb_decode.c c_lib/pb_encode.c -v -Ic_lib -Ic_code;
mex -output PositioningGpsIonoDelay PositioningGpsIonoDelay.c c_code/positioning_correction.c c_code/positioning.pb.c c_lib/pb_common.c c_lib/pb_decode.c c_lib/pb_encode.c -v -Ic_lib -Ic_code;
mex -output PositioningIonoDelay PositioningIonoDelay.c c_code/positioning_correction.c c_code/positioning.pb.c c_lib/pb_common.c c_lib/pb_decode.c c_lib/pb_encode.c -v -Ic_lib -Ic_code;
mex -output PositioningRelativisticCorr PositioningRelativisticCorr.c c_code/positioning_correction.c c_code/positioning.pb.c c_lib/pb_common.c c_lib/pb_decode.c c_lib/pb_encode.c -v -Ic_lib -Ic_code;
mex -output PositioningTropoDelay PositioningTropoDelay.c c_code/positioning_correction.c c_code/positioning.pb.c c_lib/pb_common.c c_lib/pb_decode.c c_lib/pb_encode.c -v -Ic_lib -Ic_code;

param1 = pb_read_PositioningIonoParam([])
param1.flag = 255
param1.alpha0 = 9.3132257E-09;
param1.alpha1 = 1.4901161E-08;
param1.alpha2 = -5.9604645E-08;
param1.alpha3 = -1.1920929E-07;
param1.beta0 = 8.8064000E+04j
param1.beta0 = 8.8064000E+04;
param1.beta1 = 4.9152000E+04;
param1.beta2 = -1.3107200E+05;
param1.beta3 = -3.2768000E+05;
bparam1 = pblib_generic_serialize_to_string(param1)
param2 = 294502008
param3 = 294502008
param2 = pb_read_PositioningLatLonAlt([])
parma2.lat = 0.698203
param2.lon = 2.029963
param2.alt = 44.478356
param2.lat = 0.698203
param1
bparam2 = pblib_generic_serialize_to_string(param2)
param4 = pb_read_PositioningElAz([])
param4.el = 1.195744
param4.az = 0.426609
bparam4 = pblib_generic_serialize_to_string(param4)
PositioningGpsIonoDelay(bparam1,bparam2,param3,bparam4)
 ```