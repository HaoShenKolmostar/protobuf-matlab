import configparser
from sys import argv

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
        self.__c_file.write('#include \"eph.pb.h\"\n')
        self.__c_file.write('#include \"C_Funtions.h\"\n')
        self.__c_file.write('#define MAX_BUF_SIZE 10000\n')
        self.__c_file.write('\n')

    def __print_function(self):
        self.__c_file.write('void mexFunction(int nlhs,mxArray *plhs[], int nrhs,const mxArray *prhs[])           \n')
        self.__c_file.write('{\n')
        self.__c_file.write('    uint8_t *matrix;\n')
        self.__c_file.write('    double *result;\n')
        self.__c_file.write('    uint8_t buf[MAX_BUF_SIZE];\n')
        self.__c_file.write('    int i;\n')
        self.__c_file.write('    mwSignedIndex matrix_n;\n')
        self.__c_file.write('    pb_istream_t istream;\n')
        self.__c_file.write('    pb_ostream_t ostream;\n')
        self.__c_file.write('\n')
        for param in self.Params:
            self.__c_file.write('    {} {} = {}_init_zero;\n'.format(param,self.__type_to_name(param),param))
        self.__c_file.write('\n')
        for i in range(0,len(self.Params)-1):
            self.__c_file.write('    matrix = mxGetPr(prhs[{}]);\n'.format(i))
            self.__c_file.write('    matrix_n = (mwSignedIndex)mxGetN(prhs[{}]);\n'.format(i))
            self.__c_file.write('    if(matrix_n!=0){\n')
            self.__c_file.write('        memset(buf,0,MAX_BUF_SIZE);\n')
            self.__c_file.write('        for (int i = 0; i < matrix_n; i++)\n')
            self.__c_file.write('        {\n')
            self.__c_file.write('            buf[i] = matrix[i];\n')
            self.__c_file.write('        }\n')
            self.__c_file.write('        istream = pb_istream_from_buffer(buf, sizeof(buf));\n')
            self.__c_file.write('        pb_decode(&istream,{}_fields,&{});\n'.format(self.Params[i],self.__type_to_name(self.Params[i])))
            self.__c_file.write('    }\n')
            self.__c_file.write('\n')
        self.__c_file.write('    {}(&{});\n'.format(self.Function,", &".join(self.__type_to_name(param) for param in self.Params)))
        self.__c_file.write('\n')
        out_param = self.Params[len(self.Params)-1]
        self.__c_file.write('    memset(buf,0,MAX_BUF_SIZE);\n')
        self.__c_file.write('    ostream = pb_ostream_from_buffer(buf, sizeof(buf));\n')
        self.__c_file.write('    pb_encode(&ostream, {}_fields, &{});\n'.format(out_param,self.__type_to_name(out_param)))
        self.__c_file.write('    plhs[0] = mxCreateDoubleMatrix(1, strlen(buf), mxREAL);\n')
        self.__c_file.write('    result = mxGetPr(plhs[0]);\n')
        self.__c_file.write('    for(i = 0 ; i<strlen(buf);i++){\n')
        self.__c_file.write('        result[i] = *(buf+i);\n')
        self.__c_file.write('    }\n')
        self.__c_file.write('}\n')

    def Print(self):
        self.__c_file =  open(self.MexName+'.c','wt+')
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
        mex_entity.Params = parser.get(mex_name,"Params").split(',')
        for i in range(0,len(mex_entity.Params)):
            mex_entity.Params[i] = mex_entity.Params[i].strip()
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