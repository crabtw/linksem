chapter {* Generated by Lem from abis/abis.lem. *}

theory "Abis" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_list" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_bool" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_maybe" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_string" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_assert_extra" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Show" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Error" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_types_native_uint" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_header" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_program_header_table" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_section_header_table" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_interpreted_section" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Elf_file" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Memory_image" 
	 "Abi_utilities" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_aarch64_relocation" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_amd64_relocation" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_amd64" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_aarch64_le" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_power64" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_power64_relocation" 

begin 

(** The [abis] module is the top-level module for all ABI related code, including
  * some generic functionality that works across all ABIs, and a primitive attempt
  * at abstracting over ABIs for purposes of linking.
  *)

(*open import Basic_classes*)
(*open import Bool*)
(*open import Num*)
(*open import Maybe*)
(*open import List*)
(*open import String*)
(*open import Show*)
(*open import Assert_extra*)
(*open import Error*)

(*open import Elf_file*)
(*open import Elf_header*)
(*open import Elf_interpreted_section*)
(*open import Elf_program_header_table*)
(*open import Elf_section_header_table*)
(*open import Memory_image*)

(*open import Abi_amd64*)
(*open import Abi_amd64_relocation*)

(*open import Abi_aarch64_le*)
(*open import Abi_aarch64_relocation*)

(*open import Abi_power64*)
(*open import Abi_power64_relocation*)

(*open import Abi_utilities*)
(*open import Elf_types_native_uint*)

(** Relocation operators and their validity on a given platform *)

(*val is_valid_abi_aarch64_relocation_operator : relocation_operator -> bool*)
fun is_valid_abi_aarch64_relocation_operator  :: " relocation_operator \<Rightarrow> bool "  where 
     " is_valid_abi_aarch64_relocation_operator Page = ( True )"
|" is_valid_abi_aarch64_relocation_operator G = ( True )"
|" is_valid_abi_aarch64_relocation_operator GDat = ( True )"
|" is_valid_abi_aarch64_relocation_operator GLDM = ( True )"
|" is_valid_abi_aarch64_relocation_operator DTPRel = ( True )"
|" is_valid_abi_aarch64_relocation_operator GTPRel = ( True )"
|" is_valid_abi_aarch64_relocation_operator TPRel = ( True )"
|" is_valid_abi_aarch64_relocation_operator GTLSDesc = ( True )"
|" is_valid_abi_aarch64_relocation_operator Delta = ( True )"
|" is_valid_abi_aarch64_relocation_operator LDM = ( True )"
|" is_valid_abi_aarch64_relocation_operator TLSDesc = ( True )"
|" is_valid_abi_aarch64_relocation_operator Indirect = ( True )"
|" is_valid_abi_aarch64_relocation_operator _ = ( False )" 
declare is_valid_abi_aarch64_relocation_operator.simps [simp del]

  
(*val is_valid_abi_aarch64_relocation_operator2 : relocation_operator2 -> bool*)
fun is_valid_abi_aarch64_relocation_operator2  :: " relocation_operator2 \<Rightarrow> bool "  where 
     " is_valid_abi_aarch64_relocation_operator2 GTLSIdx = ( True )" 
declare is_valid_abi_aarch64_relocation_operator2.simps [simp del]


(*val is_valid_abi_amd64_relocation_operator : relocation_operator -> bool*)
fun is_valid_abi_amd64_relocation_operator  :: " relocation_operator \<Rightarrow> bool "  where 
     " is_valid_abi_amd64_relocation_operator Indirect = ( True )"
|" is_valid_abi_amd64_relocation_operator _ = ( False )" 
declare is_valid_abi_amd64_relocation_operator.simps [simp del]

  
(*val is_valid_abi_amd64_relocation_operator2 : relocation_operator2 -> bool*)
definition is_valid_abi_amd64_relocation_operator2  :: " relocation_operator2 \<Rightarrow> bool "  where 
     " is_valid_abi_amd64_relocation_operator2 _ = ( False )"


(*val is_valid_abi_power64_relocation_operator : relocation_operator -> bool*)
definition is_valid_abi_power64_relocation_operator  :: " relocation_operator \<Rightarrow> bool "  where 
     " is_valid_abi_power64_relocation_operator op1 = ( False )"
 (* TODO *)

(*val is_valid_abi_power64_relocation_operator2 : relocation_operator2 -> bool*)
definition is_valid_abi_power64_relocation_operator2  :: " relocation_operator2 \<Rightarrow> bool "  where 
     " is_valid_abi_power64_relocation_operator2 _ = ( False )"


(** Misc. ABI related stuff *)

datatype any_abi_feature = Amd64AbiFeature " amd64_abi_feature "
                     | Aarch64LeAbiFeature " aarch64_le_abi_feature "

(*val anyAbiFeatureToNaturalList : any_abi_feature -> list natural*)
fun anyAbiFeatureToNaturalList  :: " any_abi_feature \<Rightarrow>(nat)list "  where 
     " anyAbiFeatureToNaturalList (Amd64AbiFeature(af)) = (( 0 :: nat) # (amd64AbiFeatureConstructorToNaturalList af))"
|" anyAbiFeatureToNaturalList (Aarch64LeAbiFeature(af)) = (( 1 :: nat) # (aarch64LeAbiFeatureConstructorToNaturalList af))" 
declare anyAbiFeatureToNaturalList.simps [simp del]


definition instance_Memory_image_ToNaturalList_Abis_any_abi_feature_dict  :: "(any_abi_feature)ToNaturalList_class "  where 
     " instance_Memory_image_ToNaturalList_Abis_any_abi_feature_dict = ((|

  toNaturalList_method = anyAbiFeatureToNaturalList |) )"


(*val anyAbiFeatureCompare : any_abi_feature -> any_abi_feature -> Basic_classes.ordering*)
definition anyAbiFeatureCompare  :: " any_abi_feature \<Rightarrow> any_abi_feature \<Rightarrow> ordering "  where 
     " anyAbiFeatureCompare f1 f2 = ( 
    (case  (anyAbiFeatureToNaturalList f1, anyAbiFeatureToNaturalList f2) of
        ([], []) => failwith (''impossible: any-ABI feature has empty natural list (case 0)'')
    |   (_, [])  => failwith (''impossible: any-ABI feature has empty natural list (case 1)'')
    |   ([], _)  => failwith (''impossible: any-ABI feature has empty natural list (case 2)'')
    |   ((hd1 # tl1), (hd2 # tl2)) => 
            if hd1 < hd2 then LT else if hd1 > hd2 then GT else
                (case  (f1, f2) of
                    (Amd64AbiFeature(af1), Amd64AbiFeature(af2)) => Abi_amd64.abiFeatureCompare0 af1 af2
                   |(Aarch64LeAbiFeature(af1), Aarch64LeAbiFeature(af2)) => abiFeatureCompare af1 af2
                   | _ => failwith (''impossible: tag constructors not equal but natural list heads were equal'')
                )
    ))"


definition instance_Basic_classes_Ord_Abis_any_abi_feature_dict  :: "(any_abi_feature)Ord_class "  where 
     " instance_Basic_classes_Ord_Abis_any_abi_feature_dict = ((|

  compare_method = anyAbiFeatureCompare,

  isLess_method = (\<lambda> f1 .  (\<lambda> f2 .  (anyAbiFeatureCompare f1 f2 = LT))),

  isLessEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (anyAbiFeatureCompare f1 f2) ({LT, EQ}))),

  isGreater_method = (\<lambda> f1 .  (\<lambda> f2 .  (anyAbiFeatureCompare f1 f2 = GT))),

  isGreaterEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (anyAbiFeatureCompare f1 f2) ({GT, EQ})))|) )"


definition make_elf64_header  :: " nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> 'a \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> nat \<Rightarrow> elf64_header "  where 
     " make_elf64_header data osabi abiv ma t entry shoff phoff phnum shnum shstrndx = (
      (| elf64_ident    = [elf_mn_mag0, elf_mn_mag1, elf_mn_mag2, elf_mn_mag3, 
                           Elf_Types_Local.unsigned_char_of_nat elf_class_64, 
                           Elf_Types_Local.unsigned_char_of_nat data,
                           Elf_Types_Local.unsigned_char_of_nat elf_ev_current,
                           Elf_Types_Local.unsigned_char_of_nat osabi,
                           Elf_Types_Local.unsigned_char_of_nat abiv,
                           Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)),
                           Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)),
                           Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)),
                           Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)),
                           Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)),
                           Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)),
                           Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat))]
       , elf64_type     = (Elf_Types_Local.uint16_of_nat t)
       , elf64_machine  = (Elf_Types_Local.uint16_of_nat ma)
       , elf64_version  = (Elf_Types_Local.uint32_of_nat elf_ev_current)
       , elf64_entry    = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))
       , elf64_phoff    = (Elf_Types_Local.uint64_of_nat phoff)
       , elf64_shoff    = (Elf_Types_Local.uint64_of_nat shoff)
       , elf64_flags    = (Elf_Types_Local.uint32_of_nat(( 0 :: nat)))
       , elf64_ehsize   = (Elf_Types_Local.uint16_of_nat(( 64 :: nat)))
       , elf64_phentsize= (Elf_Types_Local.uint16_of_nat(( 56 :: nat)))
       , elf64_phnum    = (Elf_Types_Local.uint16_of_nat phnum)
       , elf64_shentsize= (Elf_Types_Local.uint16_of_nat(( 64 :: nat)))
       , elf64_shnum    = (Elf_Types_Local.uint16_of_nat shnum)
       , elf64_shstrndx = (Elf_Types_Local.uint16_of_nat shstrndx)
       |) )"


(*val make_load_phdrs : forall 'abifeature. abi 'abifeature -> annotated_memory_image 'abifeature -> list (natural * elf64_interpreted_section) -> list elf64_program_header_table_entry*)
definition make_load_phdrs  :: " 'abifeature abi \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow>(nat*elf64_interpreted_section)list \<Rightarrow>(elf64_program_header_table_entry)list "  where 
     " make_load_phdrs a img section_pairs_bare_sorted_by_address = ( 
    (let (phdr_flags_from_section_flags :: nat \<Rightarrow> nat) = (\<lambda> section_flags .  
        unsafe_natural_lor elf_pf_r (unsafe_natural_lor 
            (if flag_is_set section_flags shf_write then elf_pf_w else( 0 :: nat))
            (if flag_is_set section_flags shf_execinstr then elf_pf_x else( 0 :: nat))))
    in
    (let maybe_extend_phdr = (\<lambda> phdr .  \<lambda> isec .  ( 
        (let new_p_type = (unat(elf64_p_type   phdr))
        in
        (let new_p_flags = (phdr_flags_from_section_flags(elf64_section_flags   isec)) 
        in
        if \<not> (new_p_flags = (unat(elf64_p_flags   phdr))) then None
        else
        (let new_p_offset = (unat(elf64_p_offset   phdr))
        in
        (let new_p_vaddr = (unat(elf64_p_vaddr   phdr))
        in
        (let new_p_paddr = (unat(elf64_p_paddr   phdr)) in
        (* The new filesz is the file end offset of this section,
         * minus the existing file start offset of the phdr. 
         * Check that the new section begins after the old offset+filesz. *)
        if(elf64_section_offset   isec) < ((unat(elf64_p_offset   phdr)) + (unat(elf64_p_filesz   phdr)))
        then None (* (offset went backwards) *)
        else 
        (let new_p_filesz = (((elf64_section_offset   isec) + (if(elf64_section_type   isec) = sht_progbits then(elf64_section_size   isec) else( 0 :: nat)))
        - unat(elf64_p_offset   phdr))
        in 
        (* The new memsz is the virtual address end address of this section,
         * minus the existing start vaddr of the phdr. 
         * Check that the new section begins after the old vaddr+memsz. *)
        if(elf64_section_addr   isec) < ((unat(elf64_p_vaddr   phdr)) + (unat(elf64_p_memsz   phdr)))
        then None (* (vaddr went backwards) *)
        else 
        (let new_p_memsz = (((elf64_section_addr   isec) +(elf64_section_size   isec)) - unat(elf64_p_vaddr   phdr))
        in
        (let new_p_align =  (lcm (unat(elf64_p_align   phdr))(elf64_section_align   isec))
        in
        Some
          (| elf64_p_type   = (Elf_Types_Local.uint32_of_nat new_p_type)
           , elf64_p_flags  = (Elf_Types_Local.uint32_of_nat new_p_flags)
           , elf64_p_offset = (Elf_Types_Local.uint64_of_nat new_p_offset)
           , elf64_p_vaddr  = (Elf_Types_Local.uint64_of_nat new_p_vaddr)
           , elf64_p_paddr  = (Elf_Types_Local.uint64_of_nat new_p_paddr)
           , elf64_p_filesz = (of_int (int new_p_filesz))
           , elf64_p_memsz  = (of_int (int new_p_memsz))
           , elf64_p_align  = (of_int (int new_p_align))
           |)))))))))
    ))
    in
    (let new_phdr = (\<lambda> isec .  
      (| elf64_p_type   = (Elf_Types_Local.uint32_of_nat elf_pt_load) (** Type of the segment *)
       , elf64_p_flags  = (Elf_Types_Local.uint32_of_nat (phdr_flags_from_section_flags(elf64_section_flags   isec))) (** Segment flags *)
       , elf64_p_offset = (Elf_Types_Local.uint64_of_nat (round_down_to(maxpagesize   a)(elf64_section_offset   isec))) (** Offset from beginning of file for segment *)
       , elf64_p_vaddr  = (Elf_Types_Local.uint64_of_nat (round_down_to(maxpagesize   a)(elf64_section_addr   isec)))  (** Virtual address for segment in memory *)
       , elf64_p_paddr  = (Elf_Types_Local.uint64_of_nat(( 0 :: nat))) (** Physical address for segment *)
       , elf64_p_filesz = (of_int (int (if(elf64_section_type   isec) = sht_nobits then( 0 :: nat) else(elf64_section_size   isec)))) (** Size of segment in file, in bytes *)
       , elf64_p_memsz  = (of_int (int(elf64_section_size   isec))) (** Size of segment in memory image, in bytes *)
       , elf64_p_align  = (of_int (int(elf64_section_align   isec))) (** Segment alignment memory for memory and file *)
       |))
    in
    (* accumulate sections into the phdr *)
    (let rev_list = (List.foldl (\<lambda> accum_phdr_list .  (\<lambda> (idx, isec) .  (
        (* Do we have a current phdr? *)
        (case  accum_phdr_list of
            [] => (* no, so make one *)
                [new_phdr isec]
            | current_phdr # more1 => 
                (* can we extend it with the current section? *)
                (case  maybe_extend_phdr current_phdr isec of
                    None => (new_phdr isec) # (current_phdr # more1)
                    | Some phdr => phdr # more1
                )
        )
    ))) [] section_pairs_bare_sorted_by_address)
    in
    List.rev rev_list)))))"

    
(*val make_default_phdrs : forall 'abifeature. abi 'abifeature -> natural (* file type *) -> annotated_memory_image 'abifeature -> list (natural * elf64_interpreted_section) -> list elf64_program_header_table_entry*)
definition make_default_phdrs  :: " 'abifeature abi \<Rightarrow> nat \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow>(nat*elf64_interpreted_section)list \<Rightarrow>(elf64_program_header_table_entry)list "  where 
     " make_default_phdrs a t img section_pairs_bare_sorted_by_address = ( 
    (* FIXME: do the shared object and dyn. exec. stuff too *)
    make_load_phdrs a img section_pairs_bare_sorted_by_address )"


(*val find_start_symbol_address : forall 'abifeature. Ord 'abifeature, ToNaturalList 'abifeature => annotated_memory_image 'abifeature -> maybe natural*)
definition find_start_symbol_address  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow>(nat)option "  where 
     " find_start_symbol_address dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature img = ( 
    (* Do we have a symbol called _start? *)
    (let all_defs = (Memory_image_orderings.defined_symbols_and_ranges 
  dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature img)
    in
    (let get_entry_point = (\<lambda> (maybe_range, symbol_def) .  
        if(def_symname   symbol_def) = (''_start'')
        then Some (maybe_range, symbol_def) 
        else None
    )
    in
    (let all_entry_points = (Lem_list.mapMaybe get_entry_point all_defs)
    in
    (case  all_entry_points of
        [(maybe_range, symbol_def)] =>
            (case  maybe_range of
                Some (el_name, (el_off, len)) => 
                    (case  (elements   img) el_name of
                        None => failwith (''_start symbol defined in nonexistent element'')
                        | Some el_rec => 
                            (case (startpos   el_rec) of
                                None => (*let _ = Missing_pervasives.errln warning: saw `_start' in element with no assigned address in *)None
                                | Some x => (* success! *) Some (x + el_off)
                            )
                    )
                | _ => (*let _ = Missing_pervasives.errln warning: `_start' symbol with no range in*) None
            )
        | [] => (* no _start symbol *) None
        | _ => (*let _ = Missing_pervasives.errln (warning: saw multiple `_start' symbols:  ^
            (let (ranges, defs) = unzip all_entry_points in show ranges)) in *)None
    )))))"



(* null_abi captures ABI details common to all ELF-based, System V-based systems.
 * HACK: for now, specialise to 64-bit ABIs. *)
(*val null_abi : abi any_abi_feature*) 
definition null_abi  :: "(any_abi_feature)abi "  where 
     " null_abi = ( (|
      is_valid_elf_header = is_valid_elf64_header
    , make_elf_header = (make_elf64_header elf_data_2lsb elf_osabi_none(( 0 :: nat)) elf_ma_none)
    , reloc = noop_reloc
    , section_is_special = elf_section_is_special
    , section_is_large = (\<lambda> s .  (\<lambda> f .  False))
    , maxpagesize =((( 2 :: nat) *( 256 :: nat)) *( 4096 :: nat)) (* 2MB; bit of a guess, based on gdb and prelink code *)
    , minpagesize =(( 1024 :: nat)) (* bit of a guess again *)
    , commonpagesize =(( 4096 :: nat))
    , symbol_is_generated_by_linker = (\<lambda> symname .  symname = (''_GLOBAL_OFFSET_TABLE_''))
    , make_phdrs = make_default_phdrs
    , max_phnum =(( 2 :: nat))
    , guess_entry_point = 
  (find_start_symbol_address
     instance_Basic_classes_Ord_Abis_any_abi_feature_dict
     instance_Memory_image_ToNaturalList_Abis_any_abi_feature_dict)
    |) )"


(*val sysv_amd64_std_abi : abi any_abi_feature*)
definition sysv_amd64_std_abi  :: "(any_abi_feature)abi "  where 
     " sysv_amd64_std_abi = ( 
   (| is_valid_elf_header = header_is_amd64
    , make_elf_header = (make_elf64_header elf_data_2lsb elf_osabi_none(( 0 :: nat)) elf_ma_x86_64)
    , reloc = (amd64_reloc instance_Basic_classes_Ord_Abis_any_abi_feature_dict
    instance_Memory_image_ToNaturalList_Abis_any_abi_feature_dict)
    , section_is_special = section_is_special0
    , section_is_large = (\<lambda> s .  (\<lambda> f .  flag_is_set shf_x86_64_large(elf64_section_flags   s)))
    , maxpagesize =(( 65536 :: nat))
    , minpagesize =(( 4096 :: nat))
    , commonpagesize =(( 4096 :: nat))
      (* XXX: DPM, changed from explicit reference to null_abi field due to problems in HOL4. *)
    , symbol_is_generated_by_linker = (\<lambda> symname .  symname = (''_GLOBAL_OFFSET_TABLE_''))
    , make_phdrs = make_default_phdrs
    , max_phnum =(( 5 :: nat))
    , guess_entry_point = 
  (find_start_symbol_address
     instance_Basic_classes_Ord_Abis_any_abi_feature_dict
     instance_Memory_image_ToNaturalList_Abis_any_abi_feature_dict)
    |) )"


(*val sysv_aarch64_le_std_abi : abi any_abi_feature*)
definition sysv_aarch64_le_std_abi  :: "(any_abi_feature)abi "  where 
     " sysv_aarch64_le_std_abi = ( 
   (| is_valid_elf_header = header_is_aarch64_le
    , make_elf_header = (make_elf64_header elf_data_2lsb elf_osabi_none(( 0 :: nat)) elf_ma_aarch64)
    , reloc = aarch64_le_reloc
    , section_is_special = section_is_special0
    , section_is_large = (\<lambda> _ .  (\<lambda> _ .  False))
    , maxpagesize =((( 2 :: nat) *( 256 :: nat)) *( 4096 :: nat)) (* 2MB; bit of a guess, based on gdb and prelink code *)
    , minpagesize =(( 1024 :: nat)) (* bit of a guess again *)
    , commonpagesize =(( 4096 :: nat))
    , symbol_is_generated_by_linker = (\<lambda> symname .  symname = (''_GLOBAL_OFFSET_TABLE_''))
    , make_phdrs = make_default_phdrs
    , max_phnum =(( 5 :: nat))
    , guess_entry_point = 
  (find_start_symbol_address
     instance_Basic_classes_Ord_Abis_any_abi_feature_dict
     instance_Memory_image_ToNaturalList_Abis_any_abi_feature_dict)
    |) )"


(*val all_abis : list (abi any_abi_feature)*)
definition all_abis  :: "((any_abi_feature)abi)list "  where 
     " all_abis = ( [sysv_amd64_std_abi, sysv_aarch64_le_std_abi, null_abi])"


end