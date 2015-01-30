
//WIP for porting to unitstd

/**
    Copyright Sven Bergström, Thomas Hourdel 2014
    Created for snow https://github.com/underscorediscovery/snow
    License MIT
**/

import mohxa.Mohxa;

class _TestTypedArrays {

    static function main() {

        //int
            run(new TestInt8Array());
            run(new TestInt16Array());
            run(new TestInt32Array());
            run(new TestUInt8Array());
            run(new TestUInt8ClampedArray());
            run(new TestUInt16Array());
            run(new TestUInt32Array());
        //float
            run(new TestFloat32Array());

        done();
    }

    static var total = 0;
    static var failed = 0;
    static var time = 0.0;
    static function run<T:Mohxa>(instance:T) {

        instance.run();

        total += instance.total;
        failed += instance.failed;
        time += instance.total_time;

    }

    static function done() {
        trace('completed $total tests, $failed failures (${time}ms)\n');

        #if cpp
            var code = failed > 0 ? 1 : 0;
            Sys.exit( code );
        #else
            if(failed > 0) {
                throw 'tests failed';
            }
        #end
    }

} //TestTypedArrays