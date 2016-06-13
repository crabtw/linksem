chapter {* Generated by Lem from elf_symbol_table.lem. *}

theory "Elf_symbol_table" 

imports 
 	 Main
	 "../../lem-libs/isabelle-lib/Lem_num" 
	 "../../lem-libs/isabelle-lib/Lem_list" 
	 "../../lem-libs/isabelle-lib/Lem_set" 
	 "../../lem-libs/isabelle-lib/Lem_basic_classes" 
	 "../../lem-libs/isabelle-lib/Lem_bool" 
	 "../../lem-libs/isabelle-lib/Lem_maybe" 
	 "../../lem-libs/isabelle-lib/Lem_string" 
	 "Show" 
	 "Missing_pervasives" 
	 "Error" 
	 "Byte_sequence" 
	 "Endianness" 
	 "Elf_types_native_uint" 
	 "../../lem-libs/isabelle-lib/Lem_tuple" 
	 "Elf_header" 
	 "String_table" 

begin 

(** [elf_symbol_table] provides types, functions and other definitions for
  * working with ELF symbol tables.
  *)

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Maybe*)
(*open import Num*)
(*open import String*)
(*open import Tuple*)
(*import Set*)

(*open import Byte_sequence*)
(*open import Error*)
(*open import Missing_pervasives*)
(*open import Show*)

(*open import Elf_header*)
(*open import Elf_types_native_uint*)
(*open import Endianness*)
(*open import String_table*)

(** Undefined symbol index *)

definition stn_undef  :: " nat "  where 
     " stn_undef = (( 0 :: nat))"


(** Symbol binding *)

(** Local symbols are not visible outside of the object file containing their
  * definition.
  *)
definition stb_local  :: " nat "  where 
     " stb_local = (( 0 :: nat))"


(** Global symbols are visible to all object files being combined.
  *)
definition stb_global  :: " nat "  where 
     " stb_global = (( 1 :: nat))"


(** Weak symbols resemble global symbols but their definitions have lower
  * precedence.
  *)
definition stb_weak  :: " nat "  where 
     " stb_weak = (( 2 :: nat))"


(** Values in the following range have reserved OS specific semantics.
  *)
definition stb_loos  :: " nat "  where 
     " stb_loos = (( 10 :: nat))"

definition stb_hios  :: " nat "  where 
     " stb_hios = (( 12 :: nat))"


(** Values in the following range have reserved processor specific semantics.
  *)
definition stb_loproc  :: " nat "  where 
     " stb_loproc = (( 13 :: nat))"

definition stb_hiproc  :: " nat "  where 
     " stb_hiproc = (( 15 :: nat))"


(** string_of_symbol_binding b os proc] produces a string representation of
  * binding [m] using printing functions [os] and [proc] for OS- and processor-
  * specific values respectively.
  * OCaml specific definition.
  *)
(*val string_of_symbol_binding : natural -> (natural -> string) -> (natural -> string) -> string*)

(** Symbol types *)

(** The symbol's type is not specified.
  *)
definition stt_notype  :: " nat "  where 
     " stt_notype = (( 0 :: nat))"


(** The symbol is associated with a data object such as a variable.
  *)
definition stt_object  :: " nat "  where 
     " stt_object = (( 1 :: nat))"


(** The symbol is associated with a function or other executable code.
  *)
definition stt_func  :: " nat "  where 
     " stt_func = (( 2 :: nat))"


(** The symbol is associated with a section.
  *)
definition stt_section  :: " nat "  where 
     " stt_section = (( 3 :: nat))"


(** Conventionally the symbol's value gives the name of the source file associated
  * with the object file.
  *)
definition stt_file  :: " nat "  where 
     " stt_file = (( 4 :: nat))"


(** The symbol is an uninitialised common block.
  *)
definition stt_common  :: " nat "  where 
     " stt_common = (( 5 :: nat))"


(** The symbol specified a Thread Local Storage (TLS) entity.
  *)
definition stt_tls  :: " nat "  where 
     " stt_tls = (( 6 :: nat))"


(** Values in the following range are reserved solely for OS-specific semantics.
  *)
definition stt_loos  :: " nat "  where 
     " stt_loos = (( 10 :: nat))"

definition stt_hios  :: " nat "  where 
     " stt_hios = (( 12 :: nat))"


(** Values in the following range are reserved solely for processor-specific
  * semantics.
  *)
definition stt_loproc  :: " nat "  where 
     " stt_loproc = (( 13 :: nat))"

definition stt_hiproc  :: " nat "  where 
     " stt_hiproc = (( 15 :: nat))"


(** [string_of_symbol_type sym os proc] produces a string representation of
  * symbol type [m] using [os] and [proc] to pretty-print values reserved for
  * OS- and processor-specific functionality.
  *)
(*val string_of_symbol_type : natural -> (natural -> string) -> (natural -> string) -> string*)
definition string_of_symbol_type  :: " nat \<Rightarrow>(nat \<Rightarrow> string)\<Rightarrow>(nat \<Rightarrow> string)\<Rightarrow> string "  where 
     " string_of_symbol_type m os proc = (
  if m = stt_notype then
    (''NOTYPE'')
  else if m = stt_object then
    (''OBJECT'')
  else if m = stt_func then
    (''FUNC'')
  else if m = stt_section then
    (''SECTION'')
  else if m = stt_file then
    (''FILE'')
  else if m = stt_common then
    (''COMMON'')
  else if m = stt_tls then
    (''TLS'')
  else if (m \<ge> stt_loos) \<and> (m \<le> stt_hios) then
    os m
  else if (m \<ge> stt_loproc) \<and> (m \<le> stt_hiproc) then
    proc m
  else
    (''Invalid symbol type''))"


(** Symbol visibility *)

(** The visibility of the symbol is as specified by the symbol's binding type.
  *)
definition stv_default  :: " nat "  where 
     " stv_default = (( 0 :: nat))"


(** The meaning of this visibility may be defined by processor supplements to
  * further constrain hidden symbols.
  *)
definition stv_internal  :: " nat "  where 
     " stv_internal = (( 1 :: nat))"


(** The symbol's name is not visible in other components.
  *)
definition stv_hidden  :: " nat "  where 
     " stv_hidden = (( 2 :: nat))"


(** The symbol is visible in other components but not pre-emptable.  That is,
  * references to the symbol in the same component resolve to this symbol even
  * if other symbols of the same name in other components would normally be
  * resolved to instead if we followed the normal rules of symbol resolution.
  *)
definition stv_protected  :: " nat "  where 
     " stv_protected = (( 3 :: nat))"


(** [string_of_symbol_visibility m] produces a string representation of symbol
  * visibility [m].
  *)
(*val string_of_symbol_visibility : natural -> string*)
definition string_of_symbol_visibility  :: " nat \<Rightarrow> string "  where 
     " string_of_symbol_visibility m = (
  if m = stv_default then
    (''DEFAULT'')
  else if m = stv_internal then
    (''INTERNAL'')
  else if m = stv_hidden then
    (''HIDDEN'')
  else if m = stv_protected then
    (''PROTECTED'')
  else
    (''Invalid symbol visibility''))"


(** Symbol table entry type *)

(** [elf32_symbol_table_entry] is an entry in a symbol table.
  *)
record elf32_symbol_table_entry =
  
 elf32_st_name  ::" uint32 "     (** Index into the object file's string table *)
   
 elf32_st_value ::" uint32 "     (** Gives the value of the associated symbol *)
   
 elf32_st_size  ::" uint32 "     (** Size of the associated symbol *)
   
 elf32_st_info  ::" Elf_Types_Local.unsigned_char "  (** Specifies the symbol's type and binding attributes *)
   
 elf32_st_other ::" Elf_Types_Local.unsigned_char "  (** Currently specifies the symbol's visibility *)
   
 elf32_st_shndx ::" uint16 "     (** Section header index symbol is defined with respect to *)
   


(** [elf32_symbol_table_entry_compare ent1 ent2] is an ordering-comparison function
  * for symbol table entries suitable for constructing sets, finite maps and other
  * ordered data structures from.
  *)
(*val elf32_symbol_table_entry_compare : elf32_symbol_table_entry ->
  elf32_symbol_table_entry -> ordering*)
definition elf32_symbol_table_entry_compare  :: " elf32_symbol_table_entry \<Rightarrow> elf32_symbol_table_entry \<Rightarrow> ordering "  where 
     " elf32_symbol_table_entry_compare ent1 ent2 = (    
 (sextupleCompare (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (unat(elf32_st_name   ent1), unat(elf32_st_value   ent1), 
        unat(elf32_st_size   ent1), unat(elf32_st_info   ent1), 
        unat(elf32_st_other   ent1), unat(elf32_st_shndx   ent1))
       (unat(elf32_st_name   ent2), unat(elf32_st_value   ent2), 
        unat(elf32_st_size   ent2), unat(elf32_st_info   ent2), 
        unat(elf32_st_other   ent2), unat(elf32_st_shndx   ent2))))"


definition instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict  :: "(elf32_symbol_table_entry)Ord_class "  where 
     " instance_Basic_classes_Ord_Elf_symbol_table_elf32_symbol_table_entry_dict = ((|

  compare_method = elf32_symbol_table_entry_compare,

  isLess_method = (\<lambda> f1 .  (\<lambda> f2 .  (elf32_symbol_table_entry_compare f1 f2 = LT))),

  isLessEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (elf32_symbol_table_entry_compare f1 f2) ({LT, EQ}))),

  isGreater_method = (\<lambda> f1 .  (\<lambda> f2 .  (elf32_symbol_table_entry_compare f1 f2 = GT))),

  isGreaterEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (elf32_symbol_table_entry_compare f1 f2) ({GT, EQ})))|) )"

   
(** [elf64_symbol_table_entry] is an entry in a symbol table.
  *)
record elf64_symbol_table_entry =
  
 elf64_st_name  ::" uint32 "     (** Index into the object file's string table *)
   
 elf64_st_info  ::" Elf_Types_Local.unsigned_char "  (** Specifies the symbol's type and binding attributes *)
   
 elf64_st_other ::" Elf_Types_Local.unsigned_char "  (** Currently specifies the symbol's visibility *)
   
 elf64_st_shndx ::" uint16 "     (** Section header index symbol is defined with respect to *)
   
 elf64_st_value ::" Elf_Types_Local.uint64 "     (** Gives the value of the associated symbol *)
   
 elf64_st_size  ::" uint64 "    (** Size of the associated symbol *)
   


(** [elf64_symbol_table_entry_compare ent1 ent2] is an ordering-comparison function
  * for symbol table entries suitable for constructing sets, finite maps and other
  * ordered data structures from.
  *)
(*val elf64_symbol_table_entry_compare : elf64_symbol_table_entry -> elf64_symbol_table_entry ->
  ordering*)
definition elf64_symbol_table_entry_compare  :: " elf64_symbol_table_entry \<Rightarrow> elf64_symbol_table_entry \<Rightarrow> ordering "  where 
     " elf64_symbol_table_entry_compare ent1 ent2 = (    
 (sextupleCompare (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (genericCompare (op<) (op=)) (unat(elf64_st_name   ent1), unat(elf64_st_value   ent1), 
        unat(elf64_st_size   ent1), unat(elf64_st_info   ent1), 
        unat(elf64_st_other   ent1), unat(elf64_st_shndx   ent1))
       (unat(elf64_st_name   ent2), unat(elf64_st_value   ent2), 
        unat(elf64_st_size   ent2), unat(elf64_st_info   ent2), 
        unat(elf64_st_other   ent2), unat(elf64_st_shndx   ent2))))"


definition instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict  :: "(elf64_symbol_table_entry)Ord_class "  where 
     " instance_Basic_classes_Ord_Elf_symbol_table_elf64_symbol_table_entry_dict = ((|

  compare_method = elf64_symbol_table_entry_compare,

  isLess_method = (\<lambda> f1 .  (\<lambda> f2 .  (elf64_symbol_table_entry_compare f1 f2 = LT))),

  isLessEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (elf64_symbol_table_entry_compare f1 f2) ({LT, EQ}))),

  isGreater_method = (\<lambda> f1 .  (\<lambda> f2 .  (elf64_symbol_table_entry_compare f1 f2 = GT))),

  isGreaterEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (elf64_symbol_table_entry_compare f1 f2) ({GT, EQ})))|) )"

  
type_synonym elf32_symbol_table =" elf32_symbol_table_entry
  list "
  
type_synonym elf64_symbol_table =" elf64_symbol_table_entry
  list "

(** Extraction of symbol table data *)

(* Functions below common to 32- and 64-bit! *)

(** [extract_symbol_binding u] extracts a symbol table entry's symbol binding.  [u]
  * in this case is the [elfXX_st_info] field from a symbol table entry.
  *)
(*val extract_symbol_binding : unsigned_char -> natural*)
definition extract_symbol_binding  :: " Elf_Types_Local.unsigned_char \<Rightarrow> nat "  where 
     " extract_symbol_binding entry = (
  unat (Elf_Types_Local.unsigned_char_rshift entry(( 4 :: nat))))"

  
(** [extract_symbol_type u] extracts a symbol table entry's symbol type.  [u]
  * in this case is the [elfXX_st_info] field from a symbol table entry.
  *)
(*val extract_symbol_type : unsigned_char -> natural*)
definition extract_symbol_type  :: " Elf_Types_Local.unsigned_char \<Rightarrow> nat "  where 
     " extract_symbol_type entry = (
  unat (Elf_Types_Local.unsigned_char_land entry (Elf_Types_Local.unsigned_char_of_nat(( 15 :: nat)))))"
 (* 0xf *)

(** [get_symbol_info u] extracts a symbol table entry's symbol info.  [u]
  * in this case is the [elfXX_st_info] field from a symbol table entry.
  *)
(*val make_symbol_info : natural -> natural -> unsigned_char*)
definition make_symbol_info  :: " nat \<Rightarrow> nat \<Rightarrow> Elf_Types_Local.unsigned_char "  where 
     " make_symbol_info binding symtype = (
  Elf_Types_Local.unsigned_char_plus
    (Elf_Types_Local.unsigned_char_lshift (Elf_Types_Local.unsigned_char_of_nat binding)(( 4 :: nat)))
    (Elf_Types_Local.unsigned_char_land (Elf_Types_Local.unsigned_char_of_nat symtype)
      (Elf_Types_Local.unsigned_char_of_nat(( 15 :: nat)))))"
 (*0xf*)  

(** [get_symbol_visibility u] extracts a symbol table entry's symbol visibility.  [u]
  * in this case is the [elfXX_st_other] field from a symbol table entry.
  *)
(*val get_symbol_visibility : unsigned_char -> natural*)
definition get_symbol_visibility  :: " Elf_Types_Local.unsigned_char \<Rightarrow> nat "  where 
     " get_symbol_visibility info = (
  unat (Elf_Types_Local.unsigned_char_land info (Elf_Types_Local.unsigned_char_of_nat(( 3 :: nat)))))"
 (* 0x3*)
  
(** [make_symbol_other m] converts a natural [m] to an unsigned char suitable
  * for use in a symbol table entry's other field.
  * XXX: WHY?
  *)
(*val make_symbol_other : natural -> unsigned_char*)
definition make_symbol_other  :: " nat \<Rightarrow> Elf_Types_Local.unsigned_char "  where 
     " make_symbol_other visibility = (
  Elf_Types_Local.unsigned_char_of_nat visibility )"

  
(** [is_elf32_shndx_too_large ent] tests whether the symbol table entry's
  * [shndx] field is equal to SHN_XINDEX, in which case the real value is stored
  * elsewhere.
  *)
(*val is_elf32_shndx_too_large : elf32_symbol_table_entry -> bool*)
definition is_elf32_shndx_too_large  :: " elf32_symbol_table_entry \<Rightarrow> bool "  where 
     " is_elf32_shndx_too_large syment = (
  unat(elf32_st_shndx   syment) = shn_xindex )"

  
(** [is_elf64_shndx_too_large ent] tests whether the symbol table entry's
  * [shndx] field is equal to SHN_XINDEX, in which case the real value is stored
  * elsewhere.
  *)
(*val is_elf64_shndx_too_large : elf64_symbol_table_entry -> bool*)
definition is_elf64_shndx_too_large  :: " elf64_symbol_table_entry \<Rightarrow> bool "  where 
     " is_elf64_shndx_too_large syment = (
  unat(elf64_st_shndx   syment) = shn_xindex )"


(** NULL tests *)

(** [is_elf32_null_entry ent] tests whether [ent] is a null symbol table entry,
  * i.e. all fields set to [0].
  *)
(*val is_elf32_null_entry : elf32_symbol_table_entry -> bool*)
definition is_elf32_null_entry  :: " elf32_symbol_table_entry \<Rightarrow> bool "  where 
     " is_elf32_null_entry ent = (    
 ((unat(elf32_st_name   ent)) =( 0 :: nat))
    \<and> ((unat(elf32_st_value   ent) =( 0 :: nat))
    \<and> ((unat(elf32_st_size   ent) =( 0 :: nat))
    \<and> ((unat(elf32_st_info   ent) =( 0 :: nat))
    \<and> ((unat(elf32_st_other   ent) =( 0 :: nat))
    \<and> (unat(elf32_st_shndx   ent) =( 0 :: nat)))))))"

    
(** [is_elf64_null_entry ent] tests whether [ent] is a null symbol table entry,
  * i.e. all fields set to [0].
  *)
(*val is_elf64_null_entry : elf64_symbol_table_entry -> bool*)
definition is_elf64_null_entry  :: " elf64_symbol_table_entry \<Rightarrow> bool "  where 
     " is_elf64_null_entry ent = (    
 ((unat(elf64_st_name   ent)) =( 0 :: nat))
    \<and> ((unat(elf64_st_value   ent) =( 0 :: nat))
    \<and> ((unat(elf64_st_size   ent) =( 0 :: nat))
    \<and> ((unat(elf64_st_info   ent) =( 0 :: nat))
    \<and> ((unat(elf64_st_other   ent) =( 0 :: nat))
    \<and> (unat(elf64_st_shndx   ent) =( 0 :: nat)))))))"


(** Printing symbol table entries *)

type_synonym symtab_print_bundle ="
  (nat \<Rightarrow> string) * (nat \<Rightarrow> string)"

(** [string_of_elf32_symbol_table_entry ent] produces a string based representation
  * of symbol table entry [ent].
  *)
(*val string_of_elf32_symbol_table_entry : elf32_symbol_table_entry -> string*)
  
(** [string_of_elf64_symbol_table_entry ent] produces a string based representation
  * of symbol table entry [ent].
  *)
(*val string_of_elf64_symbol_table_entry : elf64_symbol_table_entry -> string*)

(** [string_of_elf32_symbol_table stbl] produces a string based representation
  * of symbol table [stbl].
  *)
(*val string_of_elf32_symbol_table : elf32_symbol_table -> string*)
  
(** [elf64_null_symbol_table_entry] is the null symbol table entry, with all
  * fields set to zero.
  *)
(*val elf64_null_symbol_table_entry : elf64_symbol_table_entry*)
definition elf64_null_symbol_table_entry  :: " elf64_symbol_table_entry "  where 
     " elf64_null_symbol_table_entry = (
  (| elf64_st_name  = (Elf_Types_Local.uint32_of_nat(( 0 :: nat)))
   , elf64_st_info  = (Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)))
   , elf64_st_other = (Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)))
   , elf64_st_shndx = (Elf_Types_Local.uint16_of_nat(( 0 :: nat)))
   , elf64_st_value = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))
   , elf64_st_size  = (of_int (int (( 0 :: nat))))
   |) )"


(*val string_of_elf64_symbol_table : elf64_symbol_table -> string*)

(** Reading in symbol table (entries) *)

(** [read_elf32_symbol_table_entry endian bs0] reads an ELF symbol table entry
  * record from byte sequence [bs0] assuming endianness [endian], returning the
  * remainder of the byte sequence.  Fails if the byte sequence is not long enough.
  *)
(*val read_elf32_symbol_table_entry : endianness -> byte_sequence ->
  error (elf32_symbol_table_entry * byte_sequence)*)
definition read_elf32_symbol_table_entry  :: " endianness \<Rightarrow> byte_sequence \<Rightarrow>(elf32_symbol_table_entry*byte_sequence)error "  where 
     " read_elf32_symbol_table_entry endian bs0 = (
  read_elf32_word endian bs0 >>= (\<lambda> (st_name, bs0) . 
  read_elf32_addr endian bs0 >>= (\<lambda> (st_value, bs0) . 
  read_elf32_word endian bs0 >>= (\<lambda> (st_size, bs0) . 
  read_unsigned_char endian bs0 >>= (\<lambda> (st_info, bs0) . 
  read_unsigned_char endian bs0 >>= (\<lambda> (st_other, bs0) . 
  read_elf32_half endian bs0 >>= (\<lambda> (st_shndx, bs0) . 
    error_return ((| elf32_st_name = st_name, elf32_st_value = st_value,
                 elf32_st_size = st_size, elf32_st_info = st_info,
                 elf32_st_other = st_other, elf32_st_shndx = st_shndx |), bs0))))))))"


(*val bytes_of_elf32_symbol_table_entry : endianness ->
  elf32_symbol_table_entry -> byte_sequence*)
definition bytes_of_elf32_symbol_table_entry  :: " endianness \<Rightarrow> elf32_symbol_table_entry \<Rightarrow> byte_sequence "  where 
     " bytes_of_elf32_symbol_table_entry endian entry = (
  Byte_sequence.from_byte_lists [
    bytes_of_elf32_word endian(elf32_st_name   entry)
  , bytes_of_elf32_addr endian(elf32_st_value   entry)
  , bytes_of_elf32_word endian(elf32_st_size   entry)
  , bytes_of_unsigned_char(elf32_st_info   entry)
  , bytes_of_unsigned_char(elf32_st_other   entry)
  , bytes_of_elf32_half endian(elf32_st_shndx   entry)
  ])"


(** [read_elf64_symbol_table_entry endian bs0] reads an ELF symbol table entry
  * record from byte sequence [bs0] assuming endianness [endian], returning the
  * remainder of the byte sequence.  Fails if the byte sequence is not long enough.
  *)       
(*val read_elf64_symbol_table_entry : endianness -> byte_sequence ->
  error (elf64_symbol_table_entry * byte_sequence)*)
definition read_elf64_symbol_table_entry  :: " endianness \<Rightarrow> byte_sequence \<Rightarrow>(elf64_symbol_table_entry*byte_sequence)error "  where 
     " read_elf64_symbol_table_entry endian bs0 = (
  read_elf64_word endian bs0 >>= (\<lambda> (st_name, bs0) . 
  read_unsigned_char endian bs0 >>= (\<lambda> (st_info, bs0) . 
  read_unsigned_char endian bs0 >>= (\<lambda> (st_other, bs0) . 
  read_elf64_half endian bs0 >>= (\<lambda> (st_shndx, bs0) . 
  read_elf64_addr endian bs0 >>= (\<lambda> (st_value, bs0) . 
  read_elf64_xword endian bs0 >>= (\<lambda> (st_size, bs0) . 
    error_return ((| elf64_st_name = st_name, elf64_st_info = st_info,
                 elf64_st_other = st_other, elf64_st_shndx = st_shndx,
                 elf64_st_value = st_value, elf64_st_size = st_size |), bs0))))))))"


(*val bytes_of_elf64_symbol_table_entry : endianness ->
  elf64_symbol_table_entry -> byte_sequence*)
definition bytes_of_elf64_symbol_table_entry  :: " endianness \<Rightarrow> elf64_symbol_table_entry \<Rightarrow> byte_sequence "  where 
     " bytes_of_elf64_symbol_table_entry endian entry = (
  Byte_sequence.from_byte_lists [
    bytes_of_elf64_word endian(elf64_st_name   entry)
  , bytes_of_unsigned_char(elf64_st_info   entry)
  , bytes_of_unsigned_char(elf64_st_other   entry)
  , bytes_of_elf64_half endian(elf64_st_shndx   entry)
  , bytes_of_elf64_addr  endian(elf64_st_value   entry)
  , bytes_of_elf64_xword endian(elf64_st_size   entry)
  ])"


(** [read_elf32_symbol_table endian bs0] reads a symbol table from byte sequence
  * [bs0] assuming endianness [endian].  Assumes [bs0]'s length modulo the size
  * of a symbol table entry is 0.  Fails otherwise.
  *)
(*val read_elf32_symbol_table : endianness -> byte_sequence -> error elf32_symbol_table*)
function (sequential,domintros)  read_elf32_symbol_table  :: " endianness \<Rightarrow> byte_sequence \<Rightarrow>((elf32_symbol_table_entry)list)error "  where 
     " read_elf32_symbol_table endian bs0 = (
  if Byte_sequence.length0 bs0 =( 0 :: nat) then
    error_return []
  else
    read_elf32_symbol_table_entry endian bs0 >>= (\<lambda> (head, bs0) . 
    read_elf32_symbol_table endian bs0 >>= (\<lambda> tail . 
    error_return (head # tail))))" 
by pat_completeness auto

    
(** [read_elf64_symbol_table endian bs0] reads a symbol table from byte sequence
  * [bs0] assuming endianness [endian].  Assumes [bs0]'s length modulo the size
  * of a symbol table entry is 0.  Fails otherwise.
  *)
(*val read_elf64_symbol_table : endianness -> byte_sequence -> error elf64_symbol_table*)
function (sequential,domintros)  read_elf64_symbol_table  :: " endianness \<Rightarrow> byte_sequence \<Rightarrow>((elf64_symbol_table_entry)list)error "  where 
     " read_elf64_symbol_table endian bs0 = (
  if Byte_sequence.length0 bs0 =( 0 :: nat) then
    error_return []
  else
    read_elf64_symbol_table_entry endian bs0 >>= (\<lambda> (head, bs0) . 
    read_elf64_symbol_table endian bs0 >>= (\<lambda> tail . 
    error_return (head # tail))))" 
by pat_completeness auto


(** Association map of symbol name, symbol type, symbol size, symbol address
  * and symbol binding.
  * A PPCMemism.
  *)
type_synonym symbol_address_map
  =" (string * (nat * nat * nat * nat)) list "

(** [get_elf32_symbol_image_address symtab stbl] extracts the symbol address map
  * from the symbol table [symtab] using the string table [stbl].
  * A PPCMemism.
  *)
(*val get_elf32_symbol_image_address : elf32_symbol_table -> string_table ->
  error symbol_address_map*)
definition get_elf32_symbol_image_address  :: "(elf32_symbol_table_entry)list \<Rightarrow> string_table \<Rightarrow>((string*(nat*nat*nat*nat))list)error "  where 
     " get_elf32_symbol_image_address symtab strtab = (
  mapM (\<lambda> entry . 
    (let name1 = (unat(elf32_st_name   entry)) in
    (let addr = (unat(elf32_st_value   entry)) in
    (let size3 = (unat(elf32_st_size   entry) *( 8 :: nat)) in
    (let typ1  = (extract_symbol_type(elf32_st_info   entry)) in
    (let bnd  = (extract_symbol_binding(elf32_st_info   entry)) in
      String_table.get_string_at name1 strtab >>= (\<lambda> str . 
      error_return (str, (typ1, size3, addr, bnd))))))))
  ) symtab )"


(** [get_elf64_symbol_image_address symtab stbl] extracts the symbol address map
  * from the symbol table [symtab] using the string table [stbl].
  * A PPCMemism.
  *)
(*val get_elf64_symbol_image_address : elf64_symbol_table -> string_table ->
  error symbol_address_map*)
definition get_elf64_symbol_image_address  :: "(elf64_symbol_table_entry)list \<Rightarrow> string_table \<Rightarrow>((string*(nat*nat*nat*nat))list)error "  where 
     " get_elf64_symbol_image_address symtab strtab = (
  mapM (\<lambda> entry . 
    (let name1 = (unat(elf64_st_name   entry)) in
    (let addr = (unat(elf64_st_value   entry)) in
    (let size3 = (unat(elf64_st_size   entry)) in
    (let typ1  = (extract_symbol_type(elf64_st_info   entry)) in
    (let bnd  = (extract_symbol_binding(elf64_st_info   entry)) in 
      String_table.get_string_at name1 strtab >>= (\<lambda> str . 
      error_return (str, (typ1, size3, addr, bnd))))))))
  ) symtab )"


(** [get_el32_symbol_type ent] extracts the symbol type from symbol table entry
  * [ent].
  *)
(*val get_elf32_symbol_type : elf32_symbol_table_entry -> natural*)
definition get_elf32_symbol_type  :: " elf32_symbol_table_entry \<Rightarrow> nat "  where 
     " get_elf32_symbol_type syment = ( extract_symbol_type(elf32_st_info   syment))"


(** [get_el64_symbol_type ent] extracts the symbol type from symbol table entry
  * [ent].
  *)
(*val get_elf64_symbol_type : elf64_symbol_table_entry -> natural*)
definition get_elf64_symbol_type  :: " elf64_symbol_table_entry \<Rightarrow> nat "  where 
     " get_elf64_symbol_type syment = ( extract_symbol_type(elf64_st_info   syment))"


(** [get_el32_symbol_binding ent] extracts the symbol binding from symbol table entry
  * [ent].
  *)
(*val get_elf32_symbol_binding : elf32_symbol_table_entry -> natural*)
definition get_elf32_symbol_binding  :: " elf32_symbol_table_entry \<Rightarrow> nat "  where 
     " get_elf32_symbol_binding syment = ( extract_symbol_binding(elf32_st_info   syment))"


(** [get_el64_symbol_binding ent] extracts the symbol binding from symbol table entry
  * [ent].
  *)
(*val get_elf64_symbol_binding : elf64_symbol_table_entry -> natural*)
definition get_elf64_symbol_binding  :: " elf64_symbol_table_entry \<Rightarrow> nat "  where 
     " get_elf64_symbol_binding syment = ( extract_symbol_binding(elf64_st_info   syment))"

end