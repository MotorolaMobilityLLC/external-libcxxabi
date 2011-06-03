//===-------------------------- cxa_virtual.cpp ---------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is dual licensed under the MIT and the University of Illinois Open
// Source Licenses. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "cxxabi.h"

#include <stdio.h>
#include <stdlib.h>

namespace __cxxabiv1
{

extern "C"
{

LIBCXXABI_NORETURN
void __cxa_pure_virtual(void) {
    fputs("Pure virtual function called!\n", stderr);
    abort();
}

LIBCXXABI_NORETURN
void __cxa_deleted_virtual(void) {
    fputs("Deleted virtual function called!\n", stderr);
    abort();
}

}  // extern "C"

}  // abi
