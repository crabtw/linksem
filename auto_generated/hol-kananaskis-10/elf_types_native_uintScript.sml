(*Generated by Lem from elf_types_native_uint.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_numTheory lem_basic_classesTheory lem_boolTheory lem_stringTheory lem_assert_extraTheory showTheory missing_pervasivesTheory errorTheory byte_sequenceTheory endiannessTheory elf_localTheory integer_wordLib;

val _ = numLib.prefer_num();



val _ = new_theory "elf_types_native_uint"

(*open import Basic_classes*)
(*open import Bool*)
(*open import Num*)
(*open import String*)
(*open import Assert_extra*)

(*open import Endianness*)

(*open import Byte_sequence*)
(*open import Error*)
(*open import Missing_pervasives*)
(*open import Show*)

(*open import {isabelle} `$ISABELLE_HOME/src/HOL/Word/Word`*)
(*open import {isabelle} `Elf_Types_Local`*)

(*open import {hol} `integer_wordLib`*)
(*open import {hol} `elf_localTheory`*)

(** unsigned char type and bindings *)

(*type unsigned_char*)

(** [string_of_unsigned_char uc] provides a string representation of unsigned
  * char [uc] (in base 10).
  *)
(*val string_of_unsigned_char : unsigned_char -> string*)

(** [natural_of_unsigned_char uc] converts an unsigned char [uc] into a natural.
  *)
(*val natural_of_unsigned_char : unsigned_char -> natural*)

(** [unsigned_char_of_natural i] converts a [natural] into an unsigned char, wrapping
  * around if the size of the nat exceeds the storage capacity of an unsigned
  * char.
  *)
(*val unsigned_char_of_natural : natural -> unsigned_char*)

(** [unsigned_char_land uc0 uc1] bitwise ANDs two unsigned chars, [uc0] and [uc1]
  * together.
  *)
(*val unsigned_char_land   : unsigned_char -> unsigned_char -> unsigned_char*)

(** [unsigned_char_lor uc0 uc1] bitwise OR two unsigned chars, [uc0] and [uc1]
  * together.
  *)
(*val unsigned_char_lor   : unsigned_char -> unsigned_char -> unsigned_char*)

(** [unsigned_char_lshift uc n] performs a left bitshift of [n] places on unsigned
  * char [uc].
  *)
(*val unsigned_char_lshift : unsigned_char -> nat -> unsigned_char*)

(** [unsigned_char_rshift uc n] performs a right bitshift of [n] places on unsigned
  * char [uc].
  *)
(*val unsigned_char_rshift : unsigned_char -> nat -> unsigned_char*)

(** [unsigned_char_plus uc0 uc1] adds two unsigned chars, [uc0] and [uc1].
  *)
(*val unsigned_char_plus   : unsigned_char -> unsigned_char -> unsigned_char*)

(*val unsigned_char_of_byte : byte -> unsigned_char*)

val _ = Define `
 (natural_of_byte b=     
(w2n (id b)))`;


(** [read_unsigned_char end bs0] reads an unsigned char from byte_sequence [bs0]
  * assuming endianness [end].  Returns the unsigned char and the remainder of
  * the byte_sequence.  Fails if an unsigned char cannot be read from the byte_sequence,
  * e.g. if [bs0] is too small.
  *)
(*val read_unsigned_char : endianness -> byte_sequence -> error (unsigned_char * byte_sequence)*)
val _ = Define `
 (read_unsigned_char endian bs0=  
 (byte_sequence$read_char bs0 >>= (\ (u1, bs1) . 
  return (id u1, bs1))))`;


(*val byte_of_unsigned_char : unsigned_char -> byte*)

(*val bytes_of_unsigned_char : unsigned_char -> list byte*)
val _ = Define `
 (bytes_of_unsigned_char u=  ([id u]))`;


(*val equal_unsigned_char  : unsigned_char -> unsigned_char -> bool*)

val _ = Define `
(instance_Show_Show_Elf_types_native_uint_unsigned_char_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** ELF address type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)

(*type elf32_addr*)

(*val string_of_elf32_addr : elf32_addr -> string*)

(*val natural_of_elf32_addr : elf32_addr -> natural*)

(*val elf32_addr_of_natural : natural -> elf32_addr*)

(*val elf32_addr_of_quad : byte -> byte -> byte -> byte -> elf32_addr*)

(*val read_elf32_addr : endianness -> byte_sequence -> error (elf32_addr * byte_sequence)*)
val _ = Define `
 (read_elf32_addr endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_4_bytes_le bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_4_bytes_be bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
  )))`;


(*val equal_elf32_addr : elf32_addr -> elf32_addr -> bool*)

(*val quad_of_elf32_addr : elf32_addr -> (byte * byte * byte * byte)*)

(*val bytes_of_elf32_addr : endianness -> elf32_addr -> list byte*)
val _ = Define `
 (bytes_of_elf32_addr endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b0; b1; b2; b3]
    | Big    =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf32_addr_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** elf64_addr type and bindings *)

(*type elf64_addr*)

(*val string_of_elf64_addr : elf64_addr -> string*)

(*val natural_of_elf64_addr : elf64_addr -> natural*)

(*val elf64_addr_of_natural : natural -> elf64_addr*)

(*val elf64_addr_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_addr*)

(*val read_elf64_addr : endianness -> byte_sequence -> error (elf64_addr * byte_sequence)*)
val _ = Define `
 (read_elf64_addr endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_8_bytes_le bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (uint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_8_bytes_be bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (uint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
  )))`;


(*val equal_elf64_addr : elf64_addr -> elf64_addr -> bool*)

(*val oct_of_elf64_addr : elf64_addr -> (byte * byte * byte * byte * byte * byte * byte * byte)*)

(*val bytes_of_elf64_addr : endianness -> elf64_addr -> list byte*)
val _ = Define `
 (bytes_of_elf64_addr endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_uint64 w) in
        [b0; b1; b2; b3; b4; b5; b6; b7]
    | Big    =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_uint64 w) in
        [b7; b6; b5; b4; b3; b2; b1; b0]
  )))`;


(*val elf64_addr_minus : elf64_addr -> elf64_addr -> elf64_addr*)

(*val elf64_addr_rshift : elf64_addr -> nat -> elf64_addr*)

(*val elf64_addr_lshift : elf64_addr -> nat -> elf64_addr*)

(*val elf64_addr_land : elf64_addr -> elf64_addr -> elf64_addr*)

(*val elf64_addr_lor : elf64_addr -> elf64_addr -> elf64_addr*)

val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf64_addr_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** ELF half word type:
  * 2 byte unsigned type on 32-bit architectures.
  * 2 byte unsigned type on 64-bit architectures.
  *)

(*type elf32_half*)

(*val string_of_elf32_half : elf32_half -> string*)

(*val elf32_half_of_dual : byte -> byte -> elf32_half*)

(*val read_elf32_half : endianness -> byte_sequence -> error (elf32_half * byte_sequence)*)
val _ = Define `
 (read_elf32_half endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_2_bytes_le bs0 >>= (\ ((b1, b2), bs1) . 
      return (uint16_of_dual b2 b1, bs1))
    | Big    =>
      byte_sequence$read_2_bytes_be bs0 >>= (\ ((b1, b2), bs1) . 
      return (uint16_of_dual b2 b1, bs1))
  )))`;


(*val natural_of_elf32_half : elf32_half -> natural*)

(*val equal_elf32_half : elf32_half -> elf32_half -> bool*)

(*val dual_of_elf32_half : elf32_half -> (byte * byte)*)

(*val bytes_of_elf32_half : endianness -> elf32_half -> list byte*)
val _ = Define `
 (bytes_of_elf32_half endian h=  
 ((case endian of
      Little =>
      let (b0, b1) = (dual_of_uint16 h) in
        [b0; b1]
    | Big    =>
      let (b0, b1) = (dual_of_uint16 h) in
        [b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf32_half_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** elf64_half type and bindings *)

(*type elf64_half*)

(*val string_of_elf64_half : elf64_half -> string*)

(*val elf64_half_of_dual : byte -> byte -> elf64_half*)

(*val read_elf64_half : endianness -> byte_sequence -> error (elf64_half * byte_sequence)*)
val _ = Define `
 (read_elf64_half endian bs0=  
 ((case endian of
      Big =>
      byte_sequence$read_2_bytes_be bs0 >>= (\ ((b1, b2), bs1) . 
      return (uint16_of_dual b2 b1, bs1))
    | Little =>
      byte_sequence$read_2_bytes_le bs0 >>= (\ ((b1, b2), bs1) . 
      return (uint16_of_dual b2 b1, bs1))
  )))`;


(*val natural_of_elf64_half : elf64_half -> natural*)

(*val elf64_half_of_natural : natural -> elf64_half*)

(*val equal_elf64_half : elf64_half -> elf64_half -> bool*)

(*val dual_of_elf64_half : elf64_half -> (byte * byte)*)

(*val bytes_of_elf64_half : endianness -> elf64_half -> list byte*)
val _ = Define `
 (bytes_of_elf64_half endian w=  
 ((case endian of
      Big =>
      let (b0, b1) = (dual_of_uint16 w) in
        [b1; b0]
    | Little    =>
      let (b0, b1) = (dual_of_uint16 w) in
        [b0; b1]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf64_half_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(*
instance (Ord elf64_half)
    let compare = 
    let (<) = 
    let (<=) = 
    let (>) = 
    let (>=) = 
end
*)

(** ELF offset type:
  * 4 byte unsigned type on 32-bit architectures.
  * 8 byte unsigned type on 64-bit architectures.
  *)

(*type elf32_off*)

(*val string_of_elf32_off : elf32_off -> string*)

(*val natural_of_elf32_off : elf32_off -> natural*)

(*val elf32_off_of_natural : natural -> elf32_off*)

(*val elf32_off_of_quad : byte -> byte -> byte -> byte -> elf32_off*)

(*val read_elf32_off : endianness -> byte_sequence -> error (elf32_off * byte_sequence)*)
val _ = Define `
 (read_elf32_off endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_4_bytes_le bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_4_bytes_be bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
  )))`;


(*val equal_elf32_off : elf32_off -> elf32_off -> bool*)

(*val quad_of_elf32_off : elf32_off -> (byte * byte * byte * byte)*)

(*val bytes_of_elf32_off : endianness -> elf32_off -> list byte*)
val _ = Define `
 (bytes_of_elf32_off endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b0; b1; b2; b3]
    | Big    =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf32_off_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** elf64_off type and bindings *)

(*type elf64_off*)

(*val string_of_elf64_off : elf64_off -> string*)

(*val natural_of_elf64_off : elf64_off -> natural*)

(*val elf64_off_of_natural : natural -> elf64_off*)

(*val elf64_off_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_off*)

(*val read_elf64_off : endianness -> byte_sequence -> error (elf64_off * byte_sequence)*)
val _ = Define `
 (read_elf64_off endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_8_bytes_le bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (uint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_8_bytes_be bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (uint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
  )))`;


(*val equal_elf64_off : elf64_off -> elf64_off -> bool*)

(*val oct_of_elf64_off : elf64_off -> (byte * byte * byte * byte * byte * byte * byte * byte)*)

(*val bytes_of_elf64_off : endianness -> elf64_off -> list byte*)
val _ = Define `
 (bytes_of_elf64_off endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_uint64 w) in
        [b0; b1; b2; b3; b4; b5; b6; b7]
    | Big    =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_uint64 w) in
        [b7; b6; b5; b4; b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf64_off_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** ELF word type:
  * 4 byte unsigned type on 32-bit architectures.
  * 4 byte unsigned type on 64-bit architectures.
  *)

(*type elf32_word*)

(*val string_of_elf32_word : elf32_word -> string*)

(*val natural_of_elf32_word : elf32_word -> natural*)

(*val elf32_word_of_natural : natural -> elf32_word*)

(*val elf32_word_land : elf32_word -> elf32_word -> elf32_word*)

(*val elf32_word_rshift : elf32_word -> nat -> elf32_word*)

(*val elf32_word_of_quad : byte -> byte -> byte -> byte -> elf32_word*)

(*val read_elf32_word : endianness -> byte_sequence -> error (elf32_word * byte_sequence)*)
val _ = Define `
 (read_elf32_word endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_4_bytes_le bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_4_bytes_be bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
  )))`;


(*val unsigned_char_of_elf32_word : elf32_word -> unsigned_char*)

(*val equal_elf32_word : elf32_word -> elf32_word -> bool*)

(*val quad_of_elf32_word : elf32_word -> (byte * byte * byte * byte)*)

(*val bytes_of_elf32_word : endianness -> elf32_word -> list byte*)
val _ = Define `
 (bytes_of_elf32_word endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b0; b1; b2; b3]
    | Big    =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf32_word_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** elf64_word type and bindings *)

(*type elf64_word*)

(*val string_of_elf64_word : elf64_word -> string*)

(*val natural_of_elf64_word : elf64_word -> natural*)

(*val elf64_word_of_natural : natural -> elf64_word*)

(*val elf64_word_land : elf64_word -> elf64_word -> elf64_word*)

(*val elf64_word_of_quad : byte -> byte -> byte -> byte -> elf64_word*)

(*val read_elf64_word : endianness -> byte_sequence -> error (elf64_word * byte_sequence)*)
val _ = Define `
 (read_elf64_word endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_4_bytes_le bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_4_bytes_be bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (uint32_of_quad b4 b3 b2 b1, bs1))
  )))`;


(*val equal_elf64_word : elf64_word -> elf64_word -> bool*)

(*val quad_of_elf64_word : elf64_word -> (byte * byte * byte * byte)*)

(*val bytes_of_elf64_word : endianness -> elf64_word -> list byte*)
val _ = Define `
 (bytes_of_elf64_word endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b0; b1; b2; b3]
    | Big    =>
      let (b0, b1, b2, b3) = (quad_of_uint32 w) in
        [b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf64_word_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** ELF signed word type:
  * 4 byte signed type on 32-bit architectures.
  * 4 byte signed type on 64-bit architectures.
  *)

(*type elf32_sword*)

(*val string_of_elf32_sword : elf32_sword -> string*)

(*val integer_of_elf32_sword : elf32_sword -> integer*)

(*val elf32_sword_of_quad : byte -> byte -> byte -> byte -> elf32_sword*)

(*val read_elf32_sword : endianness -> byte_sequence -> error (elf32_sword * byte_sequence)*)
val _ = Define `
 (read_elf32_sword endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_4_bytes_le bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (sint32_of_quad b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_4_bytes_be bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (sint32_of_quad b4 b3 b2 b1, bs1))
  )))`;


(*val quad_of_elf32_sword : elf32_sword -> (byte * byte * byte * byte)*)

(*val bytes_of_elf32_sword : endianness -> elf32_sword -> list byte*)
val _ = Define `
 (bytes_of_elf32_sword endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3) = (quad_of_sint32 w) in
        [b0; b1; b2; b3]
    | Big    =>
      let (b0, b1, b2, b3) = (quad_of_sint32 w) in
        [b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf32_sword_dict= (<|

  show_method := (num_to_dec_string o w2i)|>))`;


(** elf64_sword type and bindings *)

(*type elf64_sword*)

(*val string_of_elf64_sword : elf64_sword -> string*)

(*val integer_of_elf64_sword : elf64_sword -> integer*)

(*val elf64_sword_of_quad : byte -> byte -> byte -> byte -> elf64_sword*)

(*val read_elf64_sword : endianness -> byte_sequence -> error (elf64_sword * byte_sequence)*)
val _ = Define `
 (read_elf64_sword endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_4_bytes_le bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (sint32_of_quad b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_4_bytes_be bs0 >>= (\ ((b1, b2, b3, b4), bs1) . 
      return (sint32_of_quad b4 b3 b2 b1, bs1))
  )))`;


(*val quad_of_elf64_sword : elf64_sword -> (byte * byte * byte * byte)*)

(*val bytes_of_elf64_sword : endianness -> elf64_sword -> list byte*)
val _ = Define `
 (bytes_of_elf64_sword endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3) = (quad_of_sint32 w) in
        [b0; b1; b2; b3]
    | Big    =>
      let (b0, b1, b2, b3) = (quad_of_sint32 w) in
        [b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf64_sword_dict= (<|

  show_method := (num_to_dec_string o w2i)|>))`;


(** ELF extra wide word type:
  * 8 byte unsigned type on 64-bit architectures.
  *)

(*type elf64_xword*)

(*val string_of_elf64_xword : elf64_xword -> string*)

(*val natural_of_elf64_xword : elf64_xword -> natural*)

(*val elf64_xword_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_xword*)

(*val read_elf64_xword : endianness -> byte_sequence -> error (elf64_xword * byte_sequence)*)
val _ = Define `
 (read_elf64_xword endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_8_bytes_le bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (uint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_8_bytes_be bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (uint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
  )))`;


(*val elf64_xword_rshift : elf64_xword -> nat -> elf64_xword*)

(*val elf64_xword_lshift : elf64_xword -> nat -> elf64_xword*)

(*val elf64_xword_land : elf64_xword -> elf64_xword -> elf64_xword*)

(*val elf64_xword_lor : elf64_xword -> elf64_xword -> elf64_xword*)

(*val elf64_xword_lxor : elf64_xword -> elf64_xword -> elf64_xword*)

(*val elf64_xword_of_natural : natural -> elf64_xword*)

(*val equal_elf64_xword : elf64_xword -> elf64_xword -> bool*)

(*val oct_of_elf64_xword : elf64_xword -> (byte * byte * byte * byte * byte * byte * byte * byte)*)

(*val bytes_of_elf64_xword : endianness -> elf64_xword -> list byte*)
val _ = Define `
 (bytes_of_elf64_xword endian x=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_uint64 x) in
        [b0; b1; b2; b3; b4; b5; b6; b7]
    | Big    =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_uint64 x) in
        [b7; b6; b5; b4; b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf64_xword_dict= (<|

  show_method := (num_to_dec_string o w2n)|>))`;


(** ELF signed extra wide word type:
  * 8 byte signed type on 64-bit architectures.
  *)

(*type elf64_sxword*)

(*val string_of_elf64_sxword : elf64_sxword -> string*)

(*val integer_of_elf64_sxword : elf64_sxword -> integer*)

(*val elf64_sxword_of_integer : integer -> elf64_sxword*)

(*val elf64_sxword_of_oct : byte -> byte -> byte -> byte -> byte -> byte -> byte -> byte -> elf64_sxword*)

(*val read_elf64_sxword : endianness -> byte_sequence -> error (elf64_sxword * byte_sequence)*)
val _ = Define `
 (read_elf64_sxword endian bs0=  
 ((case endian of
      Little =>
      byte_sequence$read_8_bytes_le bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (sint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
    | Big    =>
      byte_sequence$read_8_bytes_be bs0 >>= (\ ((b1, b2, b3, b4, b5, b6, b7, b8), bs1) . 
      return (sint64_of_oct b8 b7 b6 b5 b4 b3 b2 b1, bs1))
  )))`;


(*val oct_of_elf64_sxword : elf64_sxword -> (byte * byte * byte * byte * byte * byte * byte * byte)*)

(*val bytes_of_elf64_sxword : endianness -> elf64_sxword -> list byte*)
val _ = Define `
 (bytes_of_elf64_sxword endian w=  
 ((case endian of
      Little =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_sint64 w) in
        [b0; b1; b2; b3; b4; b5; b6; b7]
    | Big    =>
      let (b0, b1, b2, b3, b4, b5, b6, b7) = (oct_of_sint64 w) in
        [b7; b6; b5; b4; b3; b2; b1; b0]
  )))`;


val _ = Define `
(instance_Show_Show_Elf_types_native_uint_elf64_sxword_dict= (<|

  show_method := (num_to_dec_string o w2i)|>))`;


(*val natural_land : natural -> natural -> natural*)
val _ = Define `
 (natural_land m n=  
( 
  (* For Isabelle backend...*)w2n (word_and ((n2w : num -> 64 word) m) ((n2w : num -> 64 word) n))))`;


(*val natural_lor : natural -> natural -> natural*)
val _ = Define `
 (natural_lor m n=  
( 
  (* For Isabelle backend...*)w2n (word_or ((n2w : num -> 64 word) m) ((n2w : num -> 64 word) n))))`;


(*val natural_lxor : natural -> natural -> natural*)
val _ = Define `
 (natural_lxor m n=  
( 
  (* For Isabelle backend...*)w2n (word_xor ((n2w : num -> 64 word) m) ((n2w : num -> 64 word) n))))`;

val _ = export_theory()

