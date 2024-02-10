#!/usr/bin/bash

echo "" > build-out.txt
echo "" > benchmark-out.txt

compilers=("clang++" "g++")
linkers=("OFF" "ON") 
generators=("Unix Makefiles" "Ninja")
unity_build=("OFF" "ON")
enable_pch=("OFF" "ON")
enable_ccache=("" "-DCMAKE_CXX_COMPILER_LAUNCHER=ccache")


# Loop over all combinations of options
for compiler in "${compilers[@]}"; do
  for linker in "${linkers[@]}"; do
    for generator in "${generators[@]}"; do
      for unity in "${unity_build[@]}"; do
        for pch in "${enable_pch[@]}"; do
          for ccache in "${enable_ccache[@]}"; do
            cat >> build-out.txt<< EOF
----------------------------------------------------------------------
Configuration: ${generator}, ${compiler}, LLD: ${linker}, Unity: ${unity}, PCH: ${pch}, ${ccache}
EOF
            start=$(date +%s)
            # Run CMake with current combination of options
            cmake -B build-benchmark -G "${generator}" -DCMAKE_CXX_COMPILER="${compiler}" \
            -DENABLE_LLD="${linker}" -DCMAKE_UNITY_BUILD="${unity}" -DENABLE_PCH="${pch}" \
            "${ccache}" &>> build-out.txt
            
            config=$(date +%s)

            # Build the project
            cmake --build build-benchmark &>> build-out.txt
            
            cat >> benchmark-out.txt<< EOF
----------------------------------------------------------------------
Configuration: ${generator}, ${compiler}, LLD: ${linker}, Unity: ${unity}, PCH: ${pch}, ${ccache}
Configure time: $(($config - $start))
Build time: $(($(date +%s) - $config))
----------------------------------------------------------------------
EOF

            # Clean up build directory
            rm -rf build-benchmark
          done
        done
      done
    done
  done
done
