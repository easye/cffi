;; CFFI-Grovel definitions for unix systems.
;; Liam Healy 2009-02-22 09:24:33EST libffi-unix.lisp
;; Time-stamp: <2011-09-10 22:25:10EDT libffi-unix.lisp>
;; $Id: $

(in-package #:cffi-fsbv)

#+linux
(define "_GNU_SOURCE")

;; When installed through Mac Ports, FSBV include files
;; will be found in /opt/local/include.
#+darwin
(cc-flags "-I/opt/local/include/")

#+darwin
(include "ffi/ffi.h")
#-darwin
(include "ffi.h")

(cenum status
 ((:OK "FFI_OK"))
 ((:bad-typedef "FFI_BAD_TYPEDEF"))
 ((:bad-abi "FFI_BAD_ABI")))

(cenum abi
 ((:default-abi "FFI_DEFAULT_ABI"))
 ((:sysv "FFI_SYSV"))
 ((:unix64 "FFI_UNIX64")))

(ctype ffi-abi "ffi_abi")

(ctype sizet "size_t")
(ctype ushort "unsigned short")
(ctype unsigned "unsigned")

(cstruct ffi-type "struct _ffi_type"
  (size    "size"     :type sizet)
  (alignment "alignment"     :type ushort)
  (type    "type"     :type ushort)
  (elements   "elements"   :type :pointer))

#|
;;; Will not compile
;;; error: invalid application of ‘sizeof’ to incomplete type ‘struct ffi_cif’ 
;;; When structs are defined with the name at the end, apparently they
;;; are intended to be "opaque types".
(cstruct ffi-cif "struct ffi_cif"
 (abi    "abi"     :type ffi-abi)
 (nargs "nargs"     :type unsigned)
 (arg-types    "arg_types"     :type :pointer)
 (return-type   "rtype"   :type :pointer)
 (bytes   "bytes"   :type :unsigned)
 (flags   "flags"   :type :unsigned))
|#

(constant (+type-void+ "FFI_TYPE_VOID"))
(constant (+type-int+ "FFI_TYPE_INT"))
(constant (+type-float+ "FFI_TYPE_FLOAT"))
(constant (+type-double+ "FFI_TYPE_DOUBLE"))
(constant (+type-longdouble+ "FFI_TYPE_LONGDOUBLE"))
(constant (+type-uint8+ "FFI_TYPE_UINT8"))
(constant (+type-sint8+ "FFI_TYPE_SINT8"))
(constant (+type-uint16+ "FFI_TYPE_UINT16"))
(constant (+type-sint16+ "FFI_TYPE_SINT16"))
(constant (+type-uint32+ "FFI_TYPE_UINT32"))
(constant (+type-sint32+ "FFI_TYPE_SINT32"))
(constant (+type-uint64+ "FFI_TYPE_UINT64"))
(constant (+type-sint64+ "FFI_TYPE_SINT64"))
(constant (+type-struct+ "FFI_TYPE_STRUCT"))
(constant (+type-pointer+ "FFI_TYPE_POINTER"))