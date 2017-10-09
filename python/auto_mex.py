import configparser
import os
from sys import argv

class ParamEntity(object):
    C_TYPES = ['int','char','float','double','uint8_t','size_t']

    def __init__(self,index,str):
        super(ParamEntity,self).__init__()
        if str[0:4] == 'out ':
            self.Type = str[4:]
            self.Is_Out = True
        else :
            self.Type = str
            self.Is_Out = False
        if '*' in self.Type :
            self.is_pointer = True
            self.Type = self.Type.split('*')[0].strip()
        else :
            self.is_pointer = False
        self.InstanceName = '{}_{}'.format(self.Type.lower(),index)

    def IsProtoType(self):
        return not self.Type in self.C_TYPES

    def CallDeclaration(self):
        res = self.InstanceName
        if self.IsProtoType():
            res = '&' + res
        elif not self.is_pointer :
            res = '*' + res
        return res

    def MxType(self):
        if self.IsProtoType:
             return ''
        map = {
            'int':'mxINT32_CLASS',
            'uint_8_t':'mxINT32_CLASS',
            'size_t':'mxINT32_CLASS',
            'char' :'mxINT8_CLASS',
            'float' :'mxSINGLE_CLASS',
            'double' :'mxDOUBLE_CLASS'
        }
        return map[self.Type]   

class MexEntity(object):
    def __init__(self):
        super(MexEntity,self).__init__()
        self.MexName = ''
        self.Function = ''
        self.Params = []
        self.Protos = []
        self.Includes = []
        self.__c_file = None
    
    def __type_to_name(self,type_name):
        return type_name.lower()

    def __print_headers(self):
        self.__c_file.write('#include <stdint.h>\n')
        self.__c_file.write('#include <string.h>\n')
        self.__c_file.write('#include <stdlib.h>\n')
        self.__c_file.write('#include <stdio.h>\n')
        self.__c_file.write('#include \"pb_encode.h\"\n')
        self.__c_file.write('#include \"pb_decode.h\"\n')
        self.__c_file.write('#include \"pb.h\"\n')
        self.__c_file.write('#include \"mex.h\"\n')
        for proto in self.Protos:
            self.__c_file.write('#include \"{}.pb.h\"\n'.format(proto))
        for include in self.Includes:
            self.__c_file.write('#include \"{}.h\"\n'.format(include))            
        self.__c_file.write('#define MAX_BUF_SIZE 10000\n')
        self.__c_file.write('\n')

    def __print_function(self):
        self.__c_file.write('void mexFunction(int nlhs,mxArray *plhs[], int nrhs,const mxArray *prhs[])           \n')
        self.__c_file.write('{\n')
        self.__c_file.write('    uint8_t *matrix;\n')
        self.__c_file.write('    uint8_t *result;\n')
        self.__c_file.write('    uint8_t buf[MAX_BUF_SIZE];\n')
        self.__c_file.write('    int i;\n')
        self.__c_file.write('    mwSignedIndex matrix_n;\n')
        self.__c_file.write('    pb_istream_t istream;\n')
        self.__c_file.write('    pb_ostream_t ostream;\n')
        self.__c_file.write('\n')
        for param in self.Params:
            if param.IsProtoType():
                self.__c_file.write('    {} {} = {}_init_zero;\n'.format(param.Type,param.InstanceName,param.Type))
            else :
                self.__c_file.write('    {} * {};\n'.format(param.Type,param.InstanceName))                
        self.__c_file.write('\n')
        in_count = 0
        for param in self.Params:
            if not param.Is_Out:
                if param.IsProtoType():
                    self.__c_file.write('    matrix = mxGetPr(prhs[{}]);\n'.format(in_count))
                    self.__c_file.write('    matrix_n = (mwSignedIndex)mxGetN(prhs[{}]);\n'.format(in_count))
                    self.__c_file.write('    if(matrix_n!=0){\n')
                    self.__c_file.write('        memset(buf,0,MAX_BUF_SIZE);\n')
                    self.__c_file.write('        for (int i = 0; i < matrix_n; i++)\n')
                    self.__c_file.write('        {\n')
                    self.__c_file.write('            buf[i] = matrix[i];\n')
                    self.__c_file.write('        }\n')
                    self.__c_file.write('        istream = pb_istream_from_buffer(buf, sizeof(buf));\n')
                    self.__c_file.write('        pb_decode(&istream,{}_fields,&{});\n'.format(param.Type,param.InstanceName))
                    self.__c_file.write('    }\n')
                    self.__c_file.write('\n')
                else :
                    self.__c_file.write('    matrix = mxGetPr(prhs[{}]);\n'.format(in_count))
                    self.__c_file.write('    matrix_n = (mwSignedIndex)mxGetN(prhs[{}]);\n'.format(in_count))
                    self.__c_file.write('    {} = ({}*)malloc(sizeof({})*matrix_n);\n'.format(param.InstanceName,param.Type,param.Type))
                    self.__c_file.write('    if(matrix_n!=0){\n')
                    self.__c_file.write('        for (int i = 0; i < matrix_n; i++)\n')
                    self.__c_file.write('        {\n')
                    self.__c_file.write('            {}[i] = ((double*)matrix)[i];\n'.format(param.InstanceName))
                    self.__c_file.write('        }\n')
                    self.__c_file.write('    }\n')
                    self.__c_file.write('\n')
                in_count = in_count + 1

        self.__c_file.write('    {}({});\n'.format(self.Function, ", ".join(   \
            param.CallDeclaration() for param in self.Params)))
        self.__c_file.write('\n')
        out_count = 0;
        for param in self.Params:
            if param.Is_Out:
                if param.IsProtoType():
                    self.__c_file.write('    memset(buf,0,MAX_BUF_SIZE);\n')
                    self.__c_file.write('    ostream = pb_ostream_from_buffer(buf, sizeof(buf));\n')
                    self.__c_file.write('    pb_encode(&ostream, {}_fields, &{});\n'.format(param.Type,param.InstanceName))
                    self.__c_file.write('    plhs[{}] = mxCreateNumericMatrix(1, ostream.bytes_written, mxUINT8_CLASS,0);\n'.format(out_count))
                    self.__c_file.write('    result = mxGetPr(plhs[{}]);\n'.format(out_count))
                    self.__c_file.write('    for(i = 0 ; i<ostream.bytes_written;i++){\n')
                    self.__c_file.write('        result[i] = *(buf+i);\n')
                    self.__c_file.write('    }\n')
                out_count = out_count + 1
        self.__c_file.write('}\n')
            
    def Print(self):
        self.__c_file =  open(os.path.dirname(argv[0]) + '/' + self.MexName+'.c','wt+')
        self.__print_headers()
        self.__print_function()

def ReadConfig(config_file):
    result = []
    parser = configparser.ConfigParser()
    parser.read(config_file)
    sections = parser.sections()
    for mex_name in sections:
        mex_entity = MexEntity()
        mex_entity.MexName = mex_name
        mex_entity.Function = parser.get(mex_name,"Function").strip()
        raw_params = parser.get(mex_name,"Params").split(',')
        for i in range(0,len(raw_params)):
            mex_entity.Params.append(ParamEntity(i,raw_params[i].strip()))
        mex_entity.Protos = parser.get(mex_name,"Protos").split(',')
        for proto in mex_entity.Protos:
            proto = proto.strip()
        mex_entity.Includes = parser.get(mex_name,"Includes").split(',')
        for include in mex_entity.Includes:
            include = include.strip()
        result.append(mex_entity)
    return result

def main():
    config_path = argv[1]
    mex_entities = ReadConfig(config_path)
    for entity in mex_entities:
        entity.Print()
    print('done')

if __name__ == '__main__':
    main()
