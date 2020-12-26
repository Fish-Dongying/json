find_program(CLANG_TIDY_TOOL NAMES clang-tidy REQUIRED)
find_program(CLANG_TOOL NAMES clang++-HEAD clang++-11 clang++ REQUIRED)
find_program(CPPCHECK_TOOL NAMES cppcheck REQUIRED)
find_program(GCC_TOOL NAMES g++-HEAD g++-11 g++ REQUIRED)
find_program(PLOG_CONVERTER_TOOL NAMES plog-converter REQUIRED)
find_program(PVS_STUDIO_ANALYZER_TOOL NAMES pvs-studio-analyzer REQUIRED)
find_program(SCAN_BUILD_TOOL NAMES scan-build REQUIRED)

set(CLANG_CXXFLAGS "-std=c++11                        \
    -Werror                                           \
    -Weverything                                      \
    -Wno-c++98-compat                                    \
    -Wno-c++98-compat-pedantic                           \
    -Wno-c++2a-compat                                    \
    -Wno-deprecated-declarations                         \
    -Wno-documentation-unknown-command                   \
    -Wno-exit-time-destructors                           \
    -Wno-float-equal                                     \
    -Wno-missing-prototypes                              \
    -Wno-padded                                          \
    -Wno-range-loop-analysis                             \
    -Wno-switch-enum -Wno-covered-switch-default         \
    -Wno-weak-vtables                                    \
")

set(GCC_CXXFLAGS "-std=c++11                          \
    -pedantic                                         \
    -Werror                                           \
    --all-warnings                                    \
    --extra-warnings                                  \
    -W                                                \
    -Wno-abi-tag                                         \
    -Waddress                                         \
    -Waddress-of-packed-member                        \
    -Wno-aggregate-return                                \
    -Waggressive-loop-optimizations                   \
    -Waligned-new=all                                 \
    -Wall                                             \
    -Walloc-zero                                      \
    -Walloca                                          \
    -Wanalyzer-double-fclose                          \
    -Wanalyzer-double-free                            \
    -Wanalyzer-exposure-through-output-file           \
    -Wanalyzer-file-leak                              \
    -Wanalyzer-free-of-non-heap                       \
    -Wanalyzer-malloc-leak                            \
    -Wanalyzer-null-argument                          \
    -Wanalyzer-null-dereference                       \
    -Wanalyzer-possible-null-argument                 \
    -Wanalyzer-possible-null-dereference              \
    -Wanalyzer-stale-setjmp-buffer                    \
    -Wanalyzer-tainted-array-index                    \
    -Wanalyzer-too-complex                            \
    -Wanalyzer-unsafe-call-within-signal-handler      \
    -Wanalyzer-use-after-free                         \
    -Wanalyzer-use-of-pointer-in-stale-stack-frame    \
    -Warith-conversion                                \
    -Warray-bounds                                    \
    -Warray-bounds=2                                  \
    -Wattribute-alias=2                               \
    -Wattribute-warning                               \
    -Wattributes                                      \
    -Wbool-compare                                    \
    -Wbool-operation                                  \
    -Wbuiltin-declaration-mismatch                    \
    -Wbuiltin-macro-redefined                         \
    -Wc++0x-compat                                    \
    -Wc++11-compat                                    \
    -Wc++14-compat                                    \
    -Wc++17-compat                                    \
    -Wc++1z-compat                                    \
    -Wc++20-compat                                    \
    -Wc++2a-compat                                    \
    -Wcannot-profile                                  \
    -Wcast-align                                      \
    -Wcast-align=strict                               \
    -Wcast-function-type                              \
    -Wcast-qual                                       \
    -Wcatch-value=3                                   \
    -Wchar-subscripts                                 \
    -Wclass-conversion                                \
    -Wclass-memaccess                                 \
    -Wclobbered                                       \
    -Wcomma-subscript                                 \
    -Wcomment                                         \
    -Wcomments                                        \
    -Wconditionally-supported                         \
    -Wconversion                                      \
    -Wconversion-null                                 \
    -Wcoverage-mismatch                               \
    -Wcpp                                             \
    -Wctor-dtor-privacy                               \
    -Wdangling-else                                   \
    -Wdate-time                                       \
    -Wdelete-incomplete                               \
    -Wdelete-non-virtual-dtor                         \
    -Wdeprecated                                      \
    -Wdeprecated-copy                                 \
    -Wdeprecated-copy-dtor                            \
    -Wdeprecated-declarations                         \
    -Wdisabled-optimization                           \
    -Wdiv-by-zero                                     \
    -Wdouble-promotion                                \
    -Wduplicated-branches                             \
    -Wduplicated-cond                                 \
    -Weffc++                                          \
    -Wempty-body                                      \
    -Wendif-labels                                    \
    -Wenum-compare                                    \
    -Wexpansion-to-defined                            \
    -Wextra                                           \
    -Wextra-semi                                      \
    -Wfloat-conversion                                \
    -Wfloat-equal                                     \
    -Wformat -Wformat-contains-nul                    \
    -Wformat -Wformat-extra-args                      \
    -Wformat -Wformat-nonliteral                      \
    -Wformat -Wformat-security                        \
    -Wformat -Wformat-y2k                             \
    -Wformat -Wformat-zero-length                     \
    -Wformat-diag                                     \
    -Wformat-overflow=2                               \
    -Wformat-signedness                               \
    -Wformat-truncation=2                             \
    -Wformat=2                                        \
    -Wframe-address                                   \
    -Wfree-nonheap-object                             \
    -Whsa                                             \
    -Wif-not-aligned                                  \
    -Wignored-attributes                              \
    -Wignored-qualifiers                              \
    -Wimplicit-fallthrough=5                          \
    -Winaccessible-base                               \
    -Winherited-variadic-ctor                         \
    -Winit-list-lifetime                              \
    -Winit-self                                       \
    -Winline                                          \
    -Wint-in-bool-context                             \
    -Wint-to-pointer-cast                             \
    -Winvalid-memory-model                            \
    -Winvalid-offsetof                                \
    -Winvalid-pch                                     \
    -Wliteral-suffix                                  \
    -Wlogical-not-parentheses                         \
    -Wlogical-op                                      \
    -Wno-long-long                                       \
    -Wlto-type-mismatch                               \
    -Wmain                                            \
    -Wmaybe-uninitialized                             \
    -Wmemset-elt-size                                 \
    -Wmemset-transposed-args                          \
    -Wmisleading-indentation                          \
    -Wmismatched-tags                                 \
    -Wmissing-attributes                              \
    -Wmissing-braces                                  \
    -Wno-missing-declarations                            \
    -Wmissing-field-initializers                      \
    -Wmissing-include-dirs                            \
    -Wmissing-profile                                 \
    -Wmultichar                                       \
    -Wmultiple-inheritance                            \
    -Wmultistatement-macros                           \
    -Wno-namespaces                                      \
    -Wnarrowing                                       \
    -Wno-noexcept                                        \
    -Wnoexcept-type                                   \
    -Wnon-template-friend                             \
    -Wnon-virtual-dtor                                \
    -Wnonnull                                         \
    -Wnonnull-compare                                 \
    -Wnonportable-cfstrings                           \
    -Wnormalized=nfkc                                 \
    -Wnull-dereference                                \
    -Wodr                                             \
    -Wold-style-cast                                  \
    -Wopenmp-simd                                     \
    -Woverflow                                        \
    -Woverlength-strings                              \
    -Woverloaded-virtual                              \
    -Wpacked                                          \
    -Wpacked-bitfield-compat                          \
    -Wpacked-not-aligned                              \
    -Wno-padded                                          \
    -Wparentheses                                     \
    -Wpedantic                                        \
    -Wpessimizing-move                                \
    -Wplacement-new=2                                 \
    -Wpmf-conversions                                 \
    -Wpointer-arith                                   \
    -Wpointer-compare                                 \
    -Wpragmas                                         \
    -Wprio-ctor-dtor                                  \
    -Wpsabi                                           \
    -Wredundant-decls                                 \
    -Wredundant-move                                  \
    -Wredundant-tags                                  \
    -Wregister                                        \
    -Wreorder                                         \
    -Wrestrict                                        \
    -Wreturn-local-addr                               \
    -Wreturn-type                                     \
    -Wscalar-storage-order                            \
    -Wsequence-point                                  \
    -Wshadow=compatible-local                         \
    -Wshadow=global                                   \
    -Wshadow=local                                    \
    -Wshift-count-negative                            \
    -Wshift-count-overflow                            \
    -Wshift-negative-value                            \
    -Wshift-overflow=2                                \
    -Wsign-compare                                    \
    -Wsign-conversion                                 \
    -Wsign-promo                                      \
    -Wsized-deallocation                              \
    -Wsizeof-array-argument                           \
    -Wsizeof-pointer-div                              \
    -Wsizeof-pointer-memaccess                        \
    -Wstack-protector                                 \
    -Wstrict-aliasing                                 \
    -Wstrict-aliasing=3                               \
    -Wstrict-null-sentinel                            \
    -Wstrict-overflow                                 \
    -Wstrict-overflow=5                               \
    -Wstring-compare                                  \
    -Wstringop-overflow                               \
    -Wstringop-overflow=4                             \
    -Wstringop-truncation                             \
    -Wsubobject-linkage                               \
    -Wsuggest-attribute=cold                          \
    -Wsuggest-attribute=const                         \
    -Wsuggest-attribute=format                        \
    -Wsuggest-attribute=malloc                        \
    -Wsuggest-attribute=noreturn                      \
    -Wsuggest-attribute=pure                          \
    -Wsuggest-final-methods                           \
    -Wsuggest-final-types                             \
    -Wsuggest-override                                \
    -Wswitch                                          \
    -Wswitch-bool                                     \
    -Wswitch-default                                  \
    -Wno-switch-enum                                     \
    -Wswitch-outside-range                            \
    -Wswitch-unreachable                              \
    -Wsync-nand                                       \
    -Wsynth                                           \
    -Wno-system-headers                                  \
    -Wtautological-compare                            \
    -Wno-templates                                       \
    -Wterminate                                       \
    -Wtrampolines                                     \
    -Wtrigraphs                                       \
    -Wtype-limits                                     \
    -Wundef                                           \
    -Wuninitialized                                   \
    -Wunknown-pragmas                                 \
    -Wunreachable-code                                \
    -Wunsafe-loop-optimizations                       \
    -Wunused                                          \
    -Wunused-but-set-parameter                        \
    -Wunused-but-set-variable                         \
    -Wunused-const-variable=2                         \
    -Wunused-function                                 \
    -Wunused-label                                    \
    -Wno-unused-local-typedefs                           \
    -Wunused-macros                                   \
    -Wunused-parameter                                \
    -Wunused-result                                   \
    -Wunused-value                                    \
    -Wunused-variable                                 \
    -Wuseless-cast                                    \
    -Wvarargs                                         \
    -Wvariadic-macros                                 \
    -Wvector-operation-performance                    \
    -Wvirtual-inheritance                             \
    -Wvirtual-move-assign                             \
    -Wvla                                             \
    -Wvolatile                                        \
    -Wvolatile-register-var                           \
    -Wwrite-strings                                   \
    -Wzero-as-null-pointer-constant                   \
    -Wzero-length-bounds                              \
")

add_custom_target(ci_test_gcc
    COMMAND CXX=${GCC_TOOL} CXXFLAGS=${GCC_CXXFLAGS} ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Debug -S${PROJECT_SOURCE_DIR} -B${PROJECT_BINARY_DIR}/build_g++ -DJSON_BuildTests=ON -GNinja
    COMMAND ${CMAKE_COMMAND} --build ${PROJECT_BINARY_DIR}/build_g++
    COMMAND cd ${PROJECT_BINARY_DIR}/build_g++/test && ${CMAKE_CTEST_COMMAND} -j10
    COMMENT "Compile and test with GCC"
)

add_custom_target(ci_test_clang
    COMMAND CXX=${CLANG_TOOL} CXXFLAGS=${CLANG_CXXFLAGS} ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Debug -S${PROJECT_SOURCE_DIR} -B${PROJECT_BINARY_DIR}/build_clang -DJSON_BuildTests=ON -GNinja
    COMMAND ${CMAKE_COMMAND} --build ${PROJECT_BINARY_DIR}/build_clang
    COMMAND cd ${PROJECT_BINARY_DIR}/build_clang/test && ${CMAKE_CTEST_COMMAND} -j10
    COMMENT "Compile and test with Clang"
)

set(CLANG_ANALYZER_CHECKS "fuchsia.HandleChecker,nullability.NullableDereferenced,nullability.NullablePassedToNonnull,nullability.NullableReturnedFromNonnull,optin.cplusplus.UninitializedObject,optin.cplusplus.VirtualCall,optin.mpi.MPI-Checker,optin.osx.OSObjectCStyleCast,optin.osx.cocoa.localizability.EmptyLocalizationContextChecker,optin.osx.cocoa.localizability.NonLocalizedStringChecker,optin.performance.GCDAntipattern,optin.performance.Padding,optin.portability.UnixAPI,security.FloatLoopCounter,security.insecureAPI.DeprecatedOrUnsafeBufferHandling,security.insecureAPI.bcmp,security.insecureAPI.bcopy,security.insecureAPI.bzero,security.insecureAPI.rand,security.insecureAPI.strcpy,valist.CopyToSelf,valist.Uninitialized,valist.Unterminated,webkit.NoUncountedMemberChecker,webkit.RefCntblBaseVirtualDtor,core.CallAndMessage,core.DivideZero,core.NonNullParamChecker,core.NullDereference,core.StackAddressEscape,core.UndefinedBinaryOperatorResult,core.VLASize,core.uninitialized.ArraySubscript,core.uninitialized.Assign,core.uninitialized.Branch,core.uninitialized.CapturedBlockVariable,core.uninitialized.UndefReturn,cplusplus.InnerPointer,cplusplus.Move,cplusplus.NewDelete,cplusplus.NewDeleteLeaks,cplusplus.PlacementNew,cplusplus.PureVirtualCall,deadcode.DeadStores,nullability.NullPassedToNonnull,nullability.NullReturnedFromNonnull,osx.API,osx.MIG,osx.NumberObjectConversion,osx.OSObjectRetainCount,osx.ObjCProperty,osx.SecKeychainAPI,osx.cocoa.AtSync,osx.cocoa.AutoreleaseWrite,osx.cocoa.ClassRelease,osx.cocoa.Dealloc,osx.cocoa.IncompatibleMethodTypes,osx.cocoa.Loops,osx.cocoa.MissingSuperCall,osx.cocoa.NSAutoreleasePool,osx.cocoa.NSError,osx.cocoa.NilArg,osx.cocoa.NonNilReturnValue,osx.cocoa.ObjCGenerics,osx.cocoa.RetainCount,osx.cocoa.RunLoopAutoreleaseLeak,osx.cocoa.SelfInit,osx.cocoa.SuperDealloc,osx.cocoa.UnusedIvars,osx.cocoa.VariadicMethodTypes,osx.coreFoundation.CFError,osx.coreFoundation.CFNumber,osx.coreFoundation.CFRetainRelease,osx.coreFoundation.containers.OutOfBounds,osx.coreFoundation.containers.PointerSizedValues,security.insecureAPI.UncheckedReturn,security.insecureAPI.decodeValueOfObjCType,security.insecureAPI.getpw,security.insecureAPI.gets,security.insecureAPI.mkstemp,security.insecureAPI.mktemp,security.insecureAPI.vfork,unix.API,unix.Malloc,unix.MallocSizeof,unix.MismatchedDeallocator,unix.Vfork,unix.cstring.BadSizeArg,unix.cstring.NullArg")

add_custom_target(ci_test_clang_analyze
    COMMAND CXX=${CLANG_TOOL} ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Debug -S${PROJECT_SOURCE_DIR} -B${PROJECT_BINARY_DIR}/build_clang_analyze -DJSON_BuildTests=ON -GNinja
    COMMAND cd ${PROJECT_BINARY_DIR}/build_clang_analyze && ${SCAN_BUILD_TOOL} -enable-checker ${CLANG_ANALYZER_CHECKS} --use-c++=${CLANG_TOOL} -analyze-headers -o ${PROJECT_BINARY_DIR}/report ninja
    COMMENT "Compile and test with Clang Analyzer"
)

add_custom_target(ci_cppcheck
    COMMAND ${CPPCHECK_TOOL} --enable=warning --inline-suppr --inconclusive --force --std=c++11 ${PROJECT_SOURCE_DIR}/single_include/nlohmann/json.hpp --error-exitcode=1
    COMMENT "Check code with Cppcheck"
)

file(GLOB_RECURSE SRC_FILES ${PROJECT_SOURCE_DIR}/include/nlohmann/*.hpp)

add_custom_target(ci_cpplint
    COMMAND ${CMAKE_SOURCE_DIR}/third_party/cpplint/cpplint.py --filter=-whitespace,-legal,-runtime/references,-runtime/explicit --quiet --recursive ${SRC_FILES}
    COMMENT "Check code with cpplint"
)

add_custom_target(ci_clang_tidy
    COMMAND CXX=${CLANG_TOOL} ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Debug -S${PROJECT_SOURCE_DIR} -B${PROJECT_BINARY_DIR}/build_clang_tidy -DJSON_BuildTests=ON -DJSON_MultipleHeaders=ON -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_CLANG_TIDY=clang-tidy
    COMMAND ${CMAKE_COMMAND} --build ${PROJECT_BINARY_DIR}/build_clang_tidy
    COMMENT "Check code with Clang-Tidy"
)

add_custom_target(ci_pvs_studio
    COMMAND CXX=${CLANG_TOOL} ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE=Debug -S${PROJECT_SOURCE_DIR} -B${PROJECT_BINARY_DIR}/build_pvs_studio -DJSON_BuildTests=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    COMMAND cd ${PROJECT_BINARY_DIR}/build_pvs_studio && ${PVS_STUDIO_ANALYZER_TOOL} analyze -j 10
    COMMAND cd ${PROJECT_BINARY_DIR}/build_pvs_studio && ${PLOG_CONVERTER_TOOL} -a'GA:1,2;64:1;CS' -t fullhtml PVS-Studio.log -o pvs
    COMMENT "Check code with PVS Studio"
)

add_custom_target(ci_clean
    COMMAND rm -fr ${PROJECT_BINARY_DIR}/build_g++ ${PROJECT_BINARY_DIR}/build_clang ${PROJECT_BINARY_DIR}/build_clang_analyze ${PROJECT_BINARY_DIR}/build_clang_tidy ${PROJECT_BINARY_DIR}/build_pvs_studio
    COMMENT "Clean generated directories"
)
