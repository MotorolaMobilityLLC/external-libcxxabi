include(CheckLibraryExists)
include(CheckCCompilerFlag)
include(CheckCXXCompilerFlag)

# Check compiler flags
check_c_compiler_flag(-funwind-tables         LIBCXXABI_HAS_FUNWIND_TABLES)
check_cxx_compiler_flag(-fPIC                 LIBCXXABI_HAS_FPIC_FLAG)
check_cxx_compiler_flag(-fno-exceptions       LIBCXXABI_HAS_NO_EXCEPTIONS_FLAG)
check_cxx_compiler_flag(-fno-rtti             LIBCXXABI_HAS_NO_RTTI_FLAG)
check_cxx_compiler_flag(-fstrict-aliasing     LIBCXXABI_HAS_FSTRICT_ALIASING_FLAG)
check_cxx_compiler_flag(-nodefaultlibs        LIBCXXABI_HAS_NODEFAULTLIBS_FLAG)
check_cxx_compiler_flag(-nostdinc++           LIBCXXABI_HAS_NOSTDINCXX_FLAG)
check_cxx_compiler_flag(-Wall                 LIBCXXABI_HAS_WALL_FLAG)
check_cxx_compiler_flag(-W                    LIBCXXABI_HAS_W_FLAG)
check_cxx_compiler_flag(-Wno-unused-function  LIBCXXABI_HAS_WNO_UNUSED_FUNCTION_FLAG)
check_cxx_compiler_flag(-Wunused-variable     LIBCXXABI_HAS_WUNUSED_VARIABLE_FLAG)
check_cxx_compiler_flag(-Wunused-parameter    LIBCXXABI_HAS_WUNUSED_PARAMETER_FLAG)
check_cxx_compiler_flag(-Wstrict-aliasing     LIBCXXABI_HAS_WSTRICT_ALIASING_FLAG)
check_cxx_compiler_flag(-Wstrict-overflow     LIBCXXABI_HAS_WSTRICT_OVERFLOW_FLAG)
check_cxx_compiler_flag(-Wwrite-strings       LIBCXXABI_HAS_WWRITE_STRINGS_FLAG)
check_cxx_compiler_flag(-Wchar-subscripts     LIBCXXABI_HAS_WCHAR_SUBSCRIPTS_FLAG)
check_cxx_compiler_flag(-Wmismatched-tags     LIBCXXABI_HAS_WMISMATCHED_TAGS_FLAG)
check_cxx_compiler_flag(-Wmissing-braces      LIBCXXABI_HAS_WMISSING_BRACES_FLAG)
check_cxx_compiler_flag(-Wshorten-64-to-32    LIBCXXABI_HAS_WSHORTEN_64_TO_32_FLAG)
check_cxx_compiler_flag(-Wsign-conversion     LIBCXXABI_HAS_WSIGN_CONVERSION_FLAG)
check_cxx_compiler_flag(-Wsign-compare        LIBCXXABI_HAS_WSIGN_COMPARE_FLAG)
check_cxx_compiler_flag(-Wshadow              LIBCXXABI_HAS_WSHADOW_FLAG)
check_cxx_compiler_flag(-Wconversion          LIBCXXABI_HAS_WCONVERSION_FLAG)
check_cxx_compiler_flag(-Wnewline-eof         LIBCXXABI_HAS_WNEWLINE_EOF_FLAG)
check_cxx_compiler_flag(-Wundef               LIBCXXABI_HAS_WUNDEF_FLAG)
check_cxx_compiler_flag(-pedantic             LIBCXXABI_HAS_PEDANTIC_FLAG)
check_cxx_compiler_flag(-Werror               LIBCXXABI_HAS_WERROR_FLAG)
check_cxx_compiler_flag(-Wno-error            LIBCXXABI_HAS_WNO_ERROR_FLAG)
check_cxx_compiler_flag(/WX                   LIBCXXABI_HAS_WX_FLAG)
check_cxx_compiler_flag(/WX-                  LIBCXXABI_HAS_NO_WX_FLAG)
check_cxx_compiler_flag(/EHsc                 LIBCXXABI_HAS_EHSC_FLAG)
check_cxx_compiler_flag(/EHs-                 LIBCXXABI_HAS_NO_EHS_FLAG)
check_cxx_compiler_flag(/EHa-                 LIBCXXABI_HAS_NO_EHA_FLAG)
check_cxx_compiler_flag(/GR-                  LIBCXXABI_HAS_NO_GR_FLAG)
check_cxx_compiler_flag(-std=c++11            LIBCXXABI_HAS_STD_CXX11)

if(LIBCXXABI_HAS_STD_CXX11)
  list(APPEND CMAKE_CXX_FLAGS -std=c++11)
endif()

# Check libraries
check_library_exists(c fopen "" LIBCXXABI_HAS_C_LIB)
check_library_exists(dl dladdr "" LIBCXXABI_HAS_DL_LIB)
check_library_exists(pthread pthread_once "" LIBCXXABI_HAS_PTHREAD_LIB)
if (NOT LIBCXXABI_USE_COMPILER_RT)
  check_library_exists(gcc_s __gcc_personality_v0 "" LIBCXXABI_HAS_GCC_S_LIB)
endif ()
check_library_exists(c __cxa_thread_atexit_impl ""
  LIBCXXABI_HAS_CXA_THREAD_ATEXIT_IMPL)
